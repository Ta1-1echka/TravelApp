package com.travel.repository;

import com.travel.model.Country;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Tanya on 10.02.2017.
 */
public interface CountryRepository extends CrudRepository<Country, Long> {

    Country findByNameCode(String nameCode);

    @Query("select distinct c.nameCode from Country c")
    List<String> findAllNameCode();

    @Query("select c from Country c")
    List<Country> findAllCountries();
}
