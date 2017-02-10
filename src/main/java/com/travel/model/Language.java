package com.travel.model;

import javax.persistence.*;

/**
 * Created by Tanya on 10.02.2017.
 */
@Entity
public class Language {

    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_language")
    private Long idLanguage;

    @Column(name = "name")
    private String languageName;

    public Long getIdLanguage() {
        return idLanguage;
    }

    public void setIdLanguage(Long idLanguage) {
        this.idLanguage = idLanguage;
    }

    public String getLanguageName() {
        return languageName;
    }

    public void setLanguageName(String languageName) {
        this.languageName = languageName;
    }
}
