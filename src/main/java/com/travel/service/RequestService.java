package com.travel.service;

import com.travel.model.Request;

import java.util.List;

/**
 * Created by Tanya on 22.02.2017.
 */
public interface RequestService {

    void save(Request request);

    List<Request> getAllRequests();

    void saveChanges(List<Request> list);
}
