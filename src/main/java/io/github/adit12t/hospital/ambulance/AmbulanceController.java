package io.github.adit12t.hospital.ambulance;

import io.github.adit12t.hospital.ambulance.AmbulanceRepository;
import io.github.adit12t.hospital.ambulance.DispatchRepository;
import io.github.adit12t.hospital.web.RuleViolation;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/ambulances")
public class AmbulanceController {

    private final AmbulanceService service;
    private final AmbulanceRepository ambulances;
    private final DispatchRepository dispatches;

    public AmbulanceController(AmbulanceService service, AmbulanceRepository ambulances, DispatchRepository dispatches) {
        this.service = service;
        this.ambulances = ambulances;
        this.dispatches = dispatches;
    }

    @GetMapping
    public String index(Model model) {
        model.addAttribute("fleet", ambulances.findAllByOrderByRegistrationAsc());
        model.addAttribute("dispatches", dispatches.findTop20ByOrderByDispatchedAtDesc());
        return "ambulances/index";
    }

    @PostMapping("/{id}/dispatch")
    @PreAuthorize("hasAnyRole('ADMIN','RECEPTION')")
    public String dispatch(@PathVariable long id, @RequestParam String patientName, @RequestParam String pickupAddress,
                           @RequestParam String contactPhone, RedirectAttributes flash) {
        if (patientName.isBlank() || patientName.length() > 100 || pickupAddress.isBlank() || pickupAddress.length() > 200
                || !contactPhone.matches("[0-9+()\\- ]{7,20}")) {
            flash.addFlashAttribute("error", "Enter the patient's name, the pickup address and a valid phone number.");
            return "redirect:/ambulances";
        }
        return run(flash, () -> "Dispatched " + service.dispatch(id, patientName, pickupAddress, contactPhone).getAmbulance().getRegistration() + ".");
    }

    @PostMapping("/{id}/return")
    @PreAuthorize("hasAnyRole('ADMIN','RECEPTION')")
    public String markReturned(@PathVariable long id, RedirectAttributes flash) {
        return run(flash, () -> {
            service.markReturned(id);
            return "Ambulance is back and available.";
        });
    }

    @PostMapping("/{id}/maintenance")
    @PreAuthorize("hasRole('ADMIN')")
    public String maintenance(@PathVariable long id, @RequestParam boolean on, RedirectAttributes flash) {
        return run(flash, () -> {
            service.setMaintenance(id, on);
            return on ? "Marked for maintenance." : "Back in service.";
        });
    }

    private static String run(RedirectAttributes flash, java.util.function.Supplier<String> action) {
        try {
            flash.addFlashAttribute("notice", action.get());
        } catch (RuleViolation e) {
            flash.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/ambulances";
    }
}
