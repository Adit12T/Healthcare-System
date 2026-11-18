package io.github.adit12t.hospital.ambulance;

import jakarta.persistence.LockModeType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface AmbulanceRepository extends JpaRepository<Ambulance, Long> {
    List<Ambulance> findAllByOrderByRegistrationAsc();

    @Lock(LockModeType.PESSIMISTIC_WRITE)
    @Query("select a from Ambulance a where a.id = :id")
    Optional<Ambulance> findByIdForUpdate(@Param("id") long id);

    long countByStatus(Ambulance.Status status);
}
