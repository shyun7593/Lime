package com.lime.limetest.dao;

import com.lime.limetest.dto.MemberDto;
import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface MemberDao {
    // 회원 정보 가져오기 minfo
    MemberDto selectMember(String mid);

    // 카카오 로그인 시 회원이 존재하는지 여부 및 회원 정보 가져오기
    MemberDto existMember(String addr);

    // 회원가입
    void memberRegister(MemberDto mDto);

    // 회원 비밀번호 검색 메소드
    String selectPwd(String mid);

    // 아이디 중복체크
    int idCheck(String mid);

    // 닉네임 중복체크
    int nickCheck(String mnick);

    // 회원 포인트 수정 메소드
    void updateMemberPoint(String mid);

    // Profile 보여주기 용 회원 정보 가져오기 member
    MemberDto userInfo(String mid);

    // 나만의 비밀
    String selectSecret(String mid);

    // 회원 정보수정
    void memberUpdate(MemberDto mDto);

    // ID 찾기
    MemberDto searchId(String mname, String mysecret);

    // Pw 찾기
    MemberDto searchPw(String mid, String mysecret);

    // Pw 수정
    void updatePw(String mid, String encpwd);

    // 해당 이름으로 된 사용자가 있는지 확인
    int memberexist(String mname);

    // 자기소개 불러오기
    String selectText(String a_mid);

    // 닉네임 가져오기
    String selectNick(String a_id);

    // 포인트 하락
    void disupdateMemberPoint(MemberDto mDto);

    // 아이디 찾기
    String selectId(String m_rmid);
}
