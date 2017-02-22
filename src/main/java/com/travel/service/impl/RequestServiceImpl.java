package com.travel.service.impl;

import com.travel.model.Request;
import com.travel.repository.RequestRepository;
import com.travel.service.RequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

/**
 * Created by Tanya on 22.02.2017.
 */
@Service
public class RequestServiceImpl implements RequestService {

    @Autowired
    private RequestRepository requestRepository;

    @Override
    public void save(Request request) {
        requestRepository.save(request);
    }
}
