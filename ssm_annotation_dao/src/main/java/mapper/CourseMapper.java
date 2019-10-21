package mapper;

import domain.Course;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CourseMapper {

    @Select("select * from course")
    List<Course> findAll();

    @Select("select cname from course where cid=#{cid}")
    String findNameById(String cid);


}
