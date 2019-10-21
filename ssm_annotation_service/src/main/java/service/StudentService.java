package service;

import domain.PageResult;
import domain.Student;
import domain.StudentCourse;

import java.util.List;

public interface StudentService {
    /**
     * 学生
     * @param pageNum
     * @param pageSize
     * @return
     */
    PageResult findAllStudent(int pageNum, int pageSize);

    /**
     * 学生选课
     * @return
     */
    PageResult findAllStuCou(String roles, String id, StudentCourse studentCourse, PageResult pageResult);

    /**
     * 根据id，获取姓名(student.name)
     * @return
     */
    Student findNameById(String id, String roles);

    String updateStuCou(StudentCourse studentCourse);

    String deleteStuCou(List<StudentCourse> studentCourseList);

    List<Student> findAll();

    String insertStuCou(StudentCourse studentCourse);

    int isHasSC(StudentCourse studentCourse);
}
