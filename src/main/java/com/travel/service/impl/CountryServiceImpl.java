package com.travel.service.impl;

import com.travel.model.City;
import com.travel.model.Country;
import com.travel.repository.CountryRepository;
import com.travel.service.CountryService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import javax.persistence.PersistenceContext;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Tanya on 10.02.2017.
 */
@Service
@Transactional
public class CountryServiceImpl implements CountryService {

    @Autowired
    private CountryRepository countryRepository;

    @Override
    public void save(Country country) {
        countryRepository.save(country);
    }

    @Override
    public List<String> getAllNameCode() {
        return countryRepository.findAllNameCode();
    }

    @Override
    public List<Country> getAllCountries() {
        return countryRepository.findAllCountries();
    }

    @Override
    public Country getCountryById(Long id) {
        return countryRepository.findOne(id);
    }

    @Override
    public void delete(Long id) {
        countryRepository.delete(id);
    }

    @Override
    public List<Country> getPersistObject(List<Country> list) {
        List<Country> countryList = new ArrayList<>();
        for (Country country : list) {
            List<City> cityList = country.getCityList();
            country = countryRepository.findByNameCode(country.getNameCode());
            country.setCityList(cityList);
            countryList.add(country);
        }
        return countryList;
    }
}
