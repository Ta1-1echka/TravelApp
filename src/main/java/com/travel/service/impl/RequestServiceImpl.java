package com.travel.service.impl;

import com.travel.model.Request;
import com.travel.repository.RequestRepository;
import com.travel.service.RequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.List;
import java.util.stream.StreamSupport;

import static java.util.stream.Collectors.toList;

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

    @Override
    public List<Request> getAllRequests() {
        return StreamSupport.stream(requestRepository.findAll().spliterator(), false).collect(toList());
    }

    @Override
    public void saveChanges(List<Request> list) {
        list.stream().forEach(request -> {
            Request requestSave = requestRepository.findOne(request.getIdRequest());
            requestSave.setRequestStatus(request.getRequestStatus());
            save(requestSave);
        });
    }
}
