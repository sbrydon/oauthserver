package space.sausage.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import space.sausage.security.UserService;
import space.sausage.security.UsernameExistsException;
import space.sausage.web.dto.RegistrationDto;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;

@Service
public class RegistrationService {
    private final UserService service;

    @Autowired
    public RegistrationService(UserService service) {
        this.service = service;
    }

    public String register(RegistrationDto dto,
                           BindingResult result,
                           HttpServletRequest request) throws ServletException {
        if (result.hasErrors()) {
            return "registration";
        }

        try {
            service.register(dto.getEmail(), dto.getPassword());
        } catch (UsernameExistsException e) {
            result.addError(new FieldError("registration", "email", e.getMessage()));
            return "registration";
        }

        request.login(dto.getEmail(), dto.getPassword());
        return "redirect:/apps";
    }
}
