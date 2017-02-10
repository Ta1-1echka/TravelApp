package com.travel.controller;

import com.travel.model.Country;
import com.travel.model.Language;
import com.travel.model.Tour;
import com.travel.service.CountryService;
import com.travel.service.LanguageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Tanya on 09.02.2017.
 */
@Controller
@RequestMapping("/admin")
public class AdminController {

    @Autowired
    private CountryService countryService;

    @Autowired
    private LanguageService languageService;

    @RequestMapping
    public String getAdminPage() {
        return "admin";
    }

    @RequestMapping("/country")
    public ModelAndView getCountryPage() {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("country");
        Country country = new Country();
        List<Language> languages = new ArrayList<Language>();
        for (int i = 0; i < 5; i++)
            languages.add(new Language());
        country.setLanguageList(languages);
        modelAndView.addObject("country", country);
        return modelAndView;
    }

    @RequestMapping("/country/add")
    public String addCountry(@ModelAttribute("country") @Valid Country country, BindingResult bindingResult) {
        if (bindingResult.hasErrors()) {
            System.out.println("error");
            return "country";
        }
        languageService.saveOrUpdate(country.getLanguageList());
        countryService.save(country);
        return "redirect:/admin";
    }

    @RequestMapping("/tour")
    public ModelAndView getTourPage()
    {
        ModelAndView modelAndView = new ModelAndView();
        modelAndView.setViewName("tour");
        modelAndView.addObject("tour", new Tour());
        return modelAndView;
    }
}
