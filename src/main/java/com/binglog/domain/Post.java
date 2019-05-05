package com.binglog.domain;


import lombok.Data;
import org.springframework.data.annotation.Id;
import org.springframework.data.mongodb.core.mapping.Document;
import org.springframework.data.mongodb.core.mapping.Field;

// import javax.persistence.GeneratedValue;
import java.util.Date;

@Data
@Document
public class Post {

    @Id
    // @GeneratedValue
    private String id;


    private String title;

    private String author;

    @Field("mdbody")
    private String mdBody;

    @Field("htmlbody")
    private String htmlBody;

    @Field("sample_text")
    private String sampleText;

    // table of content
    private String toc;

    @Field("create_time")
    private Date createTime;

    @Field("update_time")
    private Date updateTime;


}
