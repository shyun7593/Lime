package com.lime.limetest.controller;

import com.lime.limetest.dto.MemberDto;
import com.lime.limetest.dto.SearchDto;
import com.lime.limetest.service.MemberService;
import com.lime.limetest.service.ProfileService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.Resource;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.IOException;

@Controller
@Slf4j
public class ProfileController {
    @Autowired
    private ProfileService pServ;

    @Autowired
    private MemberService mServ;

    private ModelAndView mav;

    @GetMapping("profile")
    public ModelAndView profile(String page, HttpSession session, String type, SearchDto sDto){
        log.info("HomeController.profile()");
        switch (page){
            case "showprofile":
                mav = pServ.showProfilePage(page, session);
                break;
            case "artwork":
                mav = pServ.showArtworkPage(page, session, sDto);
                break;
            case "board":
                mav = pServ.showBoardPage(page, session, sDto, type);
                break;
            case "mystore":
                mav = pServ.showmyStorePage(page, session, sDto);
                break;
            case "buypayment":
                mav = pServ.showBuyPaymentPage(page, session, sDto);
                break;
            case "salepayment":
                mav = pServ.showSalePaymentPage(page, session,sDto);
                break;
            case "sendmessage":
                mav = pServ.showSendmessagePage(page, session, sDto);
                break;
            case "receivemessage":
                mav = pServ.showReceivemessagePage(page,session,sDto, type);
                break;
        }
        MemberDto mDto = (MemberDto) session.getAttribute("mb");
        int noreadm = mServ.countmessage(mDto.getMid());
        session.setAttribute("count",noreadm);
        mav.setViewName("profile");

        return mav;
    }

    @GetMapping("downloadfile")
    public ResponseEntity<Resource> fileDownload(String oriname, String sysname, HttpSession session) throws IOException{
        log.info("ProfileController.fileDownload()");
        ResponseEntity<Resource> resp = pServ.fileDownload(oriname, sysname, session);

        return resp;
    }
}
