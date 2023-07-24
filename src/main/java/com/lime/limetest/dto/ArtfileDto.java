package com.lime.limetest.dto;

import lombok.Data;

@Data
public class ArtfileDto {
    private int af_num;
    private String af_imgoriname;
    private String af_imgsysname;
    private String af_musicoriname;
    private String af_musicsysname;
    private int af_anum; // 작품 글과 파일을 매칭시키는 외래키
}
