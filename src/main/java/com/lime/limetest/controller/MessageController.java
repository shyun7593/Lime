package com.lime.limetest.controller;

import com.lime.limetest.dto.MemberDto;
import com.lime.limetest.dto.MessageDto;
import com.lime.limetest.service.MemberService;
import com.lime.limetest.service.MessageService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestPart;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Slf4j
public class MessageController {
    @Autowired
    private MessageService mServ;

    @Autowired
    private MemberService memServ;

    @PostMapping("InquireMessage")
    public String InquireMessage(@RequestPart MultipartFile file, MessageDto mDto, HttpSession session, RedirectAttributes rttr){
        log.info("MessageController.InquireMessage()");
        String res = mServ.InsertMessage(file,mDto,session,rttr);
        if (session.getAttribute("mb")!=null){
            MemberDto memDto = (MemberDto) session.getAttribute("mb");
            int noreadm = memServ.countmessage(memDto.getMid());
            session.setAttribute("count",noreadm);
        }

        return res;
    }
}
