package io.github.adit12t.hospital.ward;

import io.github.adit12t.hospital.patient.Patient;
import io.github.adit12t.hospital.patient.PatientRepository;
import io.github.adit12t.hospital.web.NotFoundException;
import io.github.adit12t.hospital.web.RuleViolation;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.math.BigDecimal;
import java.time.Clock;
import java.time.LocalDateTime;
import java.time.temporal.ChronoUnit;

@Service
public class AdmissionService {

    private final AdmissionRepository admissions;
    private final BedRepository beds;
    private final PatientRepository patients;
    private final Clock clock;

    public AdmissionService(AdmissionRepository admissions, BedRepository beds, PatientRepository patients, Clock clock) {
        this.admissions = admissions;
        this.beds = beds;
        this.patients = patients;
        this.clock = clock;
    }

    @Transactional
    public Admission admit(long patientId, long bedId, String reason, String doctor) {
        Bed bed = beds.findByIdForUpdate(bedId).orElseThrow(() -> new NotFoundException("Bed"));
        Patient patient = patients.findById(patientId).orElseThrow(() -> new NotFoundException("Patient"));
        if (admissions.existsByBedIdAndDischargedAtIsNull(bedId)) {
            throw new RuleViolation("Bed " + bed.getName() + " is already occupied.");
        }
        if (admissions.existsByPatientIdAndDischargedAtIsNull(patientId)) {
            throw new RuleViolation(patient.getFullName() + " is already admitted.");
        }
        return admissions.save(new Admission(patient, bed, reason.strip(),
                doctor == null || doctor.isBlank() ? null : doctor.strip(), LocalDateTime.now(clock)));
    }

    /** Discharges a patient and charges the room's daily rate for each calendar day started (at least one). */
    @Transactional
    public Admission discharge(long admissionId, String summary) {
        Admission admission = admissions.findById(admissionId).orElseThrow(() -> new NotFoundException("Admission"));
        if (!admission.isOpen()) {
            throw new RuleViolation("This admission was already discharged.");
        }
        LocalDateTime now = LocalDateTime.now(clock);
        long days = Math.max(1, ChronoUnit.DAYS.between(admission.getAdmittedAt().toLocalDate(), now.toLocalDate()));
        BigDecimal charge = admission.getBed().getRoom().getDailyRate().multiply(BigDecimal.valueOf(days));
        admission.discharge(now, summary.strip(), charge);
        return admission;
    }
}
