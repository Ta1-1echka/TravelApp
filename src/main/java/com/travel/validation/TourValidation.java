package com.travel.validation;

import com.travel.dto.TourDTO;
import org.springframework.stereotype.Component;
import org.springframework.validation.Errors;
import org.springframework.validation.Validator;


/**
 * Created by Tanya on 15.02.2017.
 */
@Component
public class TourValidation implements Validator {
    @Override
    public boolean supports(Class<?> aClass) {
        return TourDTO.class.equals(aClass);
    }

    @Override
    public void validate(Object o, Errors errors) {
        TourDTO tour = (TourDTO) o;
        if (tour.getDateFrom() != null & tour.getDateTo() != null)
            if (tour.getDateFrom().after(tour.getDateTo())) {
                errors.rejectValue("dateFrom", "IncorrectValue");
                errors.rejectValue("dateTo", "IncorrectValue");
            }
        if (tour.getDateOut() != null & tour.getDateBack() != null)
            if (tour.getDateOut().after(tour.getDateBack())) {
                errors.rejectValue("dateOut", "IncorrectValue");
                errors.rejectValue("dateBack", "IncorrectValue");
            }
        if (tour.getDateFrom() != null & tour.getDateOut() != null)
            if (tour.getDateOut().after(tour.getDateFrom())) {
                errors.rejectValue("dateFrom", "IncorrectValue");
                errors.rejectValue("dateOut", "IncorrectValue");
            }
        if (tour.getDateTo() != null & tour.getDateBack() != null)
            if (tour.getDateTo().after(tour.getDateBack())) {
                errors.rejectValue("dateTo", "IncorrectValue");
                errors.rejectValue("dateBack", "IncorrectValue");
            }
        if (tour.getCountAllPlaces() != null)
            if (!(tour.getCountAllPlaces() instanceof Integer) || tour.getCountAllPlaces() < 1) {
                errors.rejectValue("countAllPlaces", "IncorrectValue");
            }
        if (tour.getAdultPrice() != null)
            if (!(tour.getAdultPrice() instanceof Double) || tour.getAdultPrice() < 0) {
                errors.rejectValue("countAllPlaces", "IncorrectValue");
            }
        if (tour.getChildPrice() != null)
            if (!(tour.getChildPrice() instanceof Double) || tour.getChildPrice() < 0) {
                errors.rejectValue("countAllPlaces", "IncorrectValue");
            }

    }
}
