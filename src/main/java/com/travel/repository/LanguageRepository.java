package com.travel.repository;

import com.travel.model.Language;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Tanya on 10.02.2017.
 */
public interface LanguageRepository extends CrudRepository<Language, Long> {

    Language findByLanguageName(String languageName);
}
