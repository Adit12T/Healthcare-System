package io.github.adit12t.hospital.blood;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface DonationRepository extends JpaRepository<Donation, Long> {
    @Query("select d.bloodGroup, sum(d.units) from Donation d group by d.bloodGroup")
    List<Object[]> unitsByGroup();

    Optional<Donation> findFirstByDonorIdOrderByDonatedOnDesc(long donorId);
}
