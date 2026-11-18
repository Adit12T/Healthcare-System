package io.github.adit12t.hospital.patient;

import io.github.adit12t.hospital.blood.BloodGroup;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Past;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import org.springframework.format.annotation.DateTimeFormat;

import java.time.LocalDate;

/** What the registration and edit forms submit. */
public class PatientForm {
    @NotBlank @Size(max = 60)
    private String firstName;
    @NotBlank @Size(max = 60)
    private String lastName;
    @NotNull @Past @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private LocalDate dateOfBirth;
    @NotNull
    private Patient.Sex sex;
    private BloodGroup bloodGroup;
    @NotBlank @Pattern(regexp = "[0-9+()\\- ]{7,20}", message = "must be a phone number")
    private String phone;
    @Size(max = 200)
    private String address;
    @Size(max = 120)
    private String emergencyContact;

    public String getFirstName() { return firstName; }
    public void setFirstName(String v) { firstName = v; }
    public String getLastName() { return lastName; }
    public void setLastName(String v) { lastName = v; }
    public LocalDate getDateOfBirth() { return dateOfBirth; }
    public void setDateOfBirth(LocalDate v) { dateOfBirth = v; }
    public Patient.Sex getSex() { return sex; }
    public void setSex(Patient.Sex v) { sex = v; }
    public BloodGroup getBloodGroup() { return bloodGroup; }
    public void setBloodGroup(BloodGroup v) { bloodGroup = v; }
    public String getPhone() { return phone; }
    public void setPhone(String v) { phone = v; }
    public String getAddress() { return address; }
    public void setAddress(String v) { address = v; }
    public String getEmergencyContact() { return emergencyContact; }
    public void setEmergencyContact(String v) { emergencyContact = v; }
}
