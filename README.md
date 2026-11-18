# Hospital Management System

[![CI](https://github.com/Adit12T/Healthcare-System/actions/workflows/ci.yml/badge.svg)](https://github.com/Adit12T/Healthcare-System/actions/workflows/ci.yml)

A web application for running a small hospital's front desk, wards, blood bank and ambulance fleet,
with a sign-in for each member of staff and permissions by role. Built with **Java 21, Spring Boot 3.5,
Spring Security, Spring Data JPA, Flyway and Thymeleaf**; runs on H2 for a demo or PostgreSQL in
production.

It's a rebuild of a JSP and servlet hospital system I wrote as a college project in 2015, which is
kept in [`legacy/`](legacy).

## Modules

| Module | What it does | Rules it enforces |
|---|---|---|
| **Patients** | Register, search by name or phone, edit, view admission history | Validated fields (date of birth in the past, phone format, lengths) |
| **Wards** | Live bed board by room; admit to a free bed; discharge with a summary | A bed holds one patient and a patient one bed (row-locked, so two clerks can't book the same bed); the stay is charged at the room's daily rate per calendar day started |
| **Blood bank** | Stock by group, donors, donations, issues to patients | Donors 18–65, at least 50 kg, 56 days between donations; blood is issued only from groups compatible with the patient's recorded group, and never more than the stock |
| **Ambulances** | Fleet status, dispatch with pickup details, returns, maintenance | Only an available ambulance can be dispatched; one on a call can't go to maintenance |
| **Staff** | Accounts for admins, doctors, nurses and reception | Usernames unique; passwords 12+ characters, stored with bcrypt; an admin can't disable themselves or the last admin |

## Roles

| | Admin | Doctor | Nurse | Reception |
|---|:-:|:-:|:-:|:-:|
| View patients, wards, blood stock, fleet | ✓ | ✓ | ✓ | ✓ |
| Register and edit patients, admit | ✓ | | | ✓ |
| Discharge | ✓ | ✓ | | |
| Register donors, record donations | ✓ | ✓ | ✓ | |
| Issue blood | ✓ | ✓ | | |
| Dispatch ambulances | ✓ | | | ✓ |
| Manage staff, ambulance maintenance | ✓ | | | |

## Security

- Form sign-in with sessions that change ID at login and expire after 30 minutes idle; every form is
  CSRF-protected.
- An account is locked for 15 minutes after 5 wrong passwords (tracked in memory, bounded).
- Permissions are checked on every controller method, not just hidden in the page.
- A strict Content Security Policy (no scripts at all), `X-Frame-Options: DENY` and a same-origin referrer policy.
- Every query is parameterised through JPA; the schema is versioned with Flyway.
- Database credentials and the first admin's password come from environment variables. The 2015 code
  had `root/root` in 13 places; that's removed there too.

## Run it

**Demo** (in-memory database with sample patients, donors and four accounts):

```bash
mvn spring-boot:run
# open http://localhost:8080 and sign in as admin, dr.rao, nurse.kim or frontdesk
# with the password demo-password-123
```

**Production-style** on PostgreSQL with Docker:

```bash
printf 'HMS_DB_PASSWORD=change-me-db-password\nHMS_ADMIN_PASSWORD=change-me-admin-password\n' > .env
docker compose up --build
# sign in as admin with HMS_ADMIN_PASSWORD
```

| Variable | Purpose |
|---|---|
| `SPRING_PROFILES_ACTIVE` | `demo` (default) loads sample data; `prod` doesn't and marks cookies `Secure` |
| `HMS_DB_URL`, `HMS_DB_USER`, `HMS_DB_PASSWORD` | Database connection |
| `HMS_ADMIN_PASSWORD` | Creates an `admin` account on an empty database (12+ characters) |

## Tests

```bash
mvn verify
```

Integration tests run the whole application on H2: every page renders for each role, write actions
are refused for roles without them, CSRF and security headers are checked, sign-in and lockout work,
and each rule in the table above (bed and patient double-booking, discharge charges, blood
compatibility for all eight groups, stock limits, donor eligibility, the ambulance life cycle, staff
password and self-lockout rules) has a test.

## What's not included

The 2015 system also had pathology, inventory, operation theatre, attendance and payroll screens.
Version 2 covers the patient-facing core first; the legacy code shows how those modules worked.
Blood units are counted but not tracked to expiry.

## License

Copyright © 2015–2026 Aditya Tripathi. All rights reserved. The code is published for viewing only; see
[LICENSE](LICENSE).
