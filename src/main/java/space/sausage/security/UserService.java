package space.sausage.security;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.stereotype.Service;
import space.sausage.data.model.Role;
import space.sausage.data.model.User;
import space.sausage.data.RoleRepository;
import space.sausage.data.UserRepository;

import java.util.Collections;
import java.util.HashSet;

@Service
public class UserService implements UserDetailsService {
    private final UserRepository userRepo;
    private final RoleRepository roleRepo;
    private final PasswordEncoder encoder;

    @Autowired
    public UserService(UserRepository userRepo, RoleRepository roleRepo, EncoderFactory factory) {
        this.userRepo = userRepo;
        this.roleRepo = roleRepo;
        this.encoder = factory.create();
    }

    public void register(String username, String password) throws UsernameExistsException {
        if (userRepo.findByUsername(username) != null) {
            throw new UsernameExistsException();
        }

        User user = new User(username, encoder.encode(password));
        user.setRoles(new HashSet<>(Collections.singletonList(roleRepo.findByName(Role.ROLE_USER))));
        userRepo.save(user);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        User user = userRepo.findByUsername(username);

        if (user == null || user.getAuthorities().isEmpty()) {
            throw new UsernameNotFoundException("User not found or has no GrantedAuthority");
        }

        return user;
    }
}
