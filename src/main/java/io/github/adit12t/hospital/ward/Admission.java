package io.github.adit12t.hospital.ward;

import io.github.adit12t.hospital.patient.Patient;
import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

import java.math.BigDecimal;
import java.time.LocalDateTime;

@Entity
public class Admission {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(optional = false)
    private Patient patient;
    @ManyToOne(optional = false)
    private Bed bed;
    private String reason;
    private String attendingDoctor;
    private LocalDateTime admittedAt;
    private LocalDateTime dischargedAt;
    private String dischargeSummary;
    private BigDecimal stayCharge;

    protected Admission() {
    }

    Admission(Patient patient, Bed bed, String reason, String attendingDoctor, LocalDateTime admittedAt) {
        this.patient = patient;
        this.bed = bed;
        this.reason = reason;
        this.attendingDoctor = attendingDoctor;
        this.admittedAt = admittedAt;
    }

    void discharge(LocalDateTime at, String summary, BigDecimal charge) {
        this.dischargedAt = at;
        this.dischargeSummary = summary;
        this.stayCharge = charge;
    }

    public boolean isOpen() {
        return dischargedAt == null;
    }

    public Long getId() { return id; }
    public Patient getPatient() { return patient; }
    public Bed getBed() { return bed; }
    public String getReason() { return reason; }
    public String getAttendingDoctor() { return attendingDoctor; }
    public LocalDateTime getAdmittedAt() { return admittedAt; }
    public LocalDateTime getDischargedAt() { return dischargedAt; }
    public String getDischargeSummary() { return dischargeSummary; }
    public BigDecimal getStayCharge() { return stayCharge; }
}
