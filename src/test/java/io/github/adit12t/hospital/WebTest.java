package io.github.adit12t.hospital;

import io.github.adit12t.hospital.ambulance.AmbulanceRepository;
import io.github.adit12t.hospital.patient.PatientRepository;
import io.github.adit12t.hospital.staff.StaffRepository;
import io.github.adit12t.hospital.ward.AdmissionRepository;
import io.github.adit12t.hospital.ward.BedRepository;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.webmvc.test.autoconfigure.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.security.test.context.support.WithMockUser;
import org.springframework.test.web.servlet.MockMvc;
import org.springframework.transaction.annotation.Transactional;

import static org.assertj.core.api.Assertions.assertThat;
import static org.hamcrest.Matchers.containsString;
import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestPostProcessors.csrf;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.get;
import static org.springframework.test.web.servlet.request.MockMvcRequestBuilders.post;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.content;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.flash;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.model;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrl;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.redirectedUrlPattern;
import static org.springframework.test.web.servlet.result.MockMvcResultMatchers.status;

@SpringBootTest
@AutoConfigureMockMvc
@Transactional
class WebTest {

    @Autowired MockMvc mvc;
    @Autowired PatientRepository patients;
    @Autowired BedRepository beds;
    @Autowired AdmissionRepository admissions;
    @Autowired AmbulanceRepository ambulances;
    @Autowired StaffRepository staff;
    @Autowired io.github.adit12t.hospital.ward.AdmissionService admissionService;

    private long patientId(String lastName) {
        return patients.findAll().stream().filter(p -> p.getLastName().equals(lastName)).findFirst().orElseThrow().getId();
    }

    // --- every page renders for every role ---

    @Test
    @WithMockUser(username = "admin", roles = "ADMIN")
    void everyPageRendersForAnAdmin() throws Exception {
        long id = patientId("Lopez");
        for (String url : new String[]{"/", "/patients", "/patients?q=lo", "/patients/new", "/patients/" + id,
                "/patients/" + id + "/edit", "/wards", "/wards/admit", "/blood", "/ambulances", "/staff"}) {
            mvc.perform(get(url)).andExpect(status().isOk());
        }
    }

    @Test
    @WithMockUser(username = "nurse.kim", roles = "NURSE")
    void readOnlyPagesRenderForANurseWithoutWriteActions() throws Exception {
        mvc.perform(get("/patients")).andExpect(status().isOk())
                .andExpect(content().string(org.hamcrest.Matchers.not(containsString("Register patient"))));
        mvc.perform(get("/wards")).andExpect(status().isOk());
        mvc.perform(get("/blood")).andExpect(status().isOk()).andExpect(content().string(containsString("Register donor")));
        mvc.perform(get("/patients/new")).andExpect(status().isForbidden());
        mvc.perform(get("/staff")).andExpect(status().isForbidden());
    }

    // --- security ---

    @Test
    void anonymousUsersAreSentToTheLoginPage() throws Exception {
        mvc.perform(get("/patients")).andExpect(status().isFound()).andExpect(redirectedUrlPattern("**/login"));
        mvc.perform(get("/login")).andExpect(status().isOk());
        mvc.perform(get("/actuator/health")).andExpect(status().isOk());
    }

    @Test
    void securityHeadersAreSet() throws Exception {
        mvc.perform(get("/login"))
                .andExpect(result -> assertThat(result.getResponse().getHeader("Content-Security-Policy")).contains("script-src 'none'"))
                .andExpect(result -> assertThat(result.getResponse().getHeader("X-Frame-Options")).isEqualTo("DENY"));
    }

    @Test
    @WithMockUser(roles = "RECEPTION")
    void formsWithoutACsrfTokenAreRejected() throws Exception {
        mvc.perform(post("/patients").param("firstName", "X")).andExpect(status().isForbidden());
    }

    // --- patients ---

    @Test
    @WithMockUser(roles = "RECEPTION")
    void receptionRegistersAndEditsPatientsWithValidation() throws Exception {
        mvc.perform(post("/patients").with(csrf()).param("firstName", "Lee").param("lastName", "Nguyen")
                        .param("dateOfBirth", "1980-05-05").param("sex", "FEMALE").param("phone", "555 0199"))
                .andExpect(status().isFound()).andExpect(flash().attribute("notice", containsString("Registered Lee Nguyen")));
        mvc.perform(post("/patients").with(csrf()).param("firstName", "").param("lastName", "Nguyen")
                        .param("dateOfBirth", "2999-01-01").param("sex", "FEMALE").param("phone", "call me"))
                .andExpect(status().isOk())
                .andExpect(model().attributeHasFieldErrors("form", "firstName", "dateOfBirth", "phone"));
        mvc.perform(get("/patients").param("q", "nguy")).andExpect(content().string(containsString("Nguyen, Lee")));
        mvc.perform(get("/patients/999999")).andExpect(status().isNotFound());
    }

    @Test
    @WithMockUser(roles = "NURSE")
    void nursesCannotRegisterPatients() throws Exception {
        mvc.perform(post("/patients").with(csrf()).param("firstName", "X")).andExpect(status().isForbidden());
    }

