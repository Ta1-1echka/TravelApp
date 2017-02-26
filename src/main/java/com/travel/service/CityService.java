package com.travel.service;

import com.travel.model.City;
import com.travel.model.Country;

import java.util.List;

/**
 * Created by Tanya on 13.02.2017.
 */
public interface CityService {

    void save(City city);

    List<String> getAllCityName();

    City getCityById(Long id);

    void deleteCityById(Long id);
}
