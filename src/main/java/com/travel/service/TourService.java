package com.travel.service;

import com.travel.model.Tour;

import java.util.List;

/**
 * Created by Tanya on 10.02.2017.
 */
public interface TourService {

    void save(Tour tour);

    List<Tour> getAll();

}
