package mapper;

import domain.Login;
import org.apache.ibatis.annotations.Many;
import org.apache.ibatis.annotations.Result;
import org.apache.ibatis.annotations.Results;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface LoginMapper {

    @Select("select * from login where username=#{username} and password=#{password}")
    @Results({
            @Result(column = "username", property = "username"),
            @Result(column = "password", property = "password")
    })
    Login login(Login user);


    @Select("select * from login where username=#{username}")
    @Results({
            @Result(column = "username", property = "username"),
            @Result(column = "password", property = "password"),
            @Result(column = "username", property = "roles", javaType = List.class,
                    many = @Many(select = "mapper.RoleMapper.findRoleByLoginId"))
    })
    Login findByUsername(String username);

}
