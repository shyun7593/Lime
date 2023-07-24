package com.lime.limetest.dto;

import lombok.Data;

@Data
public class MemberDto {
    private String mid; // 아이디
    private String mpwd; // 비밀번호 (암호화)
    private String mname; // 사용자 이름
    private String mkakao; // 카카오 이메일, 카카오 로그인 시 사용
    private String mnick; // 닉네임
    private String mtext; // 자기소개
    private String msecret; // 본인 인증
    private int mpoint; // 등급 계산
    private String gname; // view 등급 이름
}