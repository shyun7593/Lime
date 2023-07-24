package com.lime.limetest.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class BoardDto {
    private int b_num;
    private String b_id;
    private String b_title;
    private String b_contents;
    private Timestamp b_date;
    private String b_type;
    private String mnick;
}
