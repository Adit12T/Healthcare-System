package io.github.adit12t.hospital.ward;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

import java.math.BigDecimal;

@Entity
public class Room {

    public enum Type { GENERAL, SEMI_PRIVATE, PRIVATE, ICU }

    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @Column(name = "room_number")
    private String number;
    private int floor;
    @Enumerated(EnumType.STRING)
    @Column(name = "room_type")
    private Type type;
    private BigDecimal dailyRate;

    protected Room() {
    }

    public Long getId() { return id; }
    public String getNumber() { return number; }
    public int getFloor() { return floor; }
    public Type getType() { return type; }
    public BigDecimal getDailyRate() { return dailyRate; }
}
