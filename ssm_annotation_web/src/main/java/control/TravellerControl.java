package control;


import domain.Traveller;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.TravellerService;

import java.util.List;

@Controller
//@RequestMapping("/traveller")
public class TravellerControl {

    @Autowired
    private TravellerService travellerService;

    @ResponseBody
    @RequestMapping("/findAll.do")
    public ModelAndView findAll(){
        System.out.println("--------------web---------");
        ModelAndView mv=new ModelAndView();
        List<Traveller> travellerList=travellerService.findAll();
        mv.addObject("travellerList",travellerList);
        mv.setViewName("traveller");

        return mv;
    }


}
