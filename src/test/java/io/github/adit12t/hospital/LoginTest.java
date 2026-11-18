package io.github.adit12t.hospital;

import io.github.adit12t.hospital.config.InitialData;
import org.junit.jupiter.api.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.boot.test.autoconfigure.web.servlet.AutoConfigureMockMvc;
import org.springframework.boot.test.context.SpringBootTest;
import org.springframework.test.web.servlet.MockMvc;

import static org.springframework.security.test.web.servlet.request.SecurityMockMvcRequestBuilders.formLogin;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.authenticated;
import static org.springframework.security.test.web.servlet.response.SecurityMockMvcResultMatchers.unauthenticated;

@SpringBootTest
@AutoConfigureMockMvc
class LoginTest {

    @Autowired MockMvc mvc;

    @Test
    void demoAccountsSignInWithTheirPassword() throws Exception {
        mvc.perform(formLogin().user("dr.rao").password(InitialData.DEMO_PASSWORD)).andExpect(authenticated().withRoles("DOCTOR"));
        mvc.perform(formLogin().user("dr.rao").password("wrong-password")).andExpect(unauthenticated());
        mvc.perform(formLogin().user("nobody").password("whatever-password")).andExpect(unauthenticated());
    }

    @Test
    void fiveWrongPasswordsLockTheAccount() throws Exception {
        for (int i = 0; i < 5; i++) {
            mvc.perform(formLogin().user("nurse.kim").password("guess-" + i)).andExpect(unauthenticated());
        }
        mvc.perform(formLogin().user("nurse.kim").password(InitialData.DEMO_PASSWORD)).andExpect(unauthenticated());
        mvc.perform(formLogin().user("frontdesk").password(InitialData.DEMO_PASSWORD)).andExpect(authenticated());
    }
}
