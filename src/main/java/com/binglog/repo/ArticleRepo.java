package com.binglog.repo;

import com.binglog.domain.Article;
import org.springframework.data.mongodb.repository.MongoRepository;
import org.springframework.stereotype.Repository;

import java.util.List;

@Repository
public interface ArticleRepo extends MongoRepository<Article, String> {

    List<Article> findByAuthor(final String author);
}
