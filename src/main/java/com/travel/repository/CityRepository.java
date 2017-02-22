package com.travel.repository;

import com.travel.model.City;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Tanya on 13.02.2017.
 */
public interface CityRepository extends CrudRepository<City, Long> {

    City findByCityName(String cityName);

    @Query("select c.cityName from City c")
    List<String> findAllCities();
}
