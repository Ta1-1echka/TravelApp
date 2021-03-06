package com.travel.service.impl;

import com.travel.model.City;
import com.travel.model.Country;
import com.travel.model.Hotel;
import com.travel.repository.HotelRepository;
import com.travel.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

import static java.util.stream.Collectors.toList;

/**
 * Created by Tanya on 13.02.2017.
 */
@Service
@Transactional
public class HotelServiceImpl implements HotelService {

    @Autowired
    private HotelRepository hotelRepository;

    @Override
    public void save(Hotel hotel) {
        hotelRepository.save(hotel);
    }

    @Override
    public List<String> getAllHotelName() {
        return hotelRepository.findAllHotelName();
    }

    @Override
    public List<Hotel> getPersistObject(List<Country> list) {
        return list.stream().map(Country::getCityList).flatMap(List::stream).map(City::getHotelList).flatMap(List::stream).
                map(hotel -> hotelRepository.findOne(hotel.getIdHotel()))
                .collect(toList());

    }
}
