package com.travel.service.impl;

import com.travel.model.Tour;
import com.travel.repository.TourRepository;
import com.travel.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;

import java.util.List;

/**
 * Created by Tanya on 10.02.2017.
 */
public class TourServiceImpl implements TourService {
    @Autowired
    private TourRepository tourRepository;

    @Override
    public void save(Tour tour) {
        tourRepository.save(tour);
    }

    @Override
    public List<Tour> getAll() {
        return (List<Tour>) tourRepository.findAll();
    }
}