    // --- wards ---

    @Test
    @WithMockUser(username = "frontdesk", roles = "RECEPTION")
    void aBedCanHoldOnePatientAndAPatientOneBed() throws Exception {
        long bed = beds.findAllOrdered().get(0).getId();
        long other = beds.findAllOrdered().get(1).getId();
        mvc.perform(post("/wards/admit").with(csrf()).param("patientId", "" + patientId("Lopez")).param("bedId", "" + bed)
                .param("reason", "Pneumonia")).andExpect(redirectedUrl("/wards"));
        mvc.perform(post("/wards/admit").with(csrf()).param("patientId", "" + patientId("Carter")).param("bedId", "" + bed)
                .param("reason", "Fracture")).andExpect(status().isOk()).andExpect(content().string(containsString("already occupied")));
        mvc.perform(post("/wards/admit").with(csrf()).param("patientId", "" + patientId("Lopez")).param("bedId", "" + other)
                .param("reason", "Again")).andExpect(status().isOk()).andExpect(content().string(containsString("already admitted")));
        mvc.perform(post("/wards/admit").with(csrf()).param("reason", "")).andExpect(status().isOk())
                .andExpect(model().attributeHasFieldErrors("form", "patientId", "bedId", "reason"));
    }

    @Test
    @WithMockUser(username = "dr.rao", roles = {"DOCTOR"})
    void doctorsDischargeAndTheStayIsCharged() throws Exception {
        long bed = beds.findAllOrdered().get(2).getId();
        var admission = admissionService.admit(patientId("Carter"), bed, "Observation", null);
        mvc.perform(post("/wards/admissions/" + admission.getId() + "/discharge").with(csrf()).param("summary", " "))
                .andExpect(status().isOk()).andExpect(content().string(containsString("discharge summary")));
        mvc.perform(post("/wards/admissions/" + admission.getId() + "/discharge").with(csrf()).param("summary", "Recovered"))
                .andExpect(redirectedUrl("/wards"))
                .andExpect(flash().attribute("notice", containsString("$" + admission.getBed().getRoom().getDailyRate())));
        assertThat(admissions.findById(admission.getId()).orElseThrow().isOpen()).isFalse();
    }

    @Test
    @WithMockUser(roles = "RECEPTION")
    void receptionCannotDischarge() throws Exception {
        mvc.perform(post("/wards/admissions/1/discharge").with(csrf()).param("summary", "x")).andExpect(status().isForbidden());
    }

    // --- ambulances ---

    @Test
    @WithMockUser(roles = "RECEPTION")
    void anAmbulanceGoesOutAndComesBack() throws Exception {
        long id = ambulances.findAllByOrderByRegistrationAsc().get(0).getId();
        mvc.perform(post("/ambulances/" + id + "/dispatch").with(csrf()).param("patientName", "Pat")
                .param("pickupAddress", "1 Main St").param("contactPhone", "555-0111"))
                .andExpect(flash().attribute("notice", containsString("Dispatched AMB-01")));
        mvc.perform(post("/ambulances/" + id + "/dispatch").with(csrf()).param("patientName", "Pat")
                .param("pickupAddress", "1 Main St").param("contactPhone", "555-0111"))
                .andExpect(flash().attribute("error", containsString("not available")));
        mvc.perform(post("/ambulances/" + id + "/return").with(csrf())).andExpect(flash().attribute("notice", containsString("back")));
        mvc.perform(post("/ambulances/" + id + "/return").with(csrf())).andExpect(flash().attribute("error", containsString("not out")));
        mvc.perform(post("/ambulances/" + id + "/maintenance").with(csrf()).param("on", "true")).andExpect(status().isForbidden());
    }

    // --- staff ---

    @Test
    @WithMockUser(username = "admin", roles = "ADMIN")
    void adminsCreateAccountsWithStrongPasswordsAndCannotLockThemselvesOut() throws Exception {
        mvc.perform(post("/staff").with(csrf()).param("username", "new.nurse").param("fullName", "New Nurse")
                .param("role", "NURSE").param("password", "short")).andExpect(status().isOk())
                .andExpect(model().attributeHasFieldErrors("form", "password"));
        mvc.perform(post("/staff").with(csrf()).param("username", "new.nurse").param("fullName", "New Nurse")
                .param("role", "NURSE").param("password", "a-long-enough-password")).andExpect(redirectedUrl("/staff"));
        assertThat(staff.findByUsernameIgnoreCase("new.nurse").orElseThrow().getPasswordHash()).startsWith("{bcrypt}");
        mvc.perform(post("/staff").with(csrf()).param("username", "new.nurse").param("fullName", "Dup")
                .param("role", "NURSE").param("password", "a-long-enough-password")).andExpect(status().isOk())
                .andExpect(content().string(containsString("is taken")));
        long self = staff.findByUsernameIgnoreCase("admin").orElseThrow().getId();
        mvc.perform(post("/staff/" + self + "/enabled").with(csrf()).param("enabled", "false"))
                .andExpect(flash().attribute("error", containsString("your own account")));
    }
}
