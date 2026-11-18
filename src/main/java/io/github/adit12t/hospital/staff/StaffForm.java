package io.github.adit12t.hospital.staff;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;

public class StaffForm {
    @NotBlank @Pattern(regexp = "[a-z0-9._-]{3,40}", message = "3-40 lower-case letters, digits, dots, dashes or underscores")
    private String username;
    @NotBlank @Size(max = 100)
    private String fullName;
    @NotNull
    private StaffMember.Role role;
    @Size(max = 60)
    private String department;
    @NotBlank @Size(min = 12, max = 128, message = "must be 12 to 128 characters")
    private String password;

    public String getUsername() { return username; }
    public void setUsername(String v) { username = v; }
    public String getFullName() { return fullName; }
    public void setFullName(String v) { fullName = v; }
    public StaffMember.Role getRole() { return role; }
    public void setRole(StaffMember.Role v) { role = v; }
    public String getDepartment() { return department; }
    public void setDepartment(String v) { department = v; }
    public String getPassword() { return password; }
    public void setPassword(String v) { password = v; }
}
