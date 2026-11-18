package io.github.adit12t.hospital.ambulance;

import jakarta.persistence.LockModeType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface DispatchRepository extends JpaRepository<Dispatch, Long> {
    Optional<Dispatch> findFirstByAmbulanceIdAndReturnedAtIsNull(long ambulanceId);

    List<Dispatch> findTop20ByOrderByDispatchedAtDesc();
}
