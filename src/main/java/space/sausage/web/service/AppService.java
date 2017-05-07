package space.sausage.web.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.oauth2.provider.ClientAlreadyExistsException;
import org.springframework.security.oauth2.provider.ClientRegistrationService;
import org.springframework.security.oauth2.provider.client.BaseClientDetails;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.validation.BindingResult;
import org.springframework.validation.FieldError;
import space.sausage.data.UserRepository;
import space.sausage.data.model.App;
import space.sausage.data.model.Role;
import space.sausage.data.model.User;
import space.sausage.security.EncoderFactory;
import space.sausage.web.dto.AppDto;

import java.util.Collections;

@Service
@Transactional
public class AppService {
    private final UserRepository userRepo;
    private final ClientRegistrationService clientService;
    private final PasswordEncoder encoder;

    @Autowired
    public AppService(
            UserRepository userRepo,
            ClientRegistrationService clientService,
            EncoderFactory factory
    ) {
        this.userRepo = userRepo;
        this.clientService = clientService;
        this.encoder = factory.create();
    }

    public String add(User user, AppDto dto, BindingResult result) {
        if (result.hasErrors()) {
            return "add_app";
        }

        BaseClientDetails clientDetails = createClientDetails(dto);
        try {
            clientService.addClientDetails(clientDetails);
        } catch (ClientAlreadyExistsException e) {
            result.addError(new FieldError("app", "clientId", e.getMessage()));
            return "add_app";
        }

        App app = new App(dto.getName(), user, clientDetails.getClientId());
        user.getApps().add(app);
        userRepo.save(user);

        return "redirect:/apps";
    }

    private BaseClientDetails createClientDetails(AppDto dto) {
        BaseClientDetails clientDetails = new BaseClientDetails();
        clientDetails.setClientId(dto.getClientId());
        clientDetails.setClientSecret(encoder.encode(dto.getClientSecret()));
        clientDetails.setAuthorizedGrantTypes(Collections.singletonList("client_credentials"));
        clientDetails.setAuthorities(Collections.singletonList(new SimpleGrantedAuthority(Role.ROLE_USER)));
        clientDetails.setScope(Collections.singletonList("read"));
        clientDetails.setAccessTokenValiditySeconds(120);
        return clientDetails;
    }
}
