package com.lime.limetest.service;

import com.google.gson.JsonElement;
import com.google.gson.JsonParser;
import com.lime.limetest.dao.ArtworkDao;
import com.lime.limetest.dao.BoardDao;
import com.lime.limetest.dao.MemberDao;
import com.lime.limetest.dao.MessageDao;
import com.lime.limetest.dto.*;
import com.oracle.wls.shaded.org.apache.bcel.generic.ACONST_NULL;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.UnsupportedEncodingException;
import java.lang.reflect.Array;
import java.net.URL;
import java.net.URLEncoder;
import java.util.List;

@Service
@Slf4j
public class MemberService {
    @Autowired
    private MemberDao mDao;

    @Autowired
    private BoardDao bDao;

    @Autowired
    private ArtworkDao aDao;

    @Autowired
    private MessageDao messageDao;

    // 비밀번호 암호화를 위한 인코더 객체
    private BCryptPasswordEncoder pEncoder = new BCryptPasswordEncoder();

    private ModelAndView mav;

    // 아이디 중복체크
    public String idCheck(String mid) {
        log.info("MemberService.idCheck()");
        String result = null;
        int cnt = mDao.idCheck(mid);
        if (cnt == 0) {
            result = "ok";
        } else {
            result = "fail";
        }

        return result;
    }

    // 닉네임 중복체크

    // 회원가입
    public String memberRegister(MemberDto mDto, RedirectAttributes rttr) {
        log.info("MemberService.memberRegister()");
        String view = null;
        String msg = null;

        // 비밀번호 암호화
        String encpwd = pEncoder.encode(mDto.getMpwd());
        mDto.setMpwd(encpwd);
        try {
            mDao.memberRegister(mDto);
            view = "redirect:/loginForm";
            msg = "회원가입에 성공하였습니다.";
        } catch (Exception e) {
            e.printStackTrace();
            view = "redirect:/register";
            msg = "회원가입에 실패했습니다.";
        }
        rttr.addFlashAttribute("msg", msg);

        return view;
    }

    public String logout(HttpSession session) {
        log.info("MemberService.logout()");
        session.invalidate();

        return "redirect:/main";
    }

    public String loginProc(MemberDto mDto, HttpSession session, RedirectAttributes rttr) {
        log.info("MemberService.loginProc()");
        String view = null;
        String msg = null;
        log.info("dsfd : " +mDto.getMid());

        if (mDao.idCheck(mDto.getMid()) == 0) {
            view = "redirect:loginForm";
            msg = "회원정보가 없습니다.";
        } else {
            String encPwd = mDao.selectPwd(mDto.getMid());
            if (pEncoder.matches(mDto.getMpwd(), encPwd)) {
                mDto = mDao.selectMember(mDto.getMid());
                session.setAttribute("mb", mDto);
                if (session.getAttribute("where") == null) {
                    view = "redirect:main";
                } else {
                    String page = (String) session.getAttribute("where");
                    switch (page){
                        case "boardlist" :
                            view = "redirect:board?type=all&pageNum=1";
                            break;
                        case "artwork":
                            view = "redirect:/artwork?category=all&genre=all&colname=all&keyword=&pageNum=1";
                    }
                    session.removeAttribute("where");
                }
                msg = "로그인 성공";
            } else {
                view = "redirect:loginForm";
                msg = "비밀번호가 일치하지 않습니다.";
            }
        }
        rttr.addFlashAttribute("msg", msg);

        return view;
    }

    public String userConfirm(String mysecert, String mid) {
        log.info("MemberService.userConfirm()");

        String res = null;

        String secret = null;
        MemberDto mlist;

        secret = mDao.selectSecret(mid);


        log.info("secret : " + secret);
        log.info("mysecret : " + mysecert);
        //
        if (secret.equals(mysecert)) {
            res = "true";

        } else {
            res = "false";
        }

        return res;
    }

    public String memberUpdate(MemberDto mDto, RedirectAttributes rttr, HttpSession session) {
        log.info("MemberService.memberUpdate()");
        String view = null;
        String msg = null;
        log.info("비밀번호 안건드렸을 때 : " + mDto.getMpwd());
        if (mDto.getMpwd().equals("default")) {
            String passw = mDao.selectPwd(mDto.getMid());
            mDto.setMpwd(passw);
        } else {
            String encpwd = pEncoder.encode(mDto.getMpwd());
            mDto.setMpwd(encpwd);
        }
        try {
            mDao.memberUpdate(mDto);
            mDto = mDao.selectMember(mDto.getMid());
            session.setAttribute("mb", mDto);
            msg = "수정 성공";
            view = "redirect:/profile?page=showprofile";

        } catch (Exception e) {
            e.printStackTrace();
            view = "/profile?page=showprofile";
            msg = "수정 실패";
        }
        rttr.addFlashAttribute("msg", msg);

        return view;
    }

