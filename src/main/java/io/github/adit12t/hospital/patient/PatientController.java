package io.github.adit12t.hospital.patient;

import io.github.adit12t.hospital.blood.BloodGroup;
import io.github.adit12t.hospital.ward.AdmissionRepository;
import io.github.adit12t.hospital.web.NotFoundException;
import jakarta.validation.Valid;
import org.springframework.data.domain.PageRequest;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.time.Clock;
import java.time.LocalDate;
import java.time.LocalDateTime;

@Controller
@RequestMapping("/patients")
public class PatientController {

    private final PatientRepository patients;
    private final AdmissionRepository admissions;
    private final Clock clock;

    public PatientController(PatientRepository patients, AdmissionRepository admissions, Clock clock) {
        this.patients = patients;
        this.admissions = admissions;
        this.clock = clock;
    }

    @ModelAttribute("bloodGroups")
    BloodGroup[] bloodGroups() {
        return BloodGroup.values();
    }

    @ModelAttribute("sexes")
    Patient.Sex[] sexes() {
        return Patient.Sex.values();
    }

    @GetMapping
    public String list(@RequestParam(defaultValue = "") String q, @RequestParam(defaultValue = "0") int page, Model model) {
        String query = q.strip();
        var pageable = PageRequest.of(Math.max(page, 0), 20, Sort.by("lastName", "firstName"));
        model.addAttribute("q", query);
        model.addAttribute("page", query.isEmpty() ? patients.findAll(pageable) : patients.search(query, pageable));
        return "patients/list";
    }

    @GetMapping("/new")
    @PreAuthorize("hasAnyRole('ADMIN','RECEPTION')")
    public String newForm(Model model) {
        model.addAttribute("form", new PatientForm());
        return "patients/form";
    }

    @PostMapping
    @PreAuthorize("hasAnyRole('ADMIN','RECEPTION')")
    public String create(@Valid @ModelAttribute("form") PatientForm form, BindingResult result, RedirectAttributes flash) {
        if (result.hasErrors()) {
            return "patients/form";
        }
        Patient saved = patients.save(new Patient(form, LocalDateTime.now(clock)));
        flash.addFlashAttribute("notice", "Registered " + saved.getFullName() + " (" + saved.getMrn() + ").");
        return "redirect:/patients/" + saved.getId();
    }

    @GetMapping("/{id}")
    public String view(@PathVariable long id, Model model) {
        Patient patient = patients.findById(id).orElseThrow(() -> new NotFoundException("Patient"));
        model.addAttribute("patient", patient);
        model.addAttribute("age", patient.ageOn(LocalDate.now(clock)));
        model.addAttribute("admissions", admissions.findByPatientIdOrderByAdmittedAtDesc(id));
        return "patients/view";
    }

    @GetMapping("/{id}/edit")
    @PreAuthorize("hasAnyRole('ADMIN','RECEPTION')")
    public String editForm(@PathVariable long id, Model model) {
        Patient patient = patients.findById(id).orElseThrow(() -> new NotFoundException("Patient"));
        model.addAttribute("form", patient.toForm());
        model.addAttribute("patientId", id);
        return "patients/form";
    }

    @PostMapping("/{id}")
    @PreAuthorize("hasAnyRole('ADMIN','RECEPTION')")
    @Transactional
    public String update(@PathVariable long id, @Valid @ModelAttribute("form") PatientForm form, BindingResult result,
                         Model model, RedirectAttributes flash) {
        Patient patient = patients.findById(id).orElseThrow(() -> new NotFoundException("Patient"));
        if (result.hasErrors()) {
            model.addAttribute("patientId", id);
            return "patients/form";
        }
        patient.apply(form);
        flash.addFlashAttribute("notice", "Saved changes to " + patient.getFullName() + ".");
        return "redirect:/patients/" + id;
    }
}
