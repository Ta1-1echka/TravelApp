package com.travel.repository;

import com.travel.model.Hotel;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.List;

/**
 * Created by Tanya on 13.02.2017.
 */
public interface HotelRepository extends CrudRepository<Hotel, Long> {

    @Query("select hotel from Hotel as hotel where  hotel.hotelName = :hotelName and hotel.city.cityName = :cityName ")
    Hotel findByHotelNameCityId(@Param("hotelName") String hotelName, @Param("cityName") String cityName);

    @Query("select c.hotelName from Hotel c")
    List<String> findAllHotelName();
}
