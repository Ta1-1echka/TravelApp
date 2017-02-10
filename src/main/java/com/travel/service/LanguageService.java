package com.travel.service;

import com.travel.model.Language;

import java.util.List;

/**
 * Created by Tanya on 10.02.2017.
 */
public interface LanguageService {
    List<Language> saveOrUpdate(List<Language> languageList);
}
