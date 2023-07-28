package com.lime.limetest.controller;

import com.lime.limetest.dto.MemberDto;
import com.lime.limetest.dto.SearchDto;
import com.lime.limetest.service.ArtworkService;
import com.lime.limetest.service.KakaoLoginService;
import com.lime.limetest.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.UnsupportedEncodingException;

@Controller
@Slf4j
public class HomeController {

    @Autowired
    private MemberService mServ;

    @Autowired
    private KakaoLoginService kServ;

    private ModelAndView mav;

    @GetMapping("main")
    public ModelAndView goHome(HttpSession session){
        log.info("HomeController.goHome()");
        mav = mServ.getMain(session);
        return mav;
    }

    @GetMapping("registerForm")
    public String joinForm(){
        log.info("HomeController.registerForm()");

        return "registerForm";
    }

    @GetMapping("idCheck")
    @ResponseBody
    public String idCheck(String mid){
        log.info("HomeController.idCheck()");
        String result = mServ.idCheck(mid);

        return result;
    }

    @GetMapping("nickCheck")
    @ResponseBody
    public String nickCheck(String mnick){
        log.info("HomeController.nickCheck()");
        String result = mServ.nickCheck(mnick);

        return result;
    }

    @PostMapping("registerProc")
    public String registerProc(MemberDto mDto, RedirectAttributes rttr){
        log.info("HomeController.registerProc()");

        String view = mServ.memberRegister(mDto, rttr);

        return view;
    }

    @PostMapping("updateProc")
    public String updateProc(MemberDto mDto, RedirectAttributes rttr, HttpSession session){
        log.info("HomeController.updateProc()");

        String view = mServ.memberUpdate(mDto, rttr, session);

        return view;
    }

    @GetMapping("loginForm")
    public String loginForm(){
        log.info("HomeController.loginForm()");

        return "loginForm";
    }

    @GetMapping("login")
    public String login(@RequestParam("code") String code, HttpSession session, RedirectAttributes rttr){
        log.info("HomeController.login()");
        log.info("code : " + code);
        String access_Token = kServ.getAccessToken(code);
        log.info("access_Token : " + access_Token);
        String view = kServ.getUserInfo(access_Token,session,rttr);

        return view;
    }

    @GetMapping("logOut")
    public String logOut(HttpSession session){
        String view = null;
        if(session.getAttribute("logintype") != null){
            String token = "" + session.getAttribute("logintype") +"";
            view = kServ.kakaologout(token, session);
        } else {
            view = mServ.logout(session);
        }
        return view;
    }

    @PostMapping("loginProc")
    public String loginProc(MemberDto mDto, HttpSession session, RedirectAttributes rttr){
        log.info("HomeController.loginProc()");
        String view = mServ.loginProc(mDto, session, rttr);

        return view;
    }

    @PostMapping("userConfirm")
    @ResponseBody
    public String profile(String mysecret, String mid){
        log.info("HomeController.userConfirm()");

        String view = mServ.userConfirm(mysecret, mid);

        return view;
    }

    @GetMapping("mypage")
    public String myPage(String page,Integer pageNum, SearchDto sDto, Integer m_num, HttpSession session){
        log.info("HomeController.myPage()");
        String view = mServ.myPage(page, sDto, pageNum, m_num);
        if (session.getAttribute("mb")!=null){
            MemberDto mDto = (MemberDto) session.getAttribute("mb");
            int noreadm = mServ.countmessage(mDto.getMid());
            session.setAttribute("count",noreadm);
        }
        return view;
    }

    @GetMapping("popup")
    public String popup(String page, HttpSession session, String a_id, Integer m_num, Integer a_num){
        log.info("HomeController.popup()");
        String view = mServ.Popup(page, session, a_id, m_num, a_num);

        return view;
    }


    @GetMapping("searchIdPw")
    public String searchIdPw(String page, HttpSession session){
        log.info("HomeController.searchIdPw()");
        session.setAttribute("page", page);

        return "searchIdPw";
    }

    @PostMapping("searchId")
    @ResponseBody
    public String searchId(String mname, String mysecret){
        log.info("HomeController.searchId()");
        String res = mServ.searchId(mname, mysecret);

        return res;
    }

    @PostMapping("searchPw")
    @ResponseBody
    public String searchPw(String mid, String mysecret, HttpSession session){
        log.info("HomeController.searchPw()");
        String res = mServ.searchPw(mid, mysecret, session);
        return res;
    }

    @PostMapping("updatePw")
    @ResponseBody
    public String updatePw(String mid, String mpwd){
        log.info("HomeController.updatePw()");
        String res = mServ.updatePw(mid, mpwd);
        return res;
    }

    @GetMapping("goartwork")
    public String goartwork(SearchDto sDto, HttpSession session) throws UnsupportedEncodingException {
        log.info("HomeController.goartwork()");
        String view = mServ.goartwork(sDto,session);
        if (session.getAttribute("mb")!=null){
            MemberDto mDto = (MemberDto) session.getAttribute("mb");
            int noreadm = mServ.countmessage(mDto.getMid());
            session.setAttribute("count",noreadm);
        }
        return view;
    }
}
