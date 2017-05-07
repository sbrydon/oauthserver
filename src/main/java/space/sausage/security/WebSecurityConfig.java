package space.sausage.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.crypto.password.PasswordEncoder;
import space.sausage.data.model.Role;

@Configuration
@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
    private final UserService service;
    private final PasswordEncoder encoder;

    @Autowired
    public WebSecurityConfig(UserService service, EncoderFactory factory) {
        this.service = service;
        this.encoder = factory.create();
    }

    @Override
    protected void configure(HttpSecurity http) throws Exception {
        // @formatter:off
        http.authorizeRequests()
            .antMatchers("/registration").permitAll()
            .anyRequest().hasAnyRole(Role.USER, Role.ADMIN)
        .and().formLogin()
            .usernameParameter("email")
            .loginPage("/login")
            .defaultSuccessUrl("/apps", true)
            .permitAll()
        .and().logout();
        // @formatter:on
    }

    @Override
    protected void configure(AuthenticationManagerBuilder auth) throws Exception {
        auth.userDetailsService(service).passwordEncoder(encoder);
    }
}
