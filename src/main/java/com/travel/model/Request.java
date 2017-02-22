package com.travel.model;

import javax.persistence.*;

/**
 * Created by Tanya on 22.02.2017.
 */
@Entity
public class Request {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_request")
    private Long idRequest;

    @Column(name = "name_user")
    private String nameUser;

    @Column(name = "phone")
    private String phone;

    @Column(name = "email")
    private String email;

    @Column(name = "comment")
    private String comment;

    @ManyToOne(fetch = FetchType.LAZY)
    @JoinColumn(name = "id_tour")
    private Tour tour;

    @Column(name = "status")
    @Enumerated(EnumType.STRING)
    private RequestStatus requestStatus;

    public RequestStatus getRequestStatus() {
        return requestStatus;
    }

    public void setRequestStatus(RequestStatus requestStatus) {
        this.requestStatus = requestStatus;
    }

    public Long getIdRequest() {
        return idRequest;
    }

    public void setIdRequest(Long idRequest) {
        this.idRequest = idRequest;
    }

    public String getNameUser() {
        return nameUser;
    }

    public void setNameUser(String nameUser) {
        this.nameUser = nameUser;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getComment() {
        return comment;
    }

    public void setComment(String comment) {
        this.comment = comment;
    }

    public Tour getTour() {
        return tour;
    }

    public void setTour(Tour tour) {
        this.tour = tour;
    }
}
