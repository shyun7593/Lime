package com.lime.limetest.dao;

import com.lime.limetest.dto.MessageDto;
import com.lime.limetest.dto.SearchDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface MessageDao {
    // message 저장
    void insertMessage(MessageDto mDto);

    // 보낸 message 가져오기
    List<MessageDto> selectSendMessage(SearchDto sDto);

    // 받은 message 가져오기
    List<MessageDto> selectReceiveMessage(SearchDto sDto);

    // message 내용 가져오기
    MessageDto selectMessage(Integer m_num);

    // message 읽음 처리
    void updateisRead(Integer m_num);

    // 안읽은 message 갯수 구하기
    Integer selectcount(String mid);

    // 보낸 message 갯수 구하기
    int selectSendcount(SearchDto sDto);

    // 받은 message 갯수 구하기
    int selectReceivecount(SearchDto sDto);

    // 받은 message 읽음/안읽음
    List<MessageDto> selectreadReceiveMessage(SearchDto sDto);

    // 읽는 사람이 보낸건지 받은 메시지 인지 파악
    String selectMid(Integer mNum);

    // 구매 확인
    void updateisPay(Integer m_num);
}
