package io.github.adit12t.hospital.staff;

import io.github.adit12t.hospital.web.RuleViolation;
import jakarta.validation.Valid;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping("/staff")
@PreAuthorize("hasRole('ADMIN')")
public class StaffController {

    private final StaffService service;
    private final StaffRepository staff;

    public StaffController(StaffService service, StaffRepository staff) {
        this.service = service;
        this.staff = staff;
    }

    @ModelAttribute("roles")
    StaffMember.Role[] roles() {
        return StaffMember.Role.values();
    }

    @GetMapping
    public String list(Model model) {
        model.addAttribute("members", staff.findAllByOrderByFullNameAsc());
        model.addAttribute("form", new StaffForm());
        return "staff/index";
    }

    @PostMapping
    public String create(@Valid @ModelAttribute("form") StaffForm form, BindingResult result, Model model, RedirectAttributes flash) {
        if (!result.hasErrors()) {
            try {
                StaffMember m = service.create(form);
                flash.addFlashAttribute("notice", "Created account " + m.getUsername() + " (" + m.getRole() + ").");
                return "redirect:/staff";
            } catch (RuleViolation e) {
                result.rejectValue("username", "taken", e.getMessage());
            }
        }
        form.setPassword(null);   // never echo a password back into the page
        model.addAttribute("members", staff.findAllByOrderByFullNameAsc());
        return "staff/index";
    }

    @PostMapping("/{id}/enabled")
    public String setEnabled(@PathVariable long id, @RequestParam boolean enabled, Authentication auth, RedirectAttributes flash) {
        try {
            service.setEnabled(id, enabled, auth.getName());
            flash.addFlashAttribute("notice", enabled ? "Account enabled." : "Account disabled.");
        } catch (RuleViolation e) {
            flash.addFlashAttribute("error", e.getMessage());
        }
        return "redirect:/staff";
    }
}
