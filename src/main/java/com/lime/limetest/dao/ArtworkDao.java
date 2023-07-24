package com.lime.limetest.dao;

import com.lime.limetest.dto.ArtfileDto;
import com.lime.limetest.dto.ArtworkDto;
import com.lime.limetest.dto.SearchDto;
import org.apache.ibatis.annotations.Mapper;

import java.sql.Timestamp;
import java.util.List;

@Mapper
public interface ArtworkDao {
    // 프로필 용 작품정보 불러오기
    List<ArtworkDto> selectArtwork(SearchDto sDto);

    // 작품글 갯수 가져오는 메소드
    int selectArtworkcount(SearchDto sDto);

    // 작품 글 저장
    void insertArtwork(ArtworkDto aDao);

    // 작품 파일 저장 메소드
    void insertFile(ArtfileDto af);

    // 방금 작성한 글 번호 가져오기
    int selectArtworked(Timestamp aDate);

    // 작품 정보 불러오기
    ArtworkDto getArtwork(Integer a_num);

    // 파일 목록 가져오기(작품 상세보기)
    ArtfileDto selectFiles(Integer a_num);

    // 작품들 불러오기
    List<ArtworkDto> selectArtworks(SearchDto sDto);

    // 글 갯수 가져오기
    int getArtworkcount(SearchDto sDto);

    // 작품 글 업데이트
    void UpdateArt(ArtworkDto aDto);

    // 파일 삭제
    void deleteSingleimgFile(Integer a_num);

    // 음악 삭제
    void deleteSinglemusicFile(Integer a_num);

    // 작품 삭제
    void deleteArtwork(Integer a_num);

    // 파일 삭제
    void deleteFile(Integer a_num);

    // 파일이 존재하는지 파악
    int getcountfile(ArtworkDto aDto);

    // 중복파일 삭제
    void deletedistinctFile(ArtworkDto aDto);

    // 사진 불러오기
    ArtfileDto getfile(int a_num);

    // sysname 불러오기
    String selectSysname(Integer a_num);

    // 이미지 파일 업데이트
    void updateimgFile(ArtfileDto af);

    // 음악 파일 업데이트
    void updatemusicFile(ArtfileDto af);

    // 구매 횟수 증가
    void updateCnt(Integer a_num);

    // 구매자가 있을 경우 삭제 할때
    void setdel(Integer a_num);

    // 시스템 이름 구하기
    String selectimgSysname(Integer a_num);

    // 판매량 상위6개 구하기
    List<ArtworkDto> selectBestwork();

    // 글 작성자 아이디 구하기
    String getId(Integer m_anum);
}
