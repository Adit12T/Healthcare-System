package io.github.adit12t.hospital.blood;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

import java.time.LocalDate;

@Entity
public class Donation {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(optional = false)
    private Donor donor;
    @Enumerated(EnumType.STRING)
    private BloodGroup bloodGroup;
    private int units;
    private LocalDate donatedOn;

    protected Donation() {
    }

    Donation(Donor donor, int units, LocalDate donatedOn) {
        this.donor = donor;
        this.bloodGroup = donor.getBloodGroup();
        this.units = units;
        this.donatedOn = donatedOn;
    }

    public Long getId() { return id; }
    public Donor getDonor() { return donor; }
    public BloodGroup getBloodGroup() { return bloodGroup; }
    public int getUnits() { return units; }
    public LocalDate getDonatedOn() { return donatedOn; }
}
