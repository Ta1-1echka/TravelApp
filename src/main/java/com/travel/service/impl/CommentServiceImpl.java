package com.travel.service.impl;

import com.travel.model.Comment;
import com.travel.repository.CommentRepository;
import com.travel.service.CommentService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import java.util.ArrayList;
import java.util.List;

/**
 * Created by Tanya on 23.02.2017.
 */
@Service
public class CommentServiceImpl implements CommentService{

    @Autowired
    private CommentRepository commentRepository;

    @Override
    public void save(Comment comment) {
        commentRepository.save(comment);
    }

    @Override
    public List<Comment> getAllComments() {
        Iterable<Comment> iterable = commentRepository.findAll();
        List<Comment> list = new ArrayList<>();
        if (iterable != null) {
            for (Comment e : iterable) {
                list.add(e);
            }
        }
        return list;
    }
}
