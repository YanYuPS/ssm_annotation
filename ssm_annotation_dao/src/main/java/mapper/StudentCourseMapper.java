package mapper;

import domain.Student;
import domain.StudentCourse;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface StudentCourseMapper {

//    @Select("select * from student_course")
//    @Results({
//            @Result(property = "cid",column = "cid"),
//            @Result(property = "sid",column = "sid"),
//            @Result(property = "score",column = "score"),
//            @Result(property = "sname",column = "sid",javaType = String.class,
//                    one = @One(select = "mapper.StudentMapper.findStuNameById")),
//            @Result(property = "cname",column = "cid",javaType = String.class,
//                    one = @One(select = "mapper.CourseMapper.findNameById")), //课程表，根据id查询名字
//            @Result(property = "tname",column = "cid",javaType = String.class,
//                    one = @One(select = "mapper.TeacherMapper.findNameByCId")) //根据课程id，查询教课老师名字
//    })

//    @Select("select * from student_course sc,student s,course c, " +
//            "(select t.name tname,tc.cid cid from teacher t,teacher_course tc where t.id=tc.tid) t_tc " +
//            "where sc.sid=s.id and sc.cid=c.cid and sc.cid=t_tc.cid " +
//            "and sc.cid like concat('%',#{studentCourse.cid},'%') " +
//            "and c.cname like concat('%',#{studentCourse.cname},'%') " +
//            "and t_tc.tname like concat('%',#{studentCourse.tname},'%') " +
//            "and s.name like concat('%',#{studentCourse.sname},'%') ")

//    @Select("<script>" +
//            "select * from student_course sc,student s,course c, " +
//            "(select t.name tname,tc.cid cid,t.id tid from teacher t,teacher_course tc where t.id=tc.tid) t_tc " +
//
//            "<where>" +
//                "sc.sid=s.id and sc.cid=c.cid and sc.cid=t_tc.cid " +
//                "and sc.cid like concat('%',#{studentCourse.cid},'%') " +
//                "and c.cname like concat('%',#{studentCourse.cname},'%') " +
//                "and t_tc.tname like concat('%',#{studentCourse.tname},'%') " +
//                "and s.name like concat('%',#{studentCourse.sname},'%') " +
//
//                "<if test='role == 1'>" +
//                    "and sid=#{id}"+
//                "</if>"+
//                "<if test='role == 2'>" +
//                    "and tid=#{id}"+
//                "</if>"+
//            "</where>" +
//            "</script>")
    @Select("<script>" +
            "select * from student_course sc,student s, " +

            "(select t.name tname, c.cname cname, t.id tid, c.cid cid, tc.tcid tcid " +
            "from teacher_course tc,teacher t,course c " +
            "where tc.tid=t.id and tc.cid=c.cid) t_tc " +

            "<where>" +
            "sc.sid=s.id and sc.tcid=t_tc.tcid " +
            "and t_tc.cid like concat('%',#{studentCourse.cid},'%') " +
            "and t_tc.cname like concat('%',#{studentCourse.cname},'%') " +
            "and t_tc.tname like concat('%',#{studentCourse.tname},'%') " +
            "and s.name like concat('%',#{studentCourse.sname},'%') " +

            "<if test='role == 1'>" +
            "and sid=#{id}"+
            "</if>"+
            "<if test='role == 2'>" +
            "and t_tc.tid=#{id}"+
            "</if>"+
            "</where>" +
            "</script>")
    @Results({
            @Result(property = "cid",column = "cid"),
            @Result(property = "cname",column = "cname"),
            @Result(property = "sid",column = "sid"),
            @Result(property = "sname",column = "name"),
            @Result(property = "tid",column = "tid"),
            @Result(property = "tname",column = "tname"),
            @Result(property = "score",column = "score")
    })
    List<StudentCourse> findAll(@Param("id") String id,@Param("role") String role,@Param("studentCourse") StudentCourse studentCourse);


    /**
     * 修改成绩
     * @param studentCourse
     * @return
     */
    @Update("update student_course set score=#{score} where sid=#{sid} and " +
            "tcid=(select tcid from teacher_course where tid=#{tid} and cid=#{cid})")
    int update(StudentCourse studentCourse);


    @Select("select score from student_course where sid=#{sid} and " +
            "tcid=(select tcid from teacher_course where tid=#{tid} and cid=#{cid})")
    String isHasSC(StudentCourse studentCourse);

    @Select("select tcid from teacher_course where tid=#{tid} and cid=#{cid}")
    String isHasTC(StudentCourse studentCourse);

    @Insert("insert into teacher_course(tid,cid) values(#{tid},#{cid})")
    int insertTC(StudentCourse studentCourse);
    @Select("select tcid from teacher_course where tid=#{tid} and cid=#{cid}")
    int getTCID(StudentCourse studentCourse);
    @Insert("insert into student_course(sid,tcid,score) values(#{studentCourse.sid},#{tcid},#{studentCourse.score})")
    int insertSC(@Param("tcid") int tcid,@Param("studentCourse") StudentCourse studentCourse);


    @Delete("delete from student_course where sid=#{sid} and " +
            "tcid=(select tcid from teacher_course where tid=#{tid} and cid=#{cid})")
    int delete(StudentCourse studentCourse);
}
