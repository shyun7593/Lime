package com.lime.limetest.controller;

import com.lime.limetest.service.kakaoPayService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;

@Controller
@Slf4j
public class kakaoPayController {
    @Autowired
    private kakaoPayService kakaopay;

    @GetMapping("/kakaoPay")
    public String kakaoPay(Integer a_num, Integer price, Integer m_num){
        log.info("kakaoPayController.kakaoPay()");
        String view = null;
        if (price == null){
            view = kakaopay.kakaoPayReady(a_num);
        } else {
            view = kakaopay.kakaoPayReadym(price, a_num, m_num);
        }
        return "redirect:" + view;
    }

    @GetMapping("/kakaoPaySuccess")
    public void kakaoPaySuccess(@RequestParam("pg_token") String pg_token, Model model, Integer a_num, Integer price, Integer m_num, HttpSession session){
        log.info("KakaoPayController.kakaoPaySuccess()");
        if (price == null){
            model.addAttribute("info", kakaopay.kakaoPayInfo(pg_token, a_num, session));
        } else {
            model.addAttribute("info", kakaopay.kakaoPayInfom(pg_token, a_num, price, m_num, session));
        }

    }

    @GetMapping("/kakaoPayCancel")
    public String kakaoPayCancel(){
        return "kakaoPayCancel";

    }

}
