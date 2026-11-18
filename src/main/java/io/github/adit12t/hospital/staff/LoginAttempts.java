package io.github.adit12t.hospital.staff;

import org.springframework.context.event.EventListener;
import org.springframework.security.authentication.event.AuthenticationFailureBadCredentialsEvent;
import org.springframework.security.authentication.event.AuthenticationSuccessEvent;
import org.springframework.stereotype.Component;

import java.time.Clock;
import java.time.Duration;
import java.time.Instant;
import java.util.ArrayDeque;
import java.util.Deque;
import java.util.LinkedHashMap;
import java.util.Locale;
import java.util.Map;

/**
 * Locks a username for 15 minutes after 5 wrong passwords within 15 minutes, to slow password guessing.
 * Kept in memory (single instance) and bounded, so random usernames can't exhaust it.
 */
@Component
public class LoginAttempts {

    static final int MAX_FAILURES = 5;
    static final Duration WINDOW = Duration.ofMinutes(15);
    private static final int MAX_TRACKED = 10_000;

    private final Clock clock;
    private final Map<String, Deque<Instant>> failures = new LinkedHashMap<>(16, 0.75f, true) {
        @Override
        protected boolean removeEldestEntry(Map.Entry<String, Deque<Instant>> eldest) {
            return size() > MAX_TRACKED;
        }
    };

    public LoginAttempts(Clock clock) {
        this.clock = clock;
    }

    public synchronized boolean isLocked(String username) {
        Deque<Instant> recent = recent(key(username));
        return recent != null && recent.size() >= MAX_FAILURES;
    }

    @EventListener
    public synchronized void onFailure(AuthenticationFailureBadCredentialsEvent event) {
        String key = key(String.valueOf(event.getAuthentication().getPrincipal()));
        Deque<Instant> recent = recent(key);
        if (recent == null) {
            recent = new ArrayDeque<>();
            failures.put(key, recent);
        }
        recent.addLast(clock.instant());
    }

    @EventListener
    public synchronized void onSuccess(AuthenticationSuccessEvent event) {
        failures.remove(key(event.getAuthentication().getName()));
    }

    private Deque<Instant> recent(String key) {
        Deque<Instant> q = failures.get(key);
        if (q == null) {
            return null;
        }
        Instant cutoff = clock.instant().minus(WINDOW);
        while (!q.isEmpty() && q.peekFirst().isBefore(cutoff)) {
            q.pollFirst();
        }
        if (q.isEmpty()) {
            failures.remove(key);
            return null;
        }
        return q;
    }

    private static String key(String username) {
        return username.strip().toLowerCase(Locale.ROOT);
    }
}
