package mapper;

import domain.Teacher;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TeacherMapper {

    @Select("select * from teacher")
    List<Teacher> findAll();

    @Select("select name from teacher where id=#{tid}")
    String findNameByTId(String tid);

    @Select("select t.name name from teacher t,teacher_course tc where t.id=tc.tid and tc.cid=#{cid}")
    String findNameByCId(String cid);
}
