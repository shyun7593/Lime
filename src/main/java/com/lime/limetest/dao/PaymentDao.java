package com.lime.limetest.dao;

import com.lime.limetest.dto.ArtworkDto;
import com.lime.limetest.dto.MemberDto;
import com.lime.limetest.dto.PaymentDto;
import com.lime.limetest.dto.SearchDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface PaymentDao {
    // 구매내역 개수 구하는 메소드
    int selectBuyPaymentcount (SearchDto sDto);

    // 구매내역 불러오는 메소드
    List<PaymentDto> selectBuyPayment (SearchDto sDto);

    // 구매내역 삽입
    void insertPayment(PaymentDto pDto);

    // 글이 판매된적 있는지 확인
    int countPayment(Integer a_num);

    // 이 글을 구매한적 있는지 확인
    int confirmbuy(String mid, Integer a_num);

    // 판매내역 불러오는 메소드
    List<PaymentDto> selectSalePayment(SearchDto sDto);

    // 판매내역 개수 구하는 메소드
    int selectSalePaymentcount(SearchDto sDto);
}
