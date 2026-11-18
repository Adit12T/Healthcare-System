package io.github.adit12t.hospital.ambulance;

import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Ambulance {
    public enum Kind { BASIC, ADVANCED }

    public enum Status { AVAILABLE, DISPATCHED, MAINTENANCE }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    private String registration;
    @Enumerated(EnumType.STRING)
    private Kind kind;
    @Enumerated(EnumType.STRING)
    private Status status;

    protected Ambulance() {
    }

    void setStatus(Status status) {
        this.status = status;
    }

    public Long getId() { return id; }
    public String getRegistration() { return registration; }
    public Kind getKind() { return kind; }
    public Status getStatus() { return status; }
}
