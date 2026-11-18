package io.github.adit12t.hospital.ward;

import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.constraints.Size;

public class AdmitForm {
    @NotNull(message = "choose a patient")
    private Long patientId;
    @NotNull(message = "choose a bed")
    private Long bedId;
    @NotBlank @Size(max = 300)
    private String reason;
    @Size(max = 100)
    private String attendingDoctor;

    public Long getPatientId() { return patientId; }
    public void setPatientId(Long v) { patientId = v; }
    public Long getBedId() { return bedId; }
    public void setBedId(Long v) { bedId = v; }
    public String getReason() { return reason; }
    public void setReason(String v) { reason = v; }
    public String getAttendingDoctor() { return attendingDoctor; }
    public void setAttendingDoctor(String v) { attendingDoctor = v; }
}
