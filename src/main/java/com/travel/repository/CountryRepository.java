package com.travel.repository;

import com.travel.model.Country;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Tanya on 10.02.2017.
 */
public interface CountryRepository extends CrudRepository<Country, Long> {
}
