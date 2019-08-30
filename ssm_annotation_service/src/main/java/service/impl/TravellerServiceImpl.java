package service.impl;

import domain.Traveller;
import mapper.TravellerMapper;
import org.junit.Test;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import service.TravellerService;

import java.util.List;

@Service("travellerService")
@Transactional
public class TravellerServiceImpl implements TravellerService {

    @Autowired
    private TravellerMapper travellerMapper;


    public List<Traveller> findAll() {
        System.out.println("--------------service---------");
        return travellerMapper.findAll();
    }


}
