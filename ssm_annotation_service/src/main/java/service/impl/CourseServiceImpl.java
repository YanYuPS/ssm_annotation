package service.impl;

import domain.Course;
import mapper.CourseMapper;
import mapper.TeacherMapper;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.CourseService;

import java.util.List;

@Service
@Transactional
public class CourseServiceImpl implements CourseService {

    @Autowired
    private CourseMapper courseMapper;

    @Override
    public List<Course> findAll() {
        return courseMapper.findAll();
    }


}