    public String myPage(String page, SearchDto sDto, Integer pageNum, Integer m_num) {
        log.info("MemberService.myPage()");
        String view = null;
        log.info(page);
        if (page.equals("showprofile")) {
            view = "redirect:/profile?page=" + page;
        } else if(page.equals("artwork")){
            view = "redirect:/profile?page=" + page + "&category="+sDto.getCategory()+"&genre="+sDto.getGenre()+"&pageNum=" + pageNum;
        } else if (page.equals("buypayment") || page.equals("salepayment")){
            view = "redirect:/profile?page=" + page + "&pageNum=" + pageNum;
        }
        else if(page.equals("board")){
            view = "redirect:/profile?page=" + page + "&type="+ sDto.getType() +"&pageNum=" + pageNum;
        }   else{
            view = "redirect:/profile?page=" + page + "&pageNum=" + pageNum;
        }
        return view;

    }

    public String Popup(String page, HttpSession session, String a_id, Integer m_num, Integer a_num) {
        log.info("MemberService.Popup()");
        MemberDto memDto = (MemberDto) session.getAttribute("mb");
        MessageDto mDto = new MessageDto();
        String owner = null;
        String saler = null;
        if (a_id !=null){
            String a_nick = mDao.selectNick(a_id);
           session.setAttribute("a_id",a_nick);
        } else {
            session.removeAttribute("a_id");
        }
        if (page.equals("showmessage")){
            if (!memDto.getMid().equals(messageDao.selectMid(m_num))){
                messageDao.updateisRead(m_num);
            }
            mDto = messageDao.selectMessage(m_num);
            if (mDto.getM_anum() != null){
                saler = aDao.getId(mDto.getM_anum());
            }
        } else{
            if (m_num != null){
                mDto = messageDao.selectMessage(m_num);
            }
            owner = aDao.getId(mDto.getM_anum());
            log.info("owner : " + owner);
        }
        session.setAttribute("saler",saler);
        session.setAttribute("mDto",mDto);
        session.setAttribute("a_num",a_num);
        session.setAttribute("owner",owner);
        session.setAttribute("m_num",m_num);
        session.setAttribute("pages", page);

        return "popup";
    }

    public String searchId(String mname, String mysecret) {
        log.info("MemberService.searchId()");
        String res = null;
        int c = mDao.memberexist(mname);
        if (c <= 0){
            res = "No Member";
            return res;
        }
        MemberDto mDto = mDao.searchId(mname, mysecret);
        if (mDto == null){
            res = "False Answer";
        } else {
            res = mDto.getMid();
        }
        return res;
    }

    public String searchPw(String mid, String mysecret, HttpSession session) {
        log.info("MemberService.searchPw()");
        String res = null;
        int c = mDao.idCheck(mid);
        if (c <= 0){
            res = "No Member";
            return res;
        }
        MemberDto mDto = mDao.searchPw(mid, mysecret);
        if (mDto == null){
            res = "false";
        } else {
                session.setAttribute("mDto", mDto);
                res = "true";
        }
        return res;
    }

    public String updatePw(String mid, String mpwd) {
        log.info("MemberService.updatePw()");
        String res = null;
        String encpwd = pEncoder.encode(mpwd);
        try{
            mDao.updatePw(mid, encpwd);
            res = "수정 성공";
        } catch (Exception e){
            e.printStackTrace();
            res = "수정 실패";
        }
        return res;
    }

    public String goartwork(SearchDto sDto, HttpSession session) throws UnsupportedEncodingException {
        log.info("MemberService.goartwork()");
        session.setAttribute("page","");
        String key = URLEncoder.encode(sDto.getKeyword(), "UTF-8");
        String view = "redirect:/artwork?category=" + sDto.getCategory() + "&genre="+
                sDto.getGenre()+"&colname="+
                sDto.getColname()+"&keyword="+key+"&pageNum=1";

        return view;
    }

    public int countmessage(String mid) {
        int noreadm = messageDao.selectcount(mid);

        return noreadm;
    }

    public ModelAndView getMain(HttpSession session) {
        log.info("MemberService.getMain()");
        mav = new ModelAndView();
        if (session.getAttribute("mb")!=null){
            MemberDto mDto = (MemberDto) session.getAttribute("mb");
            int noreadm = countmessage(mDto.getMid());
            session.setAttribute("count",noreadm);
        }
        session.setAttribute("page","home");
        List<ArtworkDto> aList = aDao.selectBestwork();
        mav.addObject("aList",aList);
        mav.setViewName("main");

        return mav;
    }

    public String nickCheck(String mnick) {
        log.info("MemberService.nickCheck()");
        String res = null;
        int check = mDao.nickCheck(mnick);
        if (check == 0) {
            res = "ok";
        } else {
            res = "fail";
        }
        return res;
    }
}
