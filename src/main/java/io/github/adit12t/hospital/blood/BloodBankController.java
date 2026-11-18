package io.github.adit12t.hospital.blood;

import io.github.adit12t.hospital.blood.BloodRepositories.DonorRepository;
import io.github.adit12t.hospital.patient.PatientRepository;
import io.github.adit12t.hospital.web.RuleViolation;
import org.springframework.data.domain.Sort;
import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.LocalDate;

@Controller
@RequestMapping("/blood")
public class BloodBankController {

    private final BloodBankService service;
    private final DonorRepository donors;
    private final PatientRepository patients;

    public BloodBankController(BloodBankService service, DonorRepository donors, PatientRepository patients) {
        this.service = service;
        this.donors = donors;
        this.patients = patients;
    }

    @GetMapping
    public String index(Model model) {
        model.addAttribute("stock", service.stock());
        model.addAttribute("donors", donors.findAllByOrderByFullNameAsc());
        model.addAttribute("issues", service.recentIssues());
        model.addAttribute("patients", patients.findAll(Sort.by("lastName", "firstName")));
        model.addAttribute("bloodGroups", BloodGroup.values());
        return "blood/index";
    }

    @PostMapping("/donors")
    @PreAuthorize("hasAnyRole('ADMIN','DOCTOR','NURSE')")
    public String registerDonor(@RequestParam String fullName,
                                @RequestParam @DateTimeFormat(iso = DateTimeFormat.ISO.DATE) LocalDate dateOfBirth,
                                @RequestParam BloodGroup bloodGroup, @RequestParam int weightKg, @RequestParam String phone,
                                RedirectAttributes flash) {
        if (fullName.isBlank() || fullName.length() > 100 || !phone.matches("[0-9+()\\- ]{7,20}")) {
            flash.addFlashAttribute("error", "Enter the donor's name and a valid phone number.");
            return "redirect:/blood";
        }
        return result(flash, () -> "Registered donor " + service.registerDonor(fullName, dateOfBirth, bloodGroup, weightKg, phone).getFullName() + ".");
    }

    @PostMapping("/donors/{id}/donations")
    @PreAuthorize("hasAnyRole('ADMIN','DOCTOR','NURSE')")
    public String donate(@PathVariable long id, @RequestParam(defaultValue = "1") int units, RedirectAttributes flash) {
        return result(flash, () -> {
            Donation d = service.recordDonation(id, units);
            return "Recorded " + d.getUnits() + " unit(s) of " + d.getBloodGroup().label() + " from " + d.getDonor().getFullName() + ".";
        });
    }

    @PostMapping("/issues")
    @PreAuthorize("hasAnyRole('ADMIN','DOCTOR')")
    public String issue(@RequestParam long patientId, @RequestParam BloodGroup bloodGroup, @RequestParam int units,
                        Authentication auth, RedirectAttributes flash) {
        return result(flash, () -> {
            BloodIssue i = service.issue(patientId, bloodGroup, units, auth.getName());
            return "Issued " + i.getUnits() + " unit(s) of " + i.getBloodGroup().label() + " to " + i.getPatient().getFullName() + ".";
        });
    }

    private static String result(RedirectAttributes flash, java.util.function.Supplier<String> action) {
        try {
            flash.addFlashAttribute("notice", action.get());
        } catch (RuleViolation e) {
            flash.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/blood";
    }
}
