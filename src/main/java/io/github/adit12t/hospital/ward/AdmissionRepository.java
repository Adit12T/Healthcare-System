package io.github.adit12t.hospital.ward;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;

public interface AdmissionRepository extends JpaRepository<Admission, Long> {
    List<Admission> findByDischargedAtIsNull();

    boolean existsByBedIdAndDischargedAtIsNull(long bedId);

    boolean existsByPatientIdAndDischargedAtIsNull(long patientId);

    List<Admission> findByPatientIdOrderByAdmittedAtDesc(long patientId);
}
