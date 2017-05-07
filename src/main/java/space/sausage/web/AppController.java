package space.sausage.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.annotation.AuthenticationPrincipal;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import space.sausage.data.model.User;
import space.sausage.web.dto.AppDto;
import space.sausage.web.service.AppService;

import javax.validation.Valid;

@Controller
public class AppController {
    private final AppService service;

    @Autowired
    public AppController(AppService service) {
        this.service = service;
    }

    @RequestMapping(value = "/apps", method = RequestMethod.GET)
    public String getApps(@AuthenticationPrincipal User user, Model model) {
        model.addAttribute("apps", user.getApps());
        return "apps";
    }

    @RequestMapping(value = "/apps/add", method = RequestMethod.GET)
    public String getAppsAdd(Model model) {
        model.addAttribute("app", new AppDto());
        return "add_app";
    }

    @RequestMapping(value = "/apps/add", method = RequestMethod.POST)
    public String postApp(@AuthenticationPrincipal User user,
                          @Valid @ModelAttribute("app") AppDto app,
                          BindingResult result) {
        return service.add(user, app, result);
    }
}
