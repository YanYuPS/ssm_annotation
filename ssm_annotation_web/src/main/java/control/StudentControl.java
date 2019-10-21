package control;

import domain.PageResult;
import domain.Student;
import domain.StudentCourse;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import service.StudentService;

import java.util.List;

@Controller
@RequestMapping("/student")
public class StudentControl {

    @Autowired
    private StudentService studentService;

    @ResponseBody
    @RequestMapping("/findAllStudent.do")
    public PageResult findAllStudent(int pageNum, int pageSize){
        return studentService.findAllStudent(pageNum, pageSize);
    }

    @ResponseBody
    @RequestMapping("/findAllStuCou.do")
    public PageResult findAllStuCou(String roles, String id, StudentCourse studentCourse,PageResult pageResult){
        return studentService.findAllStuCou( roles, id, studentCourse, pageResult);
    }

    @ResponseBody
    @RequestMapping("/findNameById.do")
    public Student findNameById(String id,String roles){
        return studentService.findNameById(id,roles);
    }

//    @ResponseBody
    @RequestMapping("/updateStuCou.do")
    public ModelAndView updateStuCou(StudentCourse studentCourse){
        String message=studentService.updateStuCou(studentCourse);

        ModelAndView mv=new ModelAndView();
        mv.setViewName("course");
        mv.addObject("message",message);
        return mv;
    }

    @ResponseBody
    @RequestMapping("/deleteStuCou.do")
    public String deleteStuCou(@RequestBody List<StudentCourse> studentCourseList){
        String message=studentService.deleteStuCou(studentCourseList);

//        ModelAndView mv=new ModelAndView();
//        mv.setViewName("course");
//        mv.addObject("message",message);
        return message;
    }

    @ResponseBody
    @RequestMapping("/findAll.do")
    public List<Student> findAll(){
        return studentService.findAll();
    }

    @RequestMapping("/insertStuCou.do")
    public ModelAndView insertStuCou(StudentCourse studentCourse){
        String message=studentService.insertStuCou(studentCourse);

        ModelAndView mv=new ModelAndView();
        mv.setViewName("course");
        mv.addObject("message",message);
        return mv;
    }

    @ResponseBody
    @RequestMapping("/isHasSC.do")
    public int isHasSC(StudentCourse studentCourse) {
        return studentService.isHasSC(studentCourse);
    }
}
