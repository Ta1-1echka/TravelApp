package com.travel.service.impl;

import com.travel.model.Request;
import com.travel.repository.RequestRepository;
import com.travel.service.RequestService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

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
        Iterable<Request> iterable = requestRepository.findAll();
        List<Request> list = new ArrayList<>();
        if (iterable != null) {
            for (Request e : iterable) {
                list.add(e);
            }
        }
        return list;
    }

    @Override
    public void saveChanges(List<Request> list) {
        Request requestSave;
        for (Request request : list) {
            requestSave = requestRepository.findOne(request.getIdRequest());
            requestSave.setRequestStatus(request.getRequestStatus());
            save(requestSave);
        }

    }
}
