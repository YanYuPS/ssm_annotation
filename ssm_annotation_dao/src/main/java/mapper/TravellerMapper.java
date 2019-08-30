package mapper;

import domain.Traveller;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface TravellerMapper {

    @Select("select * from traveller")
    List<Traveller> findAll();

}
