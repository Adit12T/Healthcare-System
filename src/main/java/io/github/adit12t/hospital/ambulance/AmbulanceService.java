package io.github.adit12t.hospital.ambulance;

import io.github.adit12t.hospital.ambulance.AmbulanceRepositories.AmbulanceRepository;
import io.github.adit12t.hospital.ambulance.AmbulanceRepositories.DispatchRepository;
import io.github.adit12t.hospital.web.NotFoundException;
import io.github.adit12t.hospital.web.RuleViolation;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import java.time.Clock;
import java.time.LocalDateTime;

/** Moves an ambulance AVAILABLE -> DISPATCHED -> AVAILABLE, or in and out of MAINTENANCE when idle. */
@Service
public class AmbulanceService {

    private final AmbulanceRepository ambulances;
    private final DispatchRepository dispatches;
    private final Clock clock;

    public AmbulanceService(AmbulanceRepository ambulances, DispatchRepository dispatches, Clock clock) {
        this.ambulances = ambulances;
        this.dispatches = dispatches;
        this.clock = clock;
    }

    @Transactional
    public Dispatch dispatch(long ambulanceId, String patientName, String pickupAddress, String contactPhone) {
        Ambulance a = ambulances.findByIdForUpdate(ambulanceId).orElseThrow(() -> new NotFoundException("Ambulance"));
        if (a.getStatus() != Ambulance.Status.AVAILABLE) {
            throw new RuleViolation(a.getRegistration() + " is " + a.getStatus().name().toLowerCase() + ", not available.");
        }
        a.setStatus(Ambulance.Status.DISPATCHED);
        return dispatches.save(new Dispatch(a, patientName.strip(), pickupAddress.strip(), contactPhone.strip(), LocalDateTime.now(clock)));
    }

    @Transactional
    public void markReturned(long ambulanceId) {
        Ambulance a = ambulances.findByIdForUpdate(ambulanceId).orElseThrow(() -> new NotFoundException("Ambulance"));
        Dispatch d = dispatches.findFirstByAmbulanceIdAndReturnedAtIsNull(ambulanceId)
                .orElseThrow(() -> new RuleViolation(a.getRegistration() + " is not out on a call."));
        d.markReturned(LocalDateTime.now(clock));
        a.setStatus(Ambulance.Status.AVAILABLE);
    }

    @Transactional
    public void setMaintenance(long ambulanceId, boolean inMaintenance) {
        Ambulance a = ambulances.findByIdForUpdate(ambulanceId).orElseThrow(() -> new NotFoundException("Ambulance"));
        if (a.getStatus() == Ambulance.Status.DISPATCHED) {
            throw new RuleViolation(a.getRegistration() + " is out on a call.");
        }
        a.setStatus(inMaintenance ? Ambulance.Status.MAINTENANCE : Ambulance.Status.AVAILABLE);
    }
}
