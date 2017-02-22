package com.travel.service.impl;

import com.travel.model.Language;
import com.travel.repository.LanguageRepository;
import com.travel.service.LanguageService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import javax.transaction.Transactional;
import java.util.List;

/**
 * Created by Tanya on 10.02.2017.
 */
@Service
@Transactional
public class LanguageServiceImpl implements LanguageService {

    @Autowired
    private LanguageRepository languageRepository;

    @Override
    public List<Language> saveOrUpdate(List<Language> languageList) {
        Language findLanguage;
        for (Language language : languageList) {
            findLanguage = languageRepository.findByLanguageName(language.getLanguageName());
            if (findLanguage == null) {
                languageRepository.save(language);
            } else {
                language.setIdLanguage(findLanguage.getIdLanguage());
            }

        }
        return languageList;
    }
}
