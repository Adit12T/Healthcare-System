package io.github.adit12t.hospital.staff;

import org.springframework.data.jpa.repository.JpaRepository;

import java.util.List;
import java.util.Optional;

public interface StaffRepository extends JpaRepository<StaffMember, Long> {
    Optional<StaffMember> findByUsernameIgnoreCase(String username);

    boolean existsByUsernameIgnoreCase(String username);

    List<StaffMember> findAllByOrderByFullNameAsc();

    long countByRoleAndEnabledTrue(StaffMember.Role role);
}
