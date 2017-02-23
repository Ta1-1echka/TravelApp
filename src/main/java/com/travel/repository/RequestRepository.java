package com.travel.repository;

import com.travel.model.Request;
import org.springframework.data.repository.CrudRepository;

import java.util.List;

/**
 * Created by Tanya on 22.02.2017.
 */
public interface RequestRepository extends CrudRepository<Request, Long> {

}
