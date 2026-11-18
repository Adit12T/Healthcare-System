package io.github.adit12t.hospital.ambulance;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

import java.time.LocalDateTime;

@Entity
public class Dispatch {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(optional = false)
    private Ambulance ambulance;
    private String patientName;
    private String pickupAddress;
    private String contactPhone;
    private LocalDateTime dispatchedAt;
    private LocalDateTime returnedAt;

    protected Dispatch() {
    }

    Dispatch(Ambulance ambulance, String patientName, String pickupAddress, String contactPhone, LocalDateTime at) {
        this.ambulance = ambulance;
        this.patientName = patientName;
        this.pickupAddress = pickupAddress;
        this.contactPhone = contactPhone;
        this.dispatchedAt = at;
    }

    void markReturned(LocalDateTime at) {
        this.returnedAt = at;
    }

    public Long getId() { return id; }
    public Ambulance getAmbulance() { return ambulance; }
    public String getPatientName() { return patientName; }
    public String getPickupAddress() { return pickupAddress; }
    public String getContactPhone() { return contactPhone; }
    public LocalDateTime getDispatchedAt() { return dispatchedAt; }
    public LocalDateTime getReturnedAt() { return returnedAt; }
}
