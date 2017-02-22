package com.travel.service.impl;

import com.travel.model.City;
import com.travel.model.Country;
import com.travel.model.Hotel;
import com.travel.repository.CityRepository;
import com.travel.service.CityService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Tanya on 13.02.2017.
 */
@Service
@Transactional
public class CityServiceImpl implements CityService {

    @Autowired
    private CityRepository cityRepository;

    @Override
    public void save(City city) {
        cityRepository.save(city);
    }

    @Override
    public List<String> getAllCityName() {
        return cityRepository.findAllCities();
    }

    @Override
    public City getCityById(Long id) {
        return cityRepository.findOne(id);
    }

    @Override
    public void deleteCityById(Long id) {
        cityRepository.delete(id);
    }

    @Override
    public List<City> getPersistObject(Country country) {
        List<City> cityList = new ArrayList<>();
        for (City city : country.getCityList()) {
            List<Hotel> hotelList = city.getHotelList();
            city = cityRepository.findByCityName(city.getCityName());
            city.setHotelList(hotelList);
            cityList.add(city);
        }
        return cityList;
    }
}
