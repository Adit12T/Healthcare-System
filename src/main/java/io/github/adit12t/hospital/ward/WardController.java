package io.github.adit12t.hospital.ward;

import io.github.adit12t.hospital.patient.PatientRepository;
import io.github.adit12t.hospital.web.NotFoundException;
import io.github.adit12t.hospital.web.RuleViolation;
import jakarta.validation.Valid;
import org.springframework.data.domain.Sort;
import org.springframework.security.access.prepost.PreAuthorize;
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

import java.util.List;
import java.util.Map;
import java.util.function.Function;
import java.util.stream.Collectors;

@Controller
@RequestMapping("/wards")
public class WardController {

    /** One bed and, if occupied, who is in it. */
    public record BedStatus(Bed bed, Admission admission) {
        public boolean isFree() {
            return admission == null;
        }
    }

    private final BedRepository beds;
    private final AdmissionRepository admissions;
    private final AdmissionService service;
    private final PatientRepository patients;

    public WardController(BedRepository beds, AdmissionRepository admissions, AdmissionService service, PatientRepository patients) {
        this.beds = beds;
        this.admissions = admissions;
        this.service = service;
        this.patients = patients;
    }

    public List<BedStatus> board() {
        Map<Long, Admission> open = admissions.findByDischargedAtIsNull().stream()
                .collect(Collectors.toMap(a -> a.getBed().getId(), Function.identity()));
        return beds.findAllOrdered().stream().map(b -> new BedStatus(b, open.get(b.getId()))).toList();
    }

    @GetMapping
    public String index(Model model) {
        List<BedStatus> board = board();
        model.addAttribute("board", board);
        model.addAttribute("free", board.stream().filter(BedStatus::isFree).count());
        return "wards/index";
    }

    @GetMapping("/admit")
    @PreAuthorize("hasAnyRole('ADMIN','RECEPTION')")
    public String admitForm(@RequestParam(required = false) Long patientId, @RequestParam(required = false) Long bedId, Model model) {
        AdmitForm form = new AdmitForm();
        form.setPatientId(patientId);
        form.setBedId(bedId);
        model.addAttribute("form", form);
        return admitPage(model);
    }

    @PostMapping("/admit")
    @PreAuthorize("hasAnyRole('ADMIN','RECEPTION')")
    public String admit(@Valid @ModelAttribute("form") AdmitForm form, BindingResult result, Model model, RedirectAttributes flash) {
        if (result.hasErrors()) {
            return admitPage(model);
        }
        try {
            Admission a = service.admit(form.getPatientId(), form.getBedId(), form.getReason(), form.getAttendingDoctor());
            flash.addFlashAttribute("notice", "Admitted " + a.getPatient().getFullName() + " to bed " + a.getBed().getName() + ".");
            return "redirect:/wards";
        } catch (RuleViolation e) {
            result.reject("rule", e.getMessage());
            return admitPage(model);
        }
    }

    private String admitPage(Model model) {
        model.addAttribute("freeBeds", board().stream().filter(BedStatus::isFree).map(BedStatus::bed).toList());
        model.addAttribute("patients", patients.findAll(Sort.by("lastName", "firstName")));
        return "wards/admit";
    }

    @GetMapping("/admissions/{id}/discharge")
    @PreAuthorize("hasAnyRole('ADMIN','DOCTOR')")
    public String dischargeForm(@PathVariable long id, Model model) {
        model.addAttribute("admission", admissions.findById(id).orElseThrow(() -> new NotFoundException("Admission")));
        return "wards/discharge";
    }

    @PostMapping("/admissions/{id}/discharge")
    @PreAuthorize("hasAnyRole('ADMIN','DOCTOR')")
    public String discharge(@PathVariable long id, @RequestParam String summary, Model model, RedirectAttributes flash) {
        Admission admission = admissions.findById(id).orElseThrow(() -> new NotFoundException("Admission"));
        String text = summary == null ? "" : summary.strip();
        if (text.isEmpty() || text.length() > 2000) {
            model.addAttribute("admission", admission);
            model.addAttribute("error", "A discharge summary of up to 2000 characters is required.");
            return "wards/discharge";
        }
        try {
            Admission done = service.discharge(id, text);
            flash.addFlashAttribute("notice", "Discharged " + done.getPatient().getFullName() + ". Stay charge: $" + done.getStayCharge() + ".");
        } catch (RuleViolation e) {
            flash.addFlashAttribute("notice", e.getMessage());
        }
        return "redirect:/wards";
    }
}
