package io.github.adit12t.hospital.blood;

import java.util.Arrays;
import java.util.List;

/** ABO and Rh blood groups, with red-cell transfusion compatibility. */
public enum BloodGroup {
    O_NEG("O-"), O_POS("O+"), A_NEG("A-"), A_POS("A+"), B_NEG("B-"), B_POS("B+"), AB_NEG("AB-"), AB_POS("AB+");

    private final String label;

    BloodGroup(String label) {
        this.label = label;
    }

    public String label() {
        return label;
    }

    private String abo() {
        return name().substring(0, name().indexOf('_'));
    }

    private boolean rhPositive() {
        return name().endsWith("POS");
    }

    /** True if a patient of this group can receive red cells from {@code donor}. */
    public boolean canReceiveFrom(BloodGroup donor) {
        boolean aboOk = switch (donor.abo()) {
            case "O" -> true;
            case "A" -> abo().contains("A");
            case "B" -> abo().contains("B");
            default -> abo().equals("AB");
        };
        return aboOk && (rhPositive() || !donor.rhPositive());
    }

    /** The donor groups this patient can receive from, closest match first. */
    public List<BloodGroup> compatibleDonors() {
        return Arrays.stream(values()).filter(this::canReceiveFrom)
                .sorted((a, b) -> Boolean.compare(a != this, b != this)).toList();
    }
}
