package service.impl;

import domain.Course;
import domain.Teacher;
import mapper.CourseMapper;
import mapper.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.CourseService;
import service.TeacherService;

import java.util.List;

@Service
@Transactional
public class TeacherServiceImpl implements TeacherService {

    @Autowired
    private TeacherMapper teacherMapper;

    @Override
    public List<Teacher> findAll() {
        return teacherMapper.findAll();
    }


}
