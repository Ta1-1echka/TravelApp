package com.travel.controller;

import com.travel.dto.SearchTourDTO;
import com.travel.model.*;
import com.travel.service.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;

import java.math.BigDecimal;
import java.math.RoundingMode;
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

    @Autowired
    private CommentService commentService;

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
        modelAndView.addObject("comment", new Comment());
        if (tour.getStarCount() != 0)
            modelAndView.addObject("rating", new BigDecimal((double) tour.getStarValue() / tour.getStarCount()).
                    setScale(3, RoundingMode.UP).doubleValue());
        modelAndView.addObject("request", new Request());
        modelAndView.addObject("countryCityHotel", countryCityHotel);
        return modelAndView;
    }

    @RequestMapping("tour_info/{id}/star")
    @ResponseBody
    public double addStarValue(@PathVariable("id") Long id, @RequestParam("value") int value) {
        Tour tour = tourService.getById(id);
        int starCount = tour.getStarCount(),
                starValue = tour.getStarValue();
        tour.setStarCount(++starCount);
        starValue += value;
        tour.setStarValue(starValue);
        tourService.save(tour);
        return new BigDecimal((double) starValue / starCount).setScale(3, RoundingMode.UP).doubleValue();
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

    @RequestMapping("/tour/{idTour}/comment")
    public String saveComment(@ModelAttribute("comment") Comment comment, @PathVariable("idTour") Long idTour) {

        comment.setTour(tourService.getById(idTour));
        commentService.save(comment);
        return "redirect:/tour_info/" + idTour;
    }
}
