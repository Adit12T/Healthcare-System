package io.github.adit12t.hospital.patient;

import io.github.adit12t.hospital.blood.BloodGroup;
import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.time.Period;

@Entity
public class Patient {

    public enum Sex { FEMALE, MALE, OTHER }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String firstName;
    private String lastName;
    private LocalDate dateOfBirth;
    @Enumerated(EnumType.STRING)
    private Sex sex;
    @Enumerated(EnumType.STRING)
    private BloodGroup bloodGroup;
    private String phone;
    private String address;
    private String emergencyContact;
    @Column(updatable = false)
    private LocalDateTime createdAt;

    protected Patient() {
    }

    public Patient(PatientForm form, LocalDateTime now) {
        apply(form);
        this.createdAt = now;
    }

    public void apply(PatientForm f) {
        firstName = f.getFirstName().strip();
        lastName = f.getLastName().strip();
        dateOfBirth = f.getDateOfBirth();
        sex = f.getSex();
        bloodGroup = f.getBloodGroup();
        phone = f.getPhone().strip();
        address = f.getAddress() == null ? null : f.getAddress().strip();
        emergencyContact = f.getEmergencyContact() == null ? null : f.getEmergencyContact().strip();
    }

    public PatientForm toForm() {
        PatientForm f = new PatientForm();
        f.setFirstName(firstName);
        f.setLastName(lastName);
        f.setDateOfBirth(dateOfBirth);
        f.setSex(sex);
        f.setBloodGroup(bloodGroup);
        f.setPhone(phone);
        f.setAddress(address);
        f.setEmergencyContact(emergencyContact);
        return f;
    }

    public int ageOn(LocalDate date) {
        return Period.between(dateOfBirth, date).getYears();
    }

    public String getFullName() {
        return firstName + " " + lastName;
    }

    public String getMrn() {
        return id == null ? "" : String.format("MRN-%06d", id);
    }

    public Long getId() { return id; }
    public String getFirstName() { return firstName; }
    public String getLastName() { return lastName; }
    public LocalDate getDateOfBirth() { return dateOfBirth; }
    public Sex getSex() { return sex; }
    public BloodGroup getBloodGroup() { return bloodGroup; }
    public String getPhone() { return phone; }
    public String getAddress() { return address; }
    public String getEmergencyContact() { return emergencyContact; }
    public LocalDateTime getCreatedAt() { return createdAt; }
}
