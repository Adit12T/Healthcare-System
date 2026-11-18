package io.github.adit12t.hospital.config;

import io.github.adit12t.hospital.blood.BloodBankService;
import io.github.adit12t.hospital.blood.BloodGroup;
import io.github.adit12t.hospital.patient.Patient;
import io.github.adit12t.hospital.patient.PatientForm;
import io.github.adit12t.hospital.patient.PatientRepository;
import io.github.adit12t.hospital.staff.StaffForm;
import io.github.adit12t.hospital.staff.StaffMember;
import io.github.adit12t.hospital.staff.StaffRepository;
import io.github.adit12t.hospital.staff.StaffService;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.boot.ApplicationArguments;
import org.springframework.boot.ApplicationRunner;
import org.springframework.stereotype.Component;

import java.time.Clock;
import java.time.LocalDate;
import java.time.LocalDateTime;

/**
 * On an empty database: in the demo profile, creates demo accounts and sample data; otherwise, creates an
 * "admin" account if HMS_ADMIN_PASSWORD is set. Never runs against a database that already has staff.
 */
@Component
public class InitialData implements ApplicationRunner {

    public static final String DEMO_PASSWORD = "demo-password-123";
    private static final Logger log = LoggerFactory.getLogger(InitialData.class);

    private final StaffRepository staff;
    private final StaffService staffService;
    private final PatientRepository patients;
    private final BloodBankService bloodBank;
    private final Clock clock;
    private final boolean demo;
    private final String bootstrapPassword;

    public InitialData(StaffRepository staff, StaffService staffService, PatientRepository patients, BloodBankService bloodBank,
                       Clock clock, @Value("${hospital.demo-users:false}") boolean demo,
                       @Value("${hospital.bootstrap-admin-password:}") String bootstrapPassword) {
        this.staff = staff;
        this.staffService = staffService;
        this.patients = patients;
        this.bloodBank = bloodBank;
        this.clock = clock;
        this.demo = demo;
        this.bootstrapPassword = bootstrapPassword;
    }

    @Override
    public void run(ApplicationArguments args) {
        if (staff.count() > 0) {
            return;
        }
        if (demo) {
            account("admin", "Dana Admin", StaffMember.Role.ADMIN, "Administration", DEMO_PASSWORD);
            account("dr.rao", "Dr. Priya Rao", StaffMember.Role.DOCTOR, "Internal Medicine", DEMO_PASSWORD);
            account("nurse.kim", "Jordan Kim", StaffMember.Role.NURSE, "Ward 1", DEMO_PASSWORD);
            account("frontdesk", "Alex Morgan", StaffMember.Role.RECEPTION, "Front desk", DEMO_PASSWORD);
            patient("Maria", "Lopez", "1958-04-12", Patient.Sex.FEMALE, BloodGroup.A_POS, "555-0101");
            patient("James", "Carter", "1990-11-30", Patient.Sex.MALE, BloodGroup.O_NEG, "555-0102");
            patient("Aisha", "Khan", "2001-07-08", Patient.Sex.FEMALE, null, "555-0103");
            for (var d : new Object[][]{{"Sam Lee", "1985-02-01", BloodGroup.O_NEG}, {"Ravi Patel", "1979-09-15", BloodGroup.A_POS},
                    {"Emma Brown", "1995-12-24", BloodGroup.B_POS}}) {
                var donor = bloodBank.registerDonor((String) d[0], LocalDate.parse((String) d[1]), (BloodGroup) d[2], 72, "555-0200");
                bloodBank.recordDonation(donor.getId(), 2);
            }
            log.warn("Demo data loaded. Demo accounts use the password '{}'. Do not use the demo profile in production.", DEMO_PASSWORD);
        } else if (bootstrapPassword.length() >= 12) {
            account("admin", "Administrator", StaffMember.Role.ADMIN, null, bootstrapPassword);
            log.info("Created the initial 'admin' account from HMS_ADMIN_PASSWORD.");
        } else {
            log.warn("No staff accounts exist. Set HMS_ADMIN_PASSWORD (12+ characters) to create the first admin.");
        }
    }

    private void account(String username, String name, StaffMember.Role role, String department, String password) {
        StaffForm f = new StaffForm();
        f.setUsername(username);
        f.setFullName(name);
        f.setRole(role);
        f.setDepartment(department);
        f.setPassword(password);
        staffService.create(f);
    }

    private void patient(String first, String last, String dob, Patient.Sex sex, BloodGroup group, String phone) {
        PatientForm f = new PatientForm();
        f.setFirstName(first);
        f.setLastName(last);
        f.setDateOfBirth(LocalDate.parse(dob));
        f.setSex(sex);
        f.setBloodGroup(group);
        f.setPhone(phone);
        patients.save(new Patient(f, LocalDateTime.now(clock)));
    }
}
