package io.github.adit12t.hospital.web;

/** A business rule said no (bed taken, not enough blood, ...). Shown to the user as a form error. */
public class RuleViolation extends RuntimeException {
    public RuleViolation(String message) {
        super(message);
    }
}
