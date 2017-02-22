package com.travel.model;

import javax.persistence.*;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Tanya on 13.02.2017.
 */
@Entity
public class City {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_city")
    private Long idCity;

    @Column(name = "name")
    private String cityName;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "id_country")
    private Country country;

    @OneToMany(mappedBy = "city", cascade = CascadeType.ALL)
    private List<Hotel> hotelList = new ArrayList<Hotel>();

    public Long getIdCity() {
        return idCity;
    }

    public void setIdCity(Long idCity) {
        this.idCity = idCity;
    }

    public String getCityName() {
        return cityName;
    }

    public void setCityName(String cityName) {
        this.cityName = cityName;
    }

    public Country getCountry() {
        return country;
    }

    public void setCountry(Country country) {
        this.country = country;
    }

    public List<Hotel> getHotelList() {
        return hotelList;
    }

    public void setHotelList(List<Hotel> hotelList) {
        this.hotelList = hotelList;
    }


}
