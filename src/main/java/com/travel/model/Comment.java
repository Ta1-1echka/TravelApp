package com.travel.model;

import javax.persistence.*;

@Entity
public class Comment {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_comment")
    private Long idComment;

    @Column(name = "user_name")
    private String userName;

    @Column(name = "email")
    private String userEmail;

    @Column(name = "text")
    private String text;

    @ManyToOne(fetch=FetchType.LAZY)
    @JoinColumn(name = "id_tour")
    private Tour tour;

    public Long getIdComment() {
        return idComment;
    }

    public void setIdComment(Long idComment) {
        this.idComment = idComment;
    }

    public String getUserName() {
        return userName;
    }

    public void setUserName(String userName) {
        this.userName = userName;
    }

    public String getText() {
        return text;
    }

    public void setText(String text) {
        this.text = text;
    }

    public Tour getTour() {
        return tour;
    }

    public void setTour(Tour tour) {
        this.tour = tour;
    }

    public String getUserEmail() {
        return userEmail;
    }

    public void setUserEmail(String userEmail) {
        this.userEmail = userEmail;
    }
}
