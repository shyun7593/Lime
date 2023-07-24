package com.lime.limetest.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class ArtworkDto {
    private Integer a_num;
    private String a_title;
    private String a_category;
    private String a_genre;
    private String a_group;
    private String a_publisher;
    private String a_agency;
    private String a_release;
    private int a_price;
    private String a_contents;
    private Timestamp a_date;
    private String a_id;
    private String mnick;
    private String af_imgsysname;
    private String af_imgoriname;
    private String a_del; // 삭제 여부 확인
    private String a_cnt; // 구매횟수
}
