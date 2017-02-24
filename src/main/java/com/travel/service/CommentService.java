package com.travel.service;

import com.travel.model.Comment;

import java.util.List;

/**
 * Created by Tanya on 23.02.2017.
 */
public interface CommentService {

    void save(Comment comment);

    List<Comment> getAllComments();

}
