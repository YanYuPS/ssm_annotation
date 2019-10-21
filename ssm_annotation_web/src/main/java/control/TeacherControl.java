package control;

import domain.Course;
import domain.Teacher;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import service.CourseService;
import service.TeacherService;

import java.util.List;

@Controller
@RequestMapping("/teacher")
public class TeacherControl {

    @Autowired
    private TeacherService teacherService;

    @ResponseBody
    @RequestMapping("/findAll.do")
    public List<Teacher> findAll(){
        return teacherService.findAll();
    }

}
