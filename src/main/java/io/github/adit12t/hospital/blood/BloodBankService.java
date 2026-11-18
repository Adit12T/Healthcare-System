package io.github.adit12t.hospital.blood;

import io.github.adit12t.hospital.blood.BloodIssueRepository;
import io.github.adit12t.hospital.blood.DonationRepository;
import io.github.adit12t.hospital.blood.DonorRepository;
import io.github.adit12t.hospital.patient.Patient;
import io.github.adit12t.hospital.patient.PatientRepository;
import io.github.adit12t.hospital.web.NotFoundException;
import io.github.adit12t.hospital.web.RuleViolation;
import org.springframework.stereotype.Service;
import org.springframework.transaction.support.TransactionTemplate;

import java.time.Clock;
import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;
import java.time.temporal.ChronoUnit;
import java.util.EnumMap;
import java.util.List;
import java.util.Map;
import java.util.concurrent.locks.ReentrantLock;

/**
 * Donors, donations and issues. Stock per group is donations minus issues. Changes to stock run one at a
 * time inside a transaction, so two simultaneous issues can't take the same units (single-instance deployment).
 */
@Service
public class BloodBankService {

    public static final int MIN_AGE = 18, MAX_AGE = 65, MIN_WEIGHT_KG = 50, DAYS_BETWEEN_DONATIONS = 56;

    private final DonorRepository donors;
    private final DonationRepository donations;
    private final BloodIssueRepository issues;
    private final PatientRepository patients;
    private final TransactionTemplate tx;
    private final Clock clock;
    private final ReentrantLock stockLock = new ReentrantLock();

    public BloodBankService(DonorRepository donors, DonationRepository donations, BloodIssueRepository issues,
                            PatientRepository patients, TransactionTemplate tx, Clock clock) {
        this.donors = donors;
        this.donations = donations;
        this.issues = issues;
        this.patients = patients;
        this.tx = tx;
        this.clock = clock;
    }

    /** Units on hand for every group (zero where there are none). */
    public Map<BloodGroup, Integer> stock() {
        Map<BloodGroup, Integer> stock = new EnumMap<>(BloodGroup.class);
        for (BloodGroup g : BloodGroup.values()) {
            stock.put(g, 0);
        }
        for (Object[] row : donations.unitsByGroup()) {
            stock.merge((BloodGroup) row[0], ((Number) row[1]).intValue(), Integer::sum);
        }
        for (Object[] row : issues.unitsByGroup()) {
            stock.merge((BloodGroup) row[0], -((Number) row[1]).intValue(), Integer::sum);
        }
        return stock;
    }

    public Donor registerDonor(String name, LocalDate dob, BloodGroup group, int weightKg, String phone) {
        int age = Period.between(dob, LocalDate.now(clock)).getYears();
        if (age < MIN_AGE || age > MAX_AGE) {
            throw new RuleViolation("Donors must be " + MIN_AGE + " to " + MAX_AGE + " years old.");
        }
        if (weightKg < MIN_WEIGHT_KG) {
            throw new RuleViolation("Donors must weigh at least " + MIN_WEIGHT_KG + " kg.");
        }
        return donors.save(new Donor(name.strip(), dob, group, weightKg, phone.strip(), LocalDateTime.now(clock)));
    }

    public Donation recordDonation(long donorId, int units) {
        if (units < 1 || units > 2) {
            throw new RuleViolation("A donation is 1 or 2 units.");
        }
        return locked(() -> {
            Donor donor = donors.findById(donorId).orElseThrow(() -> new NotFoundException("Donor"));
            LocalDate today = LocalDate.now(clock);
            int age = Period.between(donor.getDateOfBirth(), today).getYears();
            if (age > MAX_AGE) {
                throw new RuleViolation(donor.getFullName() + " is over the maximum donor age.");
            }
            donations.findFirstByDonorIdOrderByDonatedOnDesc(donorId).ifPresent(last -> {
                long days = ChronoUnit.DAYS.between(last.getDonatedOn(), today);
                if (days < DAYS_BETWEEN_DONATIONS) {
                    throw new RuleViolation(donor.getFullName() + " donated " + days + " days ago; the minimum gap is "
                            + DAYS_BETWEEN_DONATIONS + " days.");
                }
            });
            return donations.save(new Donation(donor, units, today));
        });
    }

    /** Issues compatible units to a patient whose blood group is on file, never more than the stock. */
    public BloodIssue issue(long patientId, BloodGroup group, int units, String issuedBy) {
        if (units < 1 || units > 10) {
            throw new RuleViolation("Issue between 1 and 10 units at a time.");
        }
        return locked(() -> {
            Patient patient = patients.findById(patientId).orElseThrow(() -> new NotFoundException("Patient"));
            if (patient.getBloodGroup() == null) {
                throw new RuleViolation("Record " + patient.getFullName() + "'s blood group before issuing blood.");
            }
            if (!patient.getBloodGroup().canReceiveFrom(group)) {
                throw new RuleViolation(group.label() + " is not compatible with " + patient.getFullName()
                        + "'s blood group (" + patient.getBloodGroup().label() + ").");
            }
            int available = stock().get(group);
            if (units > available) {
                throw new RuleViolation("Only " + available + " unit(s) of " + group.label() + " in stock.");
            }
            return issues.save(new BloodIssue(patient, group, units, LocalDate.now(clock), issuedBy));
        });
    }

    public List<BloodIssue> recentIssues() {
        return issues.findTop20ByOrderByIdDesc();
    }

    private <T> T locked(java.util.function.Supplier<T> work) {
        stockLock.lock();
        try {
            return tx.execute(status -> work.get());
        } finally {
            stockLock.unlock();
        }
    }
}
