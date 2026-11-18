package io.github.adit12t.hospital.ward;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Bed {
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;
    @ManyToOne(optional = false)
    private Room room;
    private String label;

    protected Bed() {
    }

    public String getName() {
        return room.getNumber() + "-" + label;
    }

    public Long getId() { return id; }
    public Room getRoom() { return room; }
    public String getLabel() { return label; }
}
