package io.github.adit12t.hospital.staff;

import io.github.adit12t.hospital.web.NotFoundException;
import io.github.adit12t.hospital.web.RuleViolation;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Clock;
import java.time.LocalDateTime;

/** Staff accounts, and the user lookup Spring Security signs in against. */
@Service
public class StaffService implements UserDetailsService {

    private final StaffRepository staff;
    private final PasswordEncoder encoder;
    private final LoginAttempts attempts;
    private final Clock clock;

    public StaffService(StaffRepository staff, PasswordEncoder encoder, LoginAttempts attempts, Clock clock) {
        this.staff = staff;
        this.encoder = encoder;
        this.attempts = attempts;
        this.clock = clock;
    }

    @Override
    public UserDetails loadUserByUsername(String username) {
        StaffMember m = staff.findByUsernameIgnoreCase(username).orElseThrow(() -> new UsernameNotFoundException("Unknown user"));
        return User.withUsername(m.getUsername()).password(m.getPasswordHash()).roles(m.getRole().name())
                .disabled(!m.isEnabled()).accountLocked(attempts.isLocked(username)).build();
    }

    @Transactional
    public StaffMember create(StaffForm f) {
        String username = f.getUsername().strip().toLowerCase();
        if (staff.existsByUsernameIgnoreCase(username)) {
            throw new RuleViolation("The username " + username + " is taken.");
        }
        String department = f.getDepartment() == null || f.getDepartment().isBlank() ? null : f.getDepartment().strip();
        return staff.save(new StaffMember(username, f.getFullName().strip(), f.getRole(), department,
                encoder.encode(f.getPassword()), LocalDateTime.now(clock)));
    }

    /** Enables or disables an account; the last active admin can't be disabled, and nobody can disable themselves. */
    @Transactional
    public void setEnabled(long id, boolean enabled, String actingUsername) {
        StaffMember m = staff.findById(id).orElseThrow(() -> new NotFoundException("Staff member"));
        if (!enabled && m.getUsername().equalsIgnoreCase(actingUsername)) {
            throw new RuleViolation("You can't disable your own account.");
        }
        if (!enabled && m.getRole() == StaffMember.Role.ADMIN && m.isEnabled()
                && staff.countByRoleAndEnabledTrue(StaffMember.Role.ADMIN) <= 1) {
            throw new RuleViolation("At least one administrator must stay active.");
        }
        m.setEnabled(enabled);
    }
}
