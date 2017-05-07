package space.sausage.security;

import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Component;

@Component
public class EncoderFactory {
    public PasswordEncoder create() {
        return new BCryptPasswordEncoder();
    }
}
