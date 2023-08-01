package com.lime.limetest.service;

import com.lime.limetest.dao.*;
import com.lime.limetest.dto.*;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Service;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestClientException;
import org.springframework.web.client.RestTemplate;

import java.net.URI;
import java.net.URISyntaxException;

@Service
@Slf4j
public class kakaoPayService {
    @Autowired
    private ArtworkDao aDao;

    @Autowired
    private PaymentDao pDao;

    @Autowired
    private MemberDao mDao;

    @Autowired
    private StoreDao stDao;

    @Autowired
    private MessageDao messDao;

    private kakaoPayReadyVO kakaoPayReadyVO;
    private kakaoPayApprovalVO kakaoPayApprovalVO;

    private static final String HOST = "https://kapi.kakao.com";
    public String kakaoPayReadym(Integer price, Integer a_num, Integer m_num) {
        log.info("kakaoPayService.kakoPayReadym()");
        RestTemplate restTemplate = new RestTemplate();

        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "63b299043fad209993fedc3aa389612f");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "Lime");
        params.add("item_name", "작사");
        params.add("quantity", "1");
        params.add("total_amount", "" + price);
        params.add("vat_amount","0");
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://192.168.0.107/kakaoPaySuccess?a_num="+ a_num +"&m_num="+ m_num +"&price=" + price);
        params.add("cancel_url", "http://192.168.0.107/kakaoPayCancel");
        params.add("fail_url", "http://192.168.0.107/kakaoPaySuccessFail");

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, kakaoPayReadyVO.class);

            return kakaoPayReadyVO.getNext_redirect_pc_url();

        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "/pay";
    }
    public String kakaoPayReady(Integer a_num) {
        RestTemplate restTemplate = new RestTemplate();
        log.info("kakaoPayService.kakoPayReady()");
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "63b299043fad209993fedc3aa389612f");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        ArtworkDto aDto = aDao.getArtwork(a_num);
        log.info("가격 : " + aDto.getA_price());
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "Lime");
        params.add("item_name", aDto.getA_title());
        params.add("quantity", "1");
        params.add("total_amount", ""+aDto.getA_price());
        params.add("vat_amount","0");
        params.add("tax_free_amount", "0");
        params.add("approval_url", "http://192.168.0.107/kakaoPaySuccess?a_num=" + a_num);
        params.add("cancel_url", "http://192.168.0.107/kakaoPayCancel");
        params.add("fail_url", "http://192.168.0.107/kakaoPaySuccessFail");

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

        try {
            kakaoPayReadyVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/ready"), body, kakaoPayReadyVO.class);

            return kakaoPayReadyVO.getNext_redirect_pc_url();

        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return "/pay";
    }

    public kakaoPayApprovalVO kakaoPayInfo(String pg_token, Integer a_num, HttpSession session){
        log.info("kakaoPayService.kakoPayInfo()");
        log.info("pg_token : " + pg_token);
        RestTemplate restTemplate = new RestTemplate();
        ArtworkDto aDto = aDao.getArtwork(a_num);
        MemberDto mDto = (MemberDto) session.getAttribute("mb");
        String b_id = mDto.getMid(); // 구매자 아이디 가져오기
        PaymentDto pDto = new PaymentDto();
        pDto.setP_price(aDto.getA_price());
        pDto.setP_bid(b_id);
        pDto.setP_pid(aDto.getA_id());
        pDto.setP_anum(a_num);
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "63b299043fad209993fedc3aa389612f");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "Lime");
        params.add("pg_token", pg_token);
        params.add("total_amount", ""+aDto.getA_price());

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, kakaoPayApprovalVO.class);
            log.info("" + kakaoPayApprovalVO);
            pDao.insertPayment(pDto);
            stDao.insertStore(b_id, a_num);
            mDao.updateMemberPoint(b_id);
            mDto = mDao.selectMember(b_id);
            session.setAttribute("mb",mDto);
            mDao.updateMemberPoint(aDto.getA_id());
            aDao.updateCnt(a_num);
            return kakaoPayApprovalVO;

        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }

        return null;
    }


    public Object kakaoPayInfom(String pg_token, Integer a_num, Integer price, Integer m_num,HttpSession session) {
        log.info("kakaoPayService.kakoPayInfom()");
        log.info("pg_token : " + pg_token);
        RestTemplate restTemplate = new RestTemplate();
        ArtworkDto aDto = aDao.getArtwork(a_num);
        MemberDto mDto = (MemberDto) session.getAttribute("mb");
        String b_id = mDto.getMid(); // 구매자 아이디 가져오기
        PaymentDto pDto = new PaymentDto();
        pDto.setP_price(price);
        pDto.setP_bid(b_id);
        pDto.setP_pid(aDto.getA_id());
        pDto.setP_anum(a_num);
        // 서버로 요청할 Header
        HttpHeaders headers = new HttpHeaders();
        headers.add("Authorization", "KakaoAK " + "63b299043fad209993fedc3aa389612f");
        headers.add("Accept", MediaType.APPLICATION_JSON_UTF8_VALUE);
        headers.add("Content-Type", MediaType.APPLICATION_FORM_URLENCODED_VALUE + ";charset=UTF-8");

        // 서버로 요청할 Body
        MultiValueMap<String, String> params = new LinkedMultiValueMap<String, String>();
        params.add("cid", "TC0ONETIME");
        params.add("tid", kakaoPayReadyVO.getTid());
        params.add("partner_order_id", "1001");
        params.add("partner_user_id", "Lime");
        params.add("pg_token", pg_token);
        params.add("total_amount", ""+price);

        HttpEntity<MultiValueMap<String, String>> body = new HttpEntity<MultiValueMap<String, String>>(params, headers);

        try {
            kakaoPayApprovalVO = restTemplate.postForObject(new URI(HOST + "/v1/payment/approve"), body, kakaoPayApprovalVO.class);
            log.info("" + kakaoPayApprovalVO);
            messDao.updateisPay(m_num);
            pDao.insertPayment(pDto);
            mDao.updateMemberPoint(b_id);
            mDto = mDao.selectMember(b_id);
            session.setAttribute("mb",mDto);
            mDao.updateMemberPoint(aDto.getA_id());
            aDao.updateCnt(a_num);
            return kakaoPayApprovalVO;

        } catch (RestClientException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } catch (URISyntaxException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        }
        return null;
    }
}
