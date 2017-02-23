package com.travel.controller;

import com.travel.converterDTO.TourConverter;
import com.travel.dto.RequestDTO;
import com.travel.dto.SearchTourDTO;
import com.travel.dto.TourDTO;
import com.travel.model.*;
import com.travel.service.*;
import com.travel.validation.TourValidation;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import javax.websocket.server.PathParam;
import java.io.IOException;
import java.util.Arrays;
import java.util.Base64;

/**
 * Created by Tanya on 09.02.2017.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private CountryService countryService;

    @Autowired
    private CityService cityService;

    @Autowired
    private HotelService hotelService;

    @Autowired
    private LanguageService languageService;

    @Autowired
    private TourService tourService;

    @Autowired
    private TourValidation tourValidation;

    @Autowired
    private TourConverter tourConverter;

    @Autowired
    private RequestService requestService;

    @RequestMapping("/country")
    public ModelAndView getCountryPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("addcountry");
        modelAndView.addObject("country", new Country());
        return modelAndView;
    }

    @RequestMapping("/country/add")
    public ModelAndView addCountry(@ModelAttribute("country") @Valid Country country,
                                   BindingResult bindingResult, ModelAndView modelAndView) {
        if (bindingResult.hasErrors()) {
            modelAndView.setViewName("addcountry");
            modelAndView.addObject("edit", true);
            return modelAndView;
        }
        languageService.saveOrUpdate(country.getLanguageList());
        countryService.save(country);
        modelAndView.setViewName("admin");
        return modelAndView;
    }

    @RequestMapping("/tour")
    public ModelAndView getTourPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("tour");
        modelAndView.addObject("tour", new TourDTO());
        modelAndView.addObject("feedTypeList", Arrays.asList(FeedType.values()));
        modelAndView.addObject("transportList", Arrays.asList(Transport.values()));
        modelAndView.addObject("countryList", countryService.getAllCountries());
        return modelAndView;
    }

    @RequestMapping("/tour/add")
    public ModelAndView addTour(@RequestParam("file") MultipartFile file, @ModelAttribute("tour") TourDTO tour,
                                BindingResult bindingResult, ModelAndView modelAndView) throws IOException {
        byte[] encodeBase64 = Base64.getEncoder().encode(file.getBytes());
        String base64Encoded = new String(encodeBase64, "UTF-8");
        tour.setPhoto(base64Encoded);
        tourValidation.validate(tour, bindingResult);
        modelAndView.setViewName("tour");
        modelAndView.addObject("tour", tour);
        modelAndView.addObject("countryList", countryService.getAllCountries());
        if (bindingResult.hasErrors())
            return modelAndView;
        tourService.save(tourConverter.convertDtoToEntity(tour));
        modelAndView.setViewName("main");
        modelAndView.addObject("search", new SearchTourDTO());
        modelAndView.addObject("feedTypeList", Arrays.asList(FeedType.values()));
        modelAndView.addObject("countries", countryService.getAllNameCode());
        modelAndView.addObject("transportList", Arrays.asList(Transport.values()));
        return modelAndView;
    }

    @RequestMapping("/tour/edit/{id}")
    public ModelAndView ediitTourById(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("touredit");
        modelAndView.addObject("tour", tourService.getById(id));
        return modelAndView;
    }

    @RequestMapping("/tour/edit/save")
    public String ediitTourSave(@ModelAttribute("tour") Tour tour, BindingResult bindingResult) {
        tourValidation.validate(tour, bindingResult);
        if (bindingResult.hasErrors())
            return "tour";
        tourService.save(tour);
        return "redirect:/admin/";
    }

    @RequestMapping("/tour/delete/{id}")
    public String deleteTourById(@PathVariable("id") Long id) {
        tourService.deleteTourById(id);
        return "redirect:/";
    }

    @RequestMapping("/country/delete/{id}")
    public String deleteCountry(@PathVariable("id") Long id) {
        countryService.delete(id);
        return "redirect:/country";
    }

    @RequestMapping("/country/edit/{id}")
    public ModelAndView editCountryPage(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("addcountry");
        modelAndView.addObject("country", countryService.getCountryById(id));
        System.out.println("***size=" + countryService.getCountryById(id).getLanguageList().size());
        modelAndView.addObject("edit", true);
        return modelAndView;
    }

    @RequestMapping("/country/cities/save")
    public ModelAndView saveCitiesOfCountry(@ModelAttribute("country") Country country) {
        ModelAndView modelAndView = new ModelAndView("country");
        Country countryPersistent = countryService.getCountryById(country.getIdCountry());
        for (City city : country.getCityList()) {
            if (city.getIdCity() == null) {
                city.setCountry(countryPersistent);
                cityService.save(city);
            }

        }
        modelAndView.addObject("country", countryPersistent);
        return modelAndView;
    }

    @RequestMapping("/country/city/save")
    public ModelAndView saveHotelsOfCity(@ModelAttribute("city") City city) {
        ModelAndView modelAndView = new ModelAndView("city");
        City cityPersistent = cityService.getCityById(city.getIdCity());
        for (Hotel hotel : city.getHotelList()) {
            if (hotel.getIdHotel() == null) {
                hotel.setCity(cityPersistent);
                hotelService.save(hotel);
            }

        }
        modelAndView.addObject("city", cityPersistent);
        return modelAndView;
    }

    @RequestMapping("/country/city/delete/{id}")
    public ModelAndView deleteCityById(@PathVariable("id") Long id) {
        ModelAndView modelAndView = new ModelAndView("country");
        Country country = cityService.getCityById(id).getCountry();
        cityService.deleteCityById(id);
        modelAndView.addObject("country", country);
        return modelAndView;
    }

    @RequestMapping("/country/city/edit/{id}")
    public ModelAndView editCityName(@PathVariable("id") Long id, @PathParam("cityName") String cityName) {
        ModelAndView modelAndView = new ModelAndView("city");
        City city = cityService.getCityById(id);
        city.setCityName(cityName);
        cityService.save(city);
        modelAndView.addObject("city", city);
        return modelAndView;
    }

    @RequestMapping("/requests")
    public ModelAndView getRequestPage() {
        ModelAndView modelAndView = new ModelAndView("requests");
        RequestDTO requestDTO = new RequestDTO();
        requestDTO.setList(requestService.getAllRequests());
        modelAndView.addObject("request", requestDTO);
        return modelAndView;
    }

    @RequestMapping("/requests/change")
    public ModelAndView changeRequests(@ModelAttribute("request") RequestDTO requestDTO) {
        ModelAndView modelAndView = new ModelAndView("requests");
        requestService.saveChanges(requestDTO.getList());
        RequestDTO requestDTOResult = new RequestDTO();
        requestDTOResult.setList(requestService.getAllRequests());
        modelAndView.addObject("request", requestDTOResult);
        modelAndView.addObject("success", true);
        return modelAndView;
    }
}
