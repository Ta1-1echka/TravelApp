package com.travel.repository;

import com.travel.model.Comment;
import org.springframework.data.repository.CrudRepository;

/**
 * Created by Tanya on 23.02.2017.
 */
public interface CommentRepository extends CrudRepository<Comment, Long> {
}
