package com.lime.limetest.dao;

import com.lime.limetest.dto.PaymentDto;
import com.lime.limetest.dto.SearchDto;
import com.lime.limetest.dto.StoreDto;
import org.apache.ibatis.annotations.Mapper;

import java.util.List;

@Mapper
public interface StoreDao {
    // 보관함 갯수 구하기
    int selectStorecount(SearchDto sDto);

    // 프로필용 보관함 불러오기
    List<StoreDto> selectStore(SearchDto sDto);

    // 보관함에 저장
    void insertStore(String b_id, Integer a_num);
}
