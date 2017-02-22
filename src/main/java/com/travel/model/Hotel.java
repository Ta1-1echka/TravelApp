package com.travel.model;

import javax.persistence.*;
import java.io.Serializable;
import java.util.List;

/**
 * Created by Tanya on 13.02.2017.
 */
@Entity
public class Hotel implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_hotel")
    private Long idHotel;

    @Column(name = "name")
    private String hotelName;

    @Column(name = "star_all_value")
    private int starAllValue;

    @Column(name = "star_count")
    private int starCount;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "id_city")
    private City city;

    @ManyToMany()
    @JoinTable(
            name = "tour_has_hotel",
            joinColumns = @JoinColumn(name = "id_hotel"),
            inverseJoinColumns = @JoinColumn(name = "id_tour"))
    private List<Tour> tourList;

    public List<Tour> getTourList() {
        return tourList;
    }

    public void setTourList(List<Tour> tourList) {
        this.tourList = tourList;
    }

    public Long getIdHotel() {
        return idHotel;
    }

    public void setIdHotel(Long idHotel) {
        this.idHotel = idHotel;
    }

    public String getHotelName() {
        return hotelName;
    }

    public void setHotelName(String hotelName) {
        this.hotelName = hotelName;
    }

    public int getStarAllValue() {
        return starAllValue;
    }

    public void setStarAllValue(int starAllValue) {
        this.starAllValue = starAllValue;
    }

    public int getStarCount() {
        return starCount;
    }

    public void setStarCount(int starCount) {
        this.starCount = starCount;
    }

    public City getCity() {
        return city;
    }

    public void setCity(City city) {
        this.city = city;
    }

}
