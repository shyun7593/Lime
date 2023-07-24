package com.lime.limetest.dao;

import org.apache.ibatis.annotations.Mapper;

@Mapper
public interface SaleDao {
    // 판매된 적이 있는지 확인
    int countSale(Integer a_num);

    // 판매되었을 경우 정보 저장
    void insertSale(Integer a_num);
}
