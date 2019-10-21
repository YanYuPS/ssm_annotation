package service;

import domain.Login;
import org.springframework.security.core.userdetails.UserDetailsService;

public interface LoginService extends UserDetailsService {
    Login login(Login user);
}
