package io.github.adit12t.hospital;

import io.github.adit12t.hospital.blood.BloodBankService;
import io.github.adit12t.hospital.blood.BloodGroup;
import io.github.adit12t.hospital.patient.PatientRepository;
import io.github.adit12t.hospital.web.RuleViolation;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.transaction.annotation.Transactional;

import java.time.LocalDate;

import static io.github.adit12t.hospital.blood.BloodGroup.AB_NEG;
import static io.github.adit12t.hospital.blood.BloodGroup.AB_POS;
import static io.github.adit12t.hospital.blood.BloodGroup.A_NEG;
import static io.github.adit12t.hospital.blood.BloodGroup.A_POS;
import static io.github.adit12t.hospital.blood.BloodGroup.B_POS;
import static io.github.adit12t.hospital.blood.BloodGroup.O_NEG;
import static io.github.adit12t.hospital.blood.BloodGroup.O_POS;
import static org.assertj.core.api.Assertions.assertThat;
import static org.assertj.core.api.Assertions.assertThatThrownBy;

@SpringBootTest
@Transactional
class BloodBankTest {

    @Autowired BloodBankService bank;
    @Autowired PatientRepository patients;

    private long patient(String lastName) {
        return patients.findAll().stream().filter(p -> p.getLastName().equals(lastName)).findFirst().orElseThrow().getId();
    }

    @Test
    void redCellCompatibility() {
        for (BloodGroup recipient : BloodGroup.values()) {
            assertThat(recipient.canReceiveFrom(O_NEG)).as("O- gives to " + recipient).isTrue();
            assertThat(AB_POS.canReceiveFrom(recipient)).as("AB+ takes from " + recipient).isTrue();
            assertThat(recipient.canReceiveFrom(recipient)).isTrue();
        }
        assertThat(A_POS.canReceiveFrom(B_POS)).isFalse();
        assertThat(A_NEG.canReceiveFrom(A_POS)).isFalse();
        assertThat(O_POS.canReceiveFrom(A_NEG)).isFalse();
        assertThat(AB_NEG.canReceiveFrom(O_POS)).isFalse();
        assertThat(O_NEG.compatibleDonors()).containsExactly(O_NEG);
        assertThat(A_POS.compatibleDonors()).first().isEqualTo(A_POS);
        assertThat(A_POS.compatibleDonors()).containsExactlyInAnyOrder(A_POS, A_NEG, O_POS, O_NEG);
    }

    @Test
    void issuesOnlyCompatibleBloodThatIsInStock() {
        // Demo data: 2 units each of O-, A+ and B+. Maria Lopez is A+, James Carter O-, Aisha Khan unknown.
        assertThat(bank.stock().get(A_POS)).isEqualTo(2);
        bank.issue(patient("Lopez"), O_NEG, 1, "dr.rao");
        assertThat(bank.stock().get(O_NEG)).isEqualTo(1);

        assertThatThrownBy(() -> bank.issue(patient("Lopez"), B_POS, 1, "dr.rao")).isInstanceOf(RuleViolation.class)
                .hasMessageContaining("not compatible");
        assertThatThrownBy(() -> bank.issue(patient("Carter"), O_NEG, 2, "dr.rao")).isInstanceOf(RuleViolation.class)
                .hasMessageContaining("Only 1 unit");
        assertThatThrownBy(() -> bank.issue(patient("Khan"), O_NEG, 1, "dr.rao")).isInstanceOf(RuleViolation.class)
                .hasMessageContaining("blood group before");
        assertThatThrownBy(() -> bank.issue(patient("Lopez"), A_POS, 0, "dr.rao")).isInstanceOf(RuleViolation.class);
    }

    @Test
    void donorsMustBeEligible() {
        LocalDate today = LocalDate.now();
        assertThatThrownBy(() -> bank.registerDonor("Teen", today.minusYears(17), O_POS, 70, "555-0000"))
                .isInstanceOf(RuleViolation.class).hasMessageContaining("18 to 65");
        assertThatThrownBy(() -> bank.registerDonor("Light", today.minusYears(30), O_POS, 45, "555-0000"))
                .isInstanceOf(RuleViolation.class).hasMessageContaining("50 kg");

        var donor = bank.registerDonor("Ready", today.minusYears(30), O_POS, 70, "555-0000");
        bank.recordDonation(donor.getId(), 1);
        assertThat(bank.stock().get(O_POS)).isEqualTo(1);
        assertThatThrownBy(() -> bank.recordDonation(donor.getId(), 1)).isInstanceOf(RuleViolation.class)
                .hasMessageContaining("minimum gap is 56 days");
        assertThatThrownBy(() -> bank.recordDonation(donor.getId(), 3)).isInstanceOf(RuleViolation.class);
    }
}
