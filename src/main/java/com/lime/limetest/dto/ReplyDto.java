package com.lime.limetest.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class ReplyDto {
    private int r_num;
    private int r_bnum; // 게시판 글 번호
    private String r_id; // 댓글 작성자 아이디
    private String r_contents; // 댓글 내용
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private Timestamp r_date;
    private String mnick;
}
