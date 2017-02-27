package com.travel.converterDTO;

import com.travel.dto.TourDTO;
import com.travel.model.City;
import com.travel.model.Country;
import com.travel.model.Hotel;
import com.travel.model.Tour;
import com.travel.service.HotelService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Tanya on 15.02.2017.
 */
@Component
public class TourConverter {
    @Autowired
    private HotelService hotelService;

    public Tour convertDtoToEntity(TourDTO tourDTO) {
        Tour tour = new Tour();
        tour.setAboutTour(tourDTO.getAboutTour());
        tour.setAdultPrice(tourDTO.getAdultPrice());
        tour.setChildPrice(tourDTO.getChildPrice());
        tour.setCountAllPlaces(tourDTO.getCountAllPlaces());
        tour.setCountFreePlaces(tourDTO.getCountAllPlaces());
        tour.setDateBack(tourDTO.getDateBack());
        tour.setDateOut(tourDTO.getDateOut());
        tour.setDateFrom(tourDTO.getDateFrom());
        tour.setDateTo(tourDTO.getDateTo());
        tour.setTourName(tourDTO.getTourName());
        tour.setTransport(tourDTO.getTransport());
        tour.setFeedType(tourDTO.getFeedType());
        tour.setPhoto(tourDTO.getPhoto());
        tour.setHotelList(hotelService.getPersistObject(tourDTO.getList()));
        tour.setStarCount(0);

        return tour;
    }

    public List<Hotel> convertListCountryToListHotel(List<Country> countryList) {
        List<Hotel> hotelList = new ArrayList<>();
        for (Country country : countryList) {
            for (City city : country.getCityList()) {
                city.setCountry(country);
                for (Hotel hotel : city.getHotelList()) {
                    hotel.setCity(city);
                    hotelList.add(hotel);
                }
            }

        }
        return hotelList;
    }


}
