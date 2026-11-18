package io.github.adit12t.hospital.blood;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import java.time.LocalDate;
import java.time.LocalDateTime;

@Entity
public class Donor {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String fullName;
    private LocalDate dateOfBirth;
    @Enumerated(EnumType.STRING)
    private BloodGroup bloodGroup;
    private int weightKg;
    private String phone;
    private LocalDateTime createdAt;

    protected Donor() {
    }

    public Donor(String fullName, LocalDate dateOfBirth, BloodGroup bloodGroup, int weightKg, String phone, LocalDateTime createdAt) {
        this.fullName = fullName;
        this.dateOfBirth = dateOfBirth;
        this.bloodGroup = bloodGroup;
        this.weightKg = weightKg;
        this.phone = phone;
        this.createdAt = createdAt;
    }

    public Long getId() { return id; }
    public String getFullName() { return fullName; }
    public LocalDate getDateOfBirth() { return dateOfBirth; }
    public BloodGroup getBloodGroup() { return bloodGroup; }
    public int getWeightKg() { return weightKg; }
    public String getPhone() { return phone; }
}
