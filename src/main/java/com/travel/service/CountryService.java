package com.travel.service;

import com.travel.model.Country;

import java.util.List;

/**
 * Created by Tanya on 10.02.2017.
 */
public interface CountryService {

    void save(Country country);

    List<String> getAllNameCode();

    List<Country> getAllCountries();

    Country getCountryById(Long id);

    void delete(Long id);

}
