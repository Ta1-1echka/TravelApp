package com.travel.repository;

import com.travel.model.FeedType;
import com.travel.model.Tour;
import com.travel.model.Transport;
import org.springframework.data.jpa.repository.Query;
import org.springframework.data.repository.CrudRepository;
import org.springframework.data.repository.query.Param;

import java.util.Date;
import java.util.List;

/**
 * Created by Tanya on 10.02.2017.
 */
public interface TourRepository extends CrudRepository<Tour, Long> {

    @Query("select distinct tour from Tour as tour join tour.hotelList as hotel where (:countries is null or " +
            "hotel.city.country.nameCode in (:countries)) and (:dateFrom is null or tour.dateFrom = :dateFrom) and " +
            "(:dateTo is null or tour.dateTo = :dateTo) and (:transport is null or tour.transport = :transport) and " +
            "(:feedType is null or tour.feedType = :feedType) and (:priceBefore is null or tour.adultPrice >= :priceBefore) " +
            " and (:priceTo is null or tour.adultPrice <= :priceTo)" +
            "order by hotel.city.country.nameCode")
    List<Tour> getToursByFilter(@Param(value = "countries") List<String> countries, @Param(value = "dateFrom") Date dateFrom,
                                @Param(value = "dateTo") Date dateTo, @Param(value = "transport") Transport transport,
                                @Param(value = "feedType") FeedType feedType, @Param(value = "priceBefore") Double priceBefore,
                                @Param(value = "priceTo") Double priceTo);

    @Query("select distinct tour from Tour as tour where tour.tourName like CONCAT(:name, '%') " +
            "order by tour.tourName")
    List<Tour> getToursBySearch(@Param(value = "name") String name);

}

