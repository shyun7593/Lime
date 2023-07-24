package com.lime.limetest.dto;

import lombok.Data;

@Data
public class SearchDto {
    private String category; // 검색할 카테고리
    private String genre; // 검색할 장르
    private String colname; // 제목, 작성자 나누기
    private String keyword; // 검색 키워드
    private String type; // 게시판 협업인지 Q&A인지
    private int pageNum; // 페이지 번호
    private int listCnt; // 페이지당 보여질 게시글 갯수
}
