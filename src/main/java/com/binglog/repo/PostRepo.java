package com.binglog.repo;

import com.binglog.domain.Post;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface PostRepo extends MongoRepository<Post, String> {

    List<Post> findByAuthor(final String author);
}
