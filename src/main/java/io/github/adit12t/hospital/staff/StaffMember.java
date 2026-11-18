package io.github.adit12t.hospital.staff;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import java.time.LocalDateTime;

/** A member of staff and their sign-in account. */
@Entity
public class StaffMember {

    public enum Role { ADMIN, DOCTOR, NURSE, RECEPTION }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String username;
    private String fullName;
    @Enumerated(EnumType.STRING)
    private Role role;
    private String department;
    private String passwordHash;
    private boolean enabled = true;
    private LocalDateTime createdAt;

    protected StaffMember() {
    }

    public StaffMember(String username, String fullName, Role role, String department, String passwordHash, LocalDateTime createdAt) {
        this.username = username;
        this.fullName = fullName;
        this.role = role;
        this.department = department;
        this.passwordHash = passwordHash;
        this.createdAt = createdAt;
    }

    void setEnabled(boolean enabled) {
        this.enabled = enabled;
    }

    public Long getId() { return id; }
    public String getUsername() { return username; }
    public String getFullName() { return fullName; }
    public Role getRole() { return role; }
    public String getDepartment() { return department; }
    public String getPasswordHash() { return passwordHash; }
    public boolean isEnabled() { return enabled; }
}
