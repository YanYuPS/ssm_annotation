package service.impl;

import com.github.pagehelper.Page;
import com.github.pagehelper.PageHelper;
import domain.PageResult;
import domain.Student;
import domain.StudentCourse;
import mapper.StudentCourseMapper;
import mapper.StudentMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.stereotype.Service;
import service.StudentService;

import javax.annotation.security.RolesAllowed;
import java.security.Principal;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collection;
import java.util.List;

@Service
public class StudentServiceImpl implements StudentService {

    @Autowired
    private StudentMapper studentMapper;

    @Autowired
    private StudentCourseMapper studentCourseMapper;

    @Override
    public PageResult findAllStudent(int pageNum, int pageSize) {
        PageHelper.startPage(pageNum,pageSize);
        Page<Student> page = (Page<Student>) studentMapper.findAll();
        return new PageResult(page.getTotal(),page.getResult());
    }

    @Override
    public PageResult findAllStuCou(String roles, String id, StudentCourse studentCourse,PageResult pageResult) {
//        String[] roleArray = getRole(roles);
        String role="1";
        if(roles.contains("ADMIN")){
            role="3";
        }else if(roles.contains("TEACHER")){
            role="2";
        }

        PageHelper.startPage(pageResult.getPageNum(), pageResult.getPageSize());
        Page<StudentCourse> page= (Page<StudentCourse>) studentCourseMapper.findAll(id,role,studentCourse);
        return new PageResult(page.getTotal(),page.getResult());
    }


//    @RolesAllowed({"STUDENT"}) //允许权限：包含ROLE_STUDENT
//    @PreAuthorize("#sid==authentication.principal.userId or hasAuthority('ADMIN')")
    @Override
    public Student findNameById(String id,String roles) {
        Student student=new Student();
        student.setName(studentMapper.findNameById(getRole(roles)[0],id));
        return student;
    }

    /**
     * 更新成绩
     * @param studentCourse
     * @return
     */
    @Override
    public String updateStuCou(StudentCourse studentCourse) {
        int re=studentCourseMapper.update(studentCourse);
        if(re>0){
            return "更新成绩成功";
        }else{
            return "更新成绩失败";
        }
    }

    @Override
    public String deleteStuCou(List<StudentCourse> studentCourseList) {
        int re=0;
        for(StudentCourse sc:studentCourseList){
            re=studentCourseMapper.delete(sc);
        }
        if(re>0){
            return "删除选课成功";
        }else{
            return "删除选课失败";
        }
    }

    @Override
    public List<Student> findAll() {
        return studentMapper.findAll();
    }

    @Override
    public String insertStuCou(StudentCourse studentCourse) {
        int isHasSC=isHasSC(studentCourse);
        if(-1 != isHasSC){    //整个选课已存在, 更新成绩
            return updateStuCou(studentCourse);
        }

        int tcid=isHasTC(studentCourse);
        if(-1 == tcid){
            int tcRe=studentCourseMapper.insertTC(studentCourse);
            tcid=studentCourseMapper.getTCID(studentCourse);
        }
        //教课已存在, 添加选课
        int scRe=studentCourseMapper.insertSC(tcid,studentCourse);

        if(scRe>0){
            return "添加选课成功";
        }else{
            return "添加选课失败";
        }
    }

    /**
     * 教课
     * @param studentCourse
     * @return tcid
     */
    public int isHasTC(StudentCourse studentCourse) {
        String tcidStr=studentCourseMapper.isHasTC(studentCourse);
        int tcid=-1;
        if(null!=tcidStr){
            tcid=Integer.parseInt(tcidStr);
        }
        return tcid;
    }

    /**
     * 选课
     * @param studentCourse
     * @return 成绩
     */
    @Override
    public int isHasSC(StudentCourse studentCourse) {
        String scoreStr=studentCourseMapper.isHasSC(studentCourse);
        int score=-1;
        if(null!=scoreStr){
            score=Integer.parseInt(scoreStr);
        }
        return score;
    }


    private String[] getRole(String roles){
        return roles.substring(1, roles.length() - 1).replaceAll("ROLE_", "").split(",");
    }

    /**
     * 当前用户的id
     * @return
     */
    private String getId(){
        return SecurityContextHolder.getContext().getAuthentication().getName();
    }
    /**
     * 当前用户的角色
     * @return
     */
    private List<String> getRoleList(){
        List<String> roleList=new ArrayList<>();
        Collection<? extends GrantedAuthority> authorities = SecurityContextHolder.getContext().getAuthentication().getAuthorities();

        for(Object role:authorities){
            roleList.add(role.toString().replace("ROLE_",""));
        }
        return roleList;
    }

}
