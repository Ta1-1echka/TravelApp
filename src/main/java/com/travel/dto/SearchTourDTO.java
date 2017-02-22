package com.travel.dto;

import com.travel.model.Country;
import com.travel.model.FeedType;
import com.travel.model.Transport;
import org.springframework.format.annotation.DateTimeFormat;

import java.util.Date;
import java.util.List;

/**
 * Created by Tanya on 21.02.2017.
 */
public class SearchTourDTO {

    @DateTimeFormat(iso= DateTimeFormat.ISO.DATE)
    private Date dateFrom;

    @DateTimeFormat(iso= DateTimeFormat.ISO.DATE)
    private Date dateTo;

    private Double priceFrom;

    private Double priceTo;

    private FeedType feedType;

    private Transport transport;

    private List<String> countryNameList;

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

    public Double getPriceFrom() {
        return priceFrom;
    }

    public void setPriceFrom(Double priceFrom) {
        this.priceFrom = priceFrom;
    }

    public Double getPriceTo() {
        return priceTo;
    }

    public void setPriceTo(Double priceTo) {
        this.priceTo = priceTo;
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

    public List<String> getCountryNameList() {
        return countryNameList;
    }

    public void setCountryNameList(List<String> countryNameList) {
        this.countryNameList = countryNameList;
    }
}
