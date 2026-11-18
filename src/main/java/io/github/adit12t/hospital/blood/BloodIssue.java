package io.github.adit12t.hospital.blood;

import io.github.adit12t.hospital.patient.Patient;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

import java.time.LocalDate;

@Entity
public class BloodIssue {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(optional = false)
    private Patient patient;
    @Enumerated(EnumType.STRING)
    private BloodGroup bloodGroup;
    private int units;
    private LocalDate issuedOn;
    private String issuedBy;

    protected BloodIssue() {
    }

    BloodIssue(Patient patient, BloodGroup bloodGroup, int units, LocalDate issuedOn, String issuedBy) {
        this.patient = patient;
        this.bloodGroup = bloodGroup;
        this.units = units;
        this.issuedOn = issuedOn;
        this.issuedBy = issuedBy;
    }

    public Long getId() { return id; }
    public Patient getPatient() { return patient; }
    public BloodGroup getBloodGroup() { return bloodGroup; }
    public int getUnits() { return units; }
    public LocalDate getIssuedOn() { return issuedOn; }
    public String getIssuedBy() { return issuedBy; }
}
