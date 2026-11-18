package io.github.adit12t.hospital.blood;

import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.Query;

import java.util.List;
import java.util.Optional;

public interface BloodIssueRepository extends JpaRepository<BloodIssue, Long> {
    @Query("select i.bloodGroup, sum(i.units) from BloodIssue i group by i.bloodGroup")
    List<Object[]> unitsByGroup();

    List<BloodIssue> findTop20ByOrderByIdDesc();
}
