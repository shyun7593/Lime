package com.lime.limetest.dto;

import lombok.Data;

import java.sql.Timestamp;

@Data
public class PaymentDto {
    private int p_num;
    private int p_anum; // 구매한 작품글 번호
    private String p_bid; // 구매자 아이디
    private String p_pid; // 판매자 아이디
    private int p_price; // 가격
    private String a_title; // 판매 글 제목
    private Timestamp p_date;
    private String mnick; // 판매자 닉네임
    private String bmnick; // 구매자 닉네임
}
