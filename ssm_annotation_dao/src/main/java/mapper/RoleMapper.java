package mapper;

import domain.Login;
import domain.Role;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface RoleMapper {

    @Select("select * from role r,login_role lr where r.id=lr.roleId and lr.loginId=#{loginId}")
    @Results({
            @Result(column = "id", property = "id"),
            @Result(column = "roleName", property = "roleName"),
            @Result(column = "roleDesc", property = "roleDesc")
    })
    List<Role> findRoleByLoginId(String loginId);


}
