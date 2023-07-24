package com.lime.limetest.dto;

import lombok.Data;

import java.util.Date;

@Data
public class kakaoPayReadyVO {
    private String tid, next_redirect_pc_url;
    private Date created_at;
}
