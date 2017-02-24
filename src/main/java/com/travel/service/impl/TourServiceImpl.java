package com.travel.service.impl;

import com.travel.dto.SearchTourDTO;
import com.travel.model.Tour;
import com.travel.repository.TourRepository;
import com.travel.service.TourService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import javax.persistence.EntityManager;
import java.util.List;

/**
 * Created by Tanya on 10.02.2017.
 */
@Service
@Transactional
public class TourServiceImpl implements TourService {

    @Autowired
    private TourRepository tourRepository;

    @Autowired
    private EntityManager entityManager;

    @Override
    public void save(Tour tour) {
        tourRepository.save(tour);
    }

    @Override
    public Iterable<Tour> getAll() {
        return tourRepository.findAll();
    }

    @Override
    public Tour getById(Long id) {
        return tourRepository.findOne(id);
    }

    @Override
    public List<Tour> getToursByFilter(SearchTourDTO searchTourDTO) {

        return tourRepository.getToursByFilter(searchTourDTO.getCountryNameList(), searchTourDTO.getDateFrom(),
                searchTourDTO.getDateTo(), searchTourDTO.getTransport(), searchTourDTO.getFeedType(),
                searchTourDTO.getPriceFrom(), searchTourDTO.getPriceTo());
    }

    @Override
    public List<Tour> getToursBySearch(String name) {

        return tourRepository.getToursBySearch(name);
    }

    @Override
    public void deleteTourById(Long id) {
        tourRepository.delete(id);
    }
}
