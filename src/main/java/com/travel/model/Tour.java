package com.travel.model;

import org.hibernate.validator.constraints.NotEmpty;
import org.springframework.format.annotation.DateTimeFormat;

import javax.persistence.*;
import javax.validation.constraints.NotNull;
import java.io.Serializable;
import java.sql.Blob;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

/**
 * Created by Tanya on 10.02.2017.
 */
@Entity
public class Tour implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_tour")
    private Long idTour;

    @Column(name = "name")
    private String tourName;

    @Column(name = "date_from")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date dateFrom;

    @Column(name = "date_to")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    private Date dateTo;

    @Column(name = "date_out")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    @NotNull
    private Date dateOut;

    @Column(name = "date_back")
    @DateTimeFormat(iso = DateTimeFormat.ISO.DATE)
    @NotNull
    private Date dateBack;

    @Column(name = "count_all_places")
    private Integer countAllPlaces;

    @Column(name = "count_free_places")
    private Integer countFreePlaces;

    @Column(name = "price_adult")
    private Double adultPrice;

    @Column(name = "price_child")
    private Double childPrice;

    @Column(name = "about")
    private String aboutTour;

    @Column(name = "photo")
    private String photo;

    @Column(name = "feed_type")
    @Enumerated(EnumType.STRING)
    private FeedType feedType;

    @Column(name = "transport")
    @Enumerated(EnumType.STRING)
    private Transport transport;

    @ManyToMany
    @JoinTable(
            name = "tour_has_hotel",
            joinColumns = @JoinColumn(name = "id_tour"),
            inverseJoinColumns = @JoinColumn(name = "id_hotel"))
    private List<Hotel> hotelList;

    @OneToMany(mappedBy = "tour", cascade = CascadeType.ALL)
    private List<Request> requestList = new ArrayList<Request>();

    public List<Request> getRequestList() {
        return requestList;
    }

    public void setRequestList(List<Request> requestList) {
        this.requestList = requestList;
    }

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

    public Integer getCountAllPlaces() {
        return countAllPlaces;
    }

    public void setCountAllPlaces(Integer countAllPlaces) {
        this.countAllPlaces = countAllPlaces;
    }

    public Integer getCountFreePlaces() {
        return countFreePlaces;
    }

    public void setCountFreePlaces(Integer countFreePlaces) {
        this.countFreePlaces = countFreePlaces;
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

    public List<Hotel> getHotelList() {
        return hotelList;
    }

    public void setHotelList(List<Hotel> hotelList) {
        this.hotelList = hotelList;
    }
}
