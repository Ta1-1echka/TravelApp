package com.travel.repository;

import com.travel.model.Tour;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Tanya on 10.02.2017.
 */
public interface TourRepository extends CrudRepository<Tour, Long> {
}
