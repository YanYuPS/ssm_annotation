package control;

import domain.Course;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CourseService;

import java.util.List;

@Controller
@RequestMapping("/course")
public class CourseControl {

    @Autowired
    private CourseService courseService;

    @ResponseBody
    @RequestMapping("/findAll.do")
    public List<Course> findAll(){
        return courseService.findAll();
    }

}
