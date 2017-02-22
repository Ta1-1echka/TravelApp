package com.travel.service;

import com.travel.dto.SearchTourDTO;
import com.travel.model.Tour;
import org.springframework.web.multipart.MultipartFile;

import java.util.List;

/**
 * Created by Tanya on 10.02.2017.
 */
public interface TourService {

    void save(Tour tour);

    Iterable<Tour> getAll();

    Tour getById(Long id);

    List<Tour> getToursByFilter(SearchTourDTO searchTourDTO);

    List<Tour> getToursBySearch(String name);

    void deleteTourById(Long id);
}
