package com.travel.model;

import org.hibernate.validator.constraints.NotEmpty;

import javax.persistence.*;
import javax.validation.constraints.Size;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

/**
 * Created by Tanya on 10.02.2017.
 */
@Entity
public class Country implements Serializable {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_country")
    private Long idCountry;

    @Column(name = "name_сode")
    @NotEmpty(message = "Заполните поле")
    @Size(max = 3, message = "Максимальный размер = 3, пример RUS")
    private String nameCode;

    @Column(name = "about")
    private String about;

    @Column(name = "capital")
    @NotEmpty(message = "Заполните поле")
    private String capital;

    @Column(name = "climate")
    private String climate;

    @Column(name = "currency")
    @NotEmpty(message = "Заполните поле")
    @Size(max = 3, message = "Максимальный размер = 3, пример RUB")
    private String currency;

    @ManyToMany()
    @JoinTable(
            name = "country_has_language",
            joinColumns = @JoinColumn(name = "id_country"),
            inverseJoinColumns = @JoinColumn(name = "id_language")
    )
    private List<Language> languageList;

    @OneToMany(mappedBy = "country")
    private List<City> cityList = new ArrayList<City>();

    @Override
    public String toString() {
        return "Country{" +
                "idCountry=" + idCountry +
                ", nameCode='" + nameCode + '\'' +
                ", about='" + about + '\'' +
                ", capital='" + capital + '\'' +
                ", climate='" + climate + '\'' +
                ", currency='" + currency + '\'' +
                '}';
    }

    public List<City> getCityList() {
        return cityList;
    }

    public void setCityList(List<City> cityList) {
        this.cityList = cityList;
    }

    public Long getIdCountry() {
        return idCountry;
    }

    public void setIdCountry(Long idCountry) {
        this.idCountry = idCountry;
    }

    public String getNameCode() {
        return nameCode;
    }

    public void setNameCode(String nameCode) {
        this.nameCode = nameCode;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getCapital() {
        return capital;
    }

    public void setCapital(String capital) {
        this.capital = capital;
    }

    public String getClimate() {
        return climate;
    }

    public void setClimate(String climate) {
        this.climate = climate;
    }

    public String getCurrency() {
        return currency;
    }

    public void setCurrency(String currency) {
        this.currency = currency;
    }

    public List<Language> getLanguageList() {
        return languageList;
    }

    public void setLanguageList(List<Language> languageList) {
        this.languageList = languageList;
    }
}
