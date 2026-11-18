package io.github.adit12t.hospital.ward;

import jakarta.persistence.LockModeType;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Lock;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.query.Param;

import java.util.List;
import java.util.Optional;

public interface BedRepository extends JpaRepository<Bed, Long> {

    @Query("select b from Bed b join fetch b.room r order by r.floor, r.number, b.label")
    List<Bed> findAllOrdered();

    /** Locks the bed row so two admissions to the same bed can't both succeed. */
    @Lock(LockModeType.PESSIMISTIC_WRITE)
    @Query("select b from Bed b where b.id = :id")
    Optional<Bed> findByIdForUpdate(@Param("id") long id);
}
