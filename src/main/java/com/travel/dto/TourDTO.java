package com.travel.dto;

import com.travel.model.Country;
import com.travel.model.FeedType;
import com.travel.model.Transport;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * Created by Tanya on 15.02.2017.
 */
public class TourDTO {

    private String tourName;

    @DateTimeFormat(iso= DateTimeFormat.ISO.DATE)
    private Date dateFrom;

    @DateTimeFormat(iso= DateTimeFormat.ISO.DATE)
    private Date dateTo;

    @DateTimeFormat(iso= DateTimeFormat.ISO.DATE)
    private Date dateOut;

    @DateTimeFormat(iso= DateTimeFormat.ISO.DATE)
    private Date dateBack;

    private Integer countAllPlaces;

    private Double adultPrice;

    private Double childPrice;

    private String aboutTour;

    private String photo;

    private FeedType feedType;

    private Transport transport;

    private List<Country> list;

    public String getTourName() {
        return tourName;
    }

    public void setTourName(String tourName) {
        this.tourName = tourName;
    }

    public Date getDateFrom() {
        return dateFrom;
    }

    public void setDateFrom(Date dateFrom) {
        this.dateFrom = dateFrom;
    }

    public Date getDateTo() {
        return dateTo;
    }

    public void setDateTo(Date dateTo) {
        this.dateTo = dateTo;
    }

    public Date getDateOut() {
        return dateOut;
    }

    public void setDateOut(Date dateOut) {
        this.dateOut = dateOut;
    }

    public Date getDateBack() {
        return dateBack;
    }

    public void setDateBack(Date dateBack) {
        this.dateBack = dateBack;
    }

    public Integer getCountAllPlaces() {
        return countAllPlaces;
    }

    public void setCountAllPlaces(Integer countAllPlaces) {
        this.countAllPlaces = countAllPlaces;
    }

    public Double getAdultPrice() {
        return adultPrice;
    }

    public void setAdultPrice(Double adultPrice) {
        this.adultPrice = adultPrice;
    }

    public Double getChildPrice() {
        return childPrice;
    }

    public void setChildPrice(Double childPrice) {
        this.childPrice = childPrice;
    }

    public String getAboutTour() {
        return aboutTour;
    }

    public void setAboutTour(String aboutTour) {
        this.aboutTour = aboutTour;
    }

    public String getPhoto() {
        return photo;
    }

    public void setPhoto(String photo) {
        this.photo = photo;
    }

    public FeedType getFeedType() {
        return feedType;
    }

    public void setFeedType(FeedType feedType) {
        this.feedType = feedType;
    }

    public Transport getTransport() {
        return transport;
    }

    public void setTransport(Transport transport) {
        this.transport = transport;
    }

    public List<Country> getList() {
        return list;
    }

    public void setList(List<Country> list) {
        this.list = list;
    }
}
