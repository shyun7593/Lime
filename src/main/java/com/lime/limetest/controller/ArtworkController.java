package com.lime.limetest.controller;

import com.lime.limetest.dto.ArtworkDto;
import com.lime.limetest.dto.MemberDto;
import com.lime.limetest.dto.SearchDto;
import com.lime.limetest.service.ArtworkService;
import com.lime.limetest.service.MemberService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;


@Controller
@Slf4j
public class ArtworkController {
    @Autowired
    private ArtworkService aServ;

    @Autowired
    private MemberService mServ;

    private ModelAndView mav;

    @PostMapping("WriteArt")
    public String WriteArt(@RequestPart MultipartFile img_file, @RequestPart MultipartFile music_file, ArtworkDto aDto, HttpSession session, RedirectAttributes rttr){
        log.info("ArtworkController.WriteArt()");
        String view = aServ.WriteArt(img_file, music_file, aDto, session, rttr);

        return view;
    }

    @GetMapping("artworkdetail")
    public ModelAndView artworkdetail(Integer a_num, HttpSession session){
        log.info("ArtworkController.artworkdetail()");
        mav = aServ.getArtwork(a_num, session);

        return mav;
    }

    @GetMapping("artworkupdate")
    public ModelAndView artworkupdate(Integer a_num){
        log.info("ArtworkController.artworkdetail()");
        mav = aServ.getArtworkInfo(a_num);

        return mav;
    }

    @GetMapping("artwork")
    public ModelAndView goartwork(SearchDto sDto, HttpSession session){
        log.info("ArtworkController.goartwork()");
        mav  = aServ.goartwork(sDto, session);
        mav.setViewName("artwork");

        if (session.getAttribute("mb")!=null){
            MemberDto mDto = (MemberDto) session.getAttribute("mb");
            int noreadm = mServ.countmessage(mDto.getMid());
            session.setAttribute("count",noreadm);
        }
        session.setAttribute("where","artwork");
        return mav;
    }

    @PostMapping("artUpdate")
    public String artUpdate(@RequestPart MultipartFile img_file,@RequestPart MultipartFile music_file, ArtworkDto aDto, HttpSession session, RedirectAttributes rttr){
        log.info("ArtworkController.artUpdate()");
        String view = aServ.UpdateArt(img_file, music_file, aDto, session, rttr);

        return view;
    }

    @GetMapping("artworkdelete")
    public String DeleteArtwork(Integer a_num, HttpSession session){
        log.info("ArtworkController.DeleteArtwork()");
        String view = aServ.DeleteArtwork(a_num, session);

        return view;
    }

    @GetMapping("artworkwrite")
    public String ArtworkWrite(){
        log.info("ArtworkController.ArtworkWrite()");

        return "artworkwrite";
    }
}
