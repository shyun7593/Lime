package com.lime.limetest.dao;

import com.lime.limetest.dto.BoardDto;
import com.lime.limetest.dto.ReplyDto;
import com.lime.limetest.dto.SearchDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface BoardDao {
    // 프로필 용 게시판 정보 가져오기
    List<BoardDto> selectBoard(SearchDto sDto);

    // 게시글 갯수 가져오는 메소드
    int selectBoardcount(SearchDto sDto);

    // 프로필 Q&A, 협업
    List<BoardDto> selectTypeBoard(SearchDto sDto);

    // Q&A, 협업 별 카운트
    int selectTypeboardcount(SearchDto sDto);

    // 게시판 글 작성
    void BoardWrite(BoardDto bDto);

    // 게시글 정보 가져오기
    BoardDto selectBoardInfo(Integer bNum);

    // 게시글 삭제
    void deleteBoard(Integer bNum);

    // 게시글 업데이트
    void updateboard(BoardDto bDto);

    // 댓글 삽입
    void insertReply(ReplyDto rDto);

    // 댓글 최신 가져오기
    ReplyDto selectLastReply(int r_num);

    // 댓글 불러오기
    List<ReplyDto> selectReplies(Integer b_num);

    // 댓글 삭제하기
    void deleteReply(Integer b_num);

    // 본인 댓글 삭제
    void deleteSingleReply(int r_num);
}
