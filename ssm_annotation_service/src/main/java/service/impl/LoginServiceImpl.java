package service.impl;

import domain.Login;
import domain.Role;
import mapper.LoginMapper;
import mapper.RoleMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.LoginService;

import java.util.ArrayList;
import java.util.List;

@Service("userService")
//@Service
@Transactional
public class LoginServiceImpl implements LoginService {

    @Autowired
    private LoginMapper loginMapper;

    @Override
    public Login login(Login user) {
        return loginMapper.login(user);
    }

    @Override
    public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
        Login login = loginMapper.findByUsername(username);
        List<SimpleGrantedAuthority> authoritys = getAuthority(login.getRoles());
        User user = new User(login.getUsername(), "{noop}" + login.getPassword(),authoritys);
        return user;
    }
    private List<SimpleGrantedAuthority> getAuthority(List<Role> roles) {
        List<SimpleGrantedAuthority> authoritys = new ArrayList();
        for (Role role : roles) {
            System.out.println("role:"+role);
            authoritys.add(new SimpleGrantedAuthority("ROLE_"+role.getRoleName()));
        }
        return authoritys;
    }
}
