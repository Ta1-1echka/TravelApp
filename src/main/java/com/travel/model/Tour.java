package com.travel.model;

import javax.persistence.*;
import java.util.Date;

/**
 * Created by Tanya on 10.02.2017.
 */
@Entity
public class Tour {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_tour")
    private Long idTour;

    @Column(name = "name")
    private String tourName;

    @Column(name = "date_from")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateFrom;

    @Column(name = "date_to")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateTo;

    @Column(name = "date_out")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateOut;

    @Column(name = "date_back")
    @Temporal(TemporalType.TIMESTAMP)
    private Date dateBack;

    @Column(name = "count_all_places")
    private int countAllPlaces;

    @Column(name = "count_free_places")
    private int countFreePlaces;

    @Column(name = "price_adult")
    private double adultPrice;

    @Column(name = "price_child")
    private double childPrice;

    @Column(name = "about")
    private String aboutTour;

    @Column(name = "photo")
    private String photoURL;

    @Enumerated
    @Column(name = "feed_type")
    private FeedType feedType;

    @Enumerated
    @Column(name = "transport")
    private Transport transport;

    public Long getIdTour() {
        return idTour;
    }

    public void setIdTour(Long idTour) {
        this.idTour = idTour;
    }

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

    public int getCountAllPlaces() {
        return countAllPlaces;
    }

    public void setCountAllPlaces(int countAllPlaces) {
        this.countAllPlaces = countAllPlaces;
    }

    public int getCountFreePlaces() {
        return countFreePlaces;
    }

    public void setCountFreePlaces(int countFreePlaces) {
        this.countFreePlaces = countFreePlaces;
    }

    public double getAdultPrice() {
        return adultPrice;
    }

    public void setAdultPrice(double adultPrice) {
        this.adultPrice = adultPrice;
    }

    public double getChildPrice() {
        return childPrice;
    }

    public void setChildPrice(double childPrice) {
        this.childPrice = childPrice;
    }

    public String getAboutTour() {
        return aboutTour;
    }

    public void setAboutTour(String aboutTour) {
        this.aboutTour = aboutTour;
    }

    public String getPhotoURL() {
        return photoURL;
    }

    public void setPhotoURL(String photoURL) {
        this.photoURL = photoURL;
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
}
