package com.travel.service;

import com.travel.model.City;
import com.travel.model.Country;
import com.travel.model.Hotel;

import java.util.List;

/**
 * Created by Tanya on 13.02.2017.
 */
public interface HotelService {
    void save(Hotel hotel);

    List<String> getAllHotelName();

    List<Hotel> getPersistObject(List<Country> countryList);
}
