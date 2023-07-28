package com.lime.limetest.controller;

import com.lime.limetest.dto.BoardDto;
import com.lime.limetest.dto.MemberDto;
import com.lime.limetest.dto.ReplyDto;
import com.lime.limetest.dto.SearchDto;
import com.lime.limetest.service.MemberService;
import com.lime.limetest.service.boardService;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@Slf4j
public class boardController {
    @Autowired
    private boardService bServ;

    @Autowired
    private MemberService mServ;

    private ModelAndView mav;

    @GetMapping("board")
    public ModelAndView board(SearchDto sDto, HttpSession session) {
        log.info("boardController.board()");
        if (session.getAttribute("mb")!=null){
            MemberDto mDto = (MemberDto) session.getAttribute("mb");
            int noreadm = mServ.countmessage(mDto.getMid());
            session.setAttribute("count",noreadm);
        }
        session.setAttribute("where","boardlist");
        mav = bServ.getBoardList(sDto, session);
        mav.setViewName("boardlist");

        return mav;
    }

    @GetMapping("boardwrite")
    public String boardWrite() {
        log.info("boardController.boardWrite()");

        return "boardwrite";
    }

    @PostMapping("boardWriteProc")
    public String boardWriteProc(BoardDto bDto, HttpSession session, RedirectAttributes rttr) {
        log.info("boardController.boardWriteProc()");
        String view = bServ.BoardWrite(bDto, session, rttr);

        return view;
    }

    @GetMapping("boarddetail")
    public String boarddetail(Integer b_num, Model model, HttpSession session) {
        log.info("boardController.boarddetail()");
        String view = bServ.BoardDetail(b_num, model, session);

        return view;
    }

    @GetMapping("DeleteBoard")
    public String DeleteBoard(HttpSession session, Integer b_num, RedirectAttributes rttr) {
        log.info("boardController.DeleteBoard()");
        String view = bServ.DeleteBoard(session, b_num, rttr);

        return view;
    }

    @GetMapping("boardupdate")
    public ModelAndView UpdateBoard(Integer b_num) {
        log.info("boardController.UpdateBoard()");
        mav = bServ.UpdateBoard(b_num);
        mav.setViewName("boardupdate");
        return mav;
    }

    @PostMapping("boardupdateProc")
    public String BoardUpdateProc(BoardDto bDto, RedirectAttributes rttr) {
        log.info("boardController.BoardUpdateProc()");
        String view = bServ.BoardUpdateProc(bDto, rttr);
        return view;
    }

    @PostMapping("replyInsert")
    @ResponseBody
    public ReplyDto replyInsert(ReplyDto rDto) {
        log.info("boardController.replyInsert()");
        rDto = bServ.replyInsert(rDto);

        return rDto;
    }

    @PostMapping("replyDelete")
    @ResponseBody
    public String replyDelete(int r_num){
        log.info("boardController.replyDelete()");
        String res = bServ.replyDelete(r_num);

        return res;
    }
}
