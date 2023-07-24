package com.lime.limetest.dto;

import com.fasterxml.jackson.annotation.JsonFormat;
import lombok.Data;

import java.sql.Timestamp;

@Data
public class MessageDto {
    private int m_num;
    private String m_title;
    private String m_text;
    private String m_mid;
    private String m_rmid;
    private Integer m_anum;
    private Integer m_price;
    private String m_ispay;
    private String m_fileoriname;
    private String m_filesysname;
    @JsonFormat(pattern = "yyyy-MM-dd HH:mm:ss", timezone = "Asia/Seoul")
    private Timestamp m_date;
    private String m_isread;
    private String mnick;
    private String rmnick;
}
