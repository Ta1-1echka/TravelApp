package com.travel.controller;

import com.travel.dto.SearchTourDTO;
import com.travel.model.*;
import com.travel.service.CityService;
import com.travel.service.CountryService;
import com.travel.service.RequestService;
import com.travel.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Iterator;
import java.util.List;

/**
 * Created by Tanya on 08.02.2017.
 */
@Controller
@RequestMapping("/")
public class MainController {

    @Autowired
    private TourService tourService;

    @Autowired
    private CountryService countryService;

    @Autowired
    private CityService cityService;

    @Autowired
    private RequestService requestService;

    @RequestMapping
    public ModelAndView getIndexPage() {
        ModelAndView modelAndView = new ModelAndView("main");
        Iterable<Tour> i = tourService.getAll();
        List<Tour> result = new ArrayList();
        Iterator<Tour> iterator = i.iterator();
        while (iterator.hasNext()) {
            result.add(iterator.next());
        }
        modelAndView.addObject("tours", result);
        modelAndView.addObject("search", new SearchTourDTO());
        modelAndView.addObject("feedTypeList", Arrays.asList(FeedType.values()));
        modelAndView.addObject("countries", countryService.getAllNameCode());
        modelAndView.addObject("transportList", Arrays.asList(Transport.values()));
        return modelAndView;
    }

    @RequestMapping("login")
    public String getLoginPage() {
        return "login";
    }

    @RequestMapping("tour_info/{id}")
    public ModelAndView getTourInfo(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("tourinfo");
        Tour tour = tourService.getById(id);
        String countryCityHotel = "";
        List<Hotel> hotelList = tour.getHotelList();
        for (Hotel hotel : hotelList) {
            countryCityHotel += (hotel.getCity().getCountry().getNameCode() + " - " + hotel.getCity().getCityName() + " - "
                    + hotel.getHotelName() + "; ");
        }


        modelAndView.addObject("tour", tour);
        modelAndView.addObject("request", new Request());
        modelAndView.addObject("countryCityHotel", countryCityHotel);
        return modelAndView;
    }

    @RequestMapping("country")
    public ModelAndView getCountryPage() {
        ModelAndView modelAndView = new ModelAndView("countries");
        modelAndView.addObject("countries", countryService.getAllCountries());
        return modelAndView;
    }

    @RequestMapping("country/{id}")
    public ModelAndView getCountryInfoPage(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("country");
        modelAndView.addObject("country", countryService.getCountryById(id));
        return modelAndView;
    }

    @RequestMapping("country/city/{id}")
    public ModelAndView getCityInfoPage(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("city");
        modelAndView.addObject("city", cityService.getCityById(id));
        return modelAndView;
    }


    @RequestMapping("/tour/request/{id}")
    public ModelAndView setRequest(@PathVariable("id") Long id, @ModelAttribute("request") Request request) {
        ModelAndView modelAndView = new ModelAndView("tourinfo");
        Tour tour = tourService.getById(id);
        modelAndView.addObject("tour", tour);
        request.setTour(tour);
        requestService.save(request);
        modelAndView.addObject("success", true);
        return modelAndView;
    }

    @RequestMapping("filter")
    public ModelAndView getToursByFilter(@ModelAttribute("search") SearchTourDTO searchTourDTO) {
        ModelAndView modelAndView = new ModelAndView("main");
        List<Tour> tours = tourService.getToursByFilter(searchTourDTO);
        if (tours.size() == 0)
            modelAndView.addObject("tourEmpty", "По данному запросу ничего не найдено");
        else
            modelAndView.addObject("tours", tours);
        modelAndView.addObject("search", new SearchTourDTO());
        modelAndView.addObject("feedTypeList", Arrays.asList(FeedType.values()));
        modelAndView.addObject("countries", countryService.getAllNameCode());
        modelAndView.addObject("transportList", Arrays.asList(Transport.values()));
        return modelAndView;
    }

    @RequestMapping("search")
    public ModelAndView getToursBySearch(@RequestParam("search") String name) {
        ModelAndView modelAndView = new ModelAndView("main");
        List<Tour> tours = tourService.getToursBySearch(name);
        if (tours.size() == 0)
            modelAndView.addObject("tourEmpty", "По данному запросу ничего не найдено");
        else
            modelAndView.addObject("tours", tours);
        modelAndView.addObject("search", new SearchTourDTO());
        modelAndView.addObject("feedTypeList", Arrays.asList(FeedType.values()));
        modelAndView.addObject("countries", countryService.getAllNameCode());
        modelAndView.addObject("transportList", Arrays.asList(Transport.values()));
        return modelAndView;
    }
}
