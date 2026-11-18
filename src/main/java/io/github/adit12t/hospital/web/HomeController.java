package io.github.adit12t.hospital.web;

import io.github.adit12t.hospital.ambulance.Ambulance;
import io.github.adit12t.hospital.ambulance.AmbulanceRepository;
import io.github.adit12t.hospital.blood.BloodBankService;
import io.github.adit12t.hospital.patient.PatientRepository;
import io.github.adit12t.hospital.ward.BedRepository;
import io.github.adit12t.hospital.ward.AdmissionRepository;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

@Controller
public class HomeController {

    private final PatientRepository patients;
    private final BedRepository beds;
    private final AdmissionRepository admissions;
    private final AmbulanceRepository ambulances;
    private final BloodBankService bloodBank;

    public HomeController(PatientRepository patients, BedRepository beds, AdmissionRepository admissions,
                          AmbulanceRepository ambulances, BloodBankService bloodBank) {
        this.patients = patients;
        this.beds = beds;
        this.admissions = admissions;
        this.ambulances = ambulances;
        this.bloodBank = bloodBank;
    }

    @GetMapping("/login")
    public String login() {
        return "login";
    }

    @GetMapping("/")
    public String dashboard(Model model) {
        long totalBeds = beds.count();
        long occupied = admissions.findByDischargedAtIsNull().size();
        model.addAttribute("patientCount", patients.count());
        model.addAttribute("totalBeds", totalBeds);
        model.addAttribute("occupiedBeds", occupied);
        model.addAttribute("ambulancesAvailable", ambulances.countByStatus(Ambulance.Status.AVAILABLE));
        model.addAttribute("ambulancesTotal", ambulances.count());
        model.addAttribute("stock", bloodBank.stock());
        return "dashboard";
    }
}
