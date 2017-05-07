package space.sausage.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import space.sausage.web.dto.LoginDto;
import space.sausage.web.dto.RegistrationDto;
import space.sausage.web.service.RegistrationService;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

@Controller
public class UserController {
    private final RegistrationService service;

    @Autowired
    public UserController(RegistrationService service) {
        this.service = service;
    }

    @RequestMapping(value = "/registration", method = RequestMethod.GET)
    public String getRegistration(Model model) {
        model.addAttribute("registration", new RegistrationDto());
        return "registration";
    }

    @RequestMapping(value = "/registration", method = RequestMethod.POST)
    public String postRegistration(@Valid @ModelAttribute("registration") RegistrationDto dto,
                                   BindingResult result,
                                   HttpServletRequest request) throws ServletException {
        return service.register(dto, result, request);
    }

    @RequestMapping(value = "/login", method = RequestMethod.GET)
    public String getLogin(Model model) {
        model.addAttribute("login", new LoginDto());
        return "login";
    }
}
