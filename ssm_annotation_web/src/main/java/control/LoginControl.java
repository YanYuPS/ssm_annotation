package control;

import domain.Login;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.LoginService;

@Controller
//@RequestMapping("/login")
public class LoginControl {

//    @Autowired
//    private LoginService loginService;
//
//    @RequestMapping("/login.do")
//    public ModelAndView login(Login user){
//        ModelAndView mv=new ModelAndView();
//        Login userLogin = loginService.login(user);
//        mv.addObject("userLogin",userLogin);
//        mv.setViewName("index");
//        return mv;
//    }

//    @RequestMapping("/loginPage.do")
//    public ModelAndView login(String error){
//        System.out.println("error:"+error);
//        ModelAndView mv=new ModelAndView();
//        if (error != null) {
//            mv.setViewName("failure");
//        }else{
//            mv.setViewName("login");
//        }
//        return mv;
//    }

//    @RequestMapping("/loginPage.do")
//    public String login(String error){
//
//        System.out.println("error:"+error);
//
//        if (error != null) {
//            return "failure";
//        }else{
//            return "login";
//        }
//    }

}
