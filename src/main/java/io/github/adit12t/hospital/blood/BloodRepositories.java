package io.github.adit12t.hospital.blood;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

/** The blood bank's three repositories, kept together. */
public final class BloodRepositories {
    private BloodRepositories() {
    }

    public interface DonorRepository extends JpaRepository<Donor, Long> {
        List<Donor> findAllByOrderByFullNameAsc();
    }

    public interface DonationRepository extends JpaRepository<Donation, Long> {
        @Query("select d.bloodGroup, sum(d.units) from Donation d group by d.bloodGroup")
        List<Object[]> unitsByGroup();

        Optional<Donation> findFirstByDonorIdOrderByDonatedOnDesc(long donorId);
    }

    public interface BloodIssueRepository extends JpaRepository<BloodIssue, Long> {
        @Query("select i.bloodGroup, sum(i.units) from BloodIssue i group by i.bloodGroup")
        List<Object[]> unitsByGroup();

        List<BloodIssue> findTop20ByOrderByIdDesc();
    }
}
