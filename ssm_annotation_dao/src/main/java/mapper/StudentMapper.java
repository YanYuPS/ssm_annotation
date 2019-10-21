package mapper;

import domain.Student;
import domain.Teacher;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface StudentMapper {

    @Select("select * from student")
    List<Student> findAll();

    @Select("select * from student where id=#{id}")
    Student findStuById(String id);

    @Select("select name from student where id=#{id}")
    String findStuNameById(String id);

    //动态表名用 $
    @Select("select name from ${tableName} where id=#{id}")
    String findNameById(@Param("tableName") String tableName, @Param("id") String id);

}
