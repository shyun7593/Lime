package com.lime.limetest.service;

import com.lime.limetest.dao.BoardDao;
import com.lime.limetest.dto.BoardDto;
import com.lime.limetest.dto.MemberDto;
import com.lime.limetest.dto.ReplyDto;
import com.lime.limetest.dto.SearchDto;
import com.lime.limetest.util.PagingUtil;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.util.List;

@Service
@Slf4j
public class boardService {
    @Autowired
    private BoardDao bDao;

    private int lcnt = 7;

    private ModelAndView mav;

    public ModelAndView getBoardList(SearchDto sDto, HttpSession session) {
        log.info("boardService.getBoardList()");
        mav = new ModelAndView();
        List<BoardDto> bList;
        log.info("boardService : " + sDto.getType());
        int num = sDto.getPageNum();

        sDto.setListCnt(lcnt);
        sDto.setPageNum((num - 1) * sDto.getListCnt());
        if (sDto.getType().equals("all")) {
            bList = bDao.selectBoard(sDto);
            session.setAttribute("test", sDto.getType());
        } else {
            bList = bDao.selectTypeBoard(sDto);
            session.setAttribute("test", sDto.getType());
        }

        //Dao에서 게시글 목록 가져오기
        mav.addObject("bList", bList);

        // 페이징 처리
        sDto.setPageNum(num);
        String pageHtml = getPaging(sDto);
        mav.addObject("paging", pageHtml);

        // 세션에 필요 정보 저장 (pageNum, ListCnt
        // 검색 결과 목록으로 돌아갈 때
        session.setAttribute("pageNum", num);
        if (sDto.getColname() != null) {
            // 검색 결과가 있을 때
            session.setAttribute("sDto", sDto);
        } else {
            // 검색 결과가 없는 경우 SearchDto를 제공
            session.removeAttribute("sDto");
        }

        mav.setViewName("boardlist");

        return mav;
    }

    private String getPaging(SearchDto sDto) {
        String pageHtml = null;

        //전체 글개수 구하기.
        int maxNum = bDao.selectBoardcount(sDto);

        //페이지에 보여질 번호 개수
        int pageCnt = 5;
        String listName = null;
        if (sDto.getColname() != null) {
            listName = "list?colname=" + sDto.getColname()
                    + "&keyword=" + sDto.getKeyword() + "&";
        }//list?colname=b_title&keyword=4&
        else {
            listName = "board?type=" + sDto.getType() + "&";
        }

        PagingUtil paging = new PagingUtil(maxNum,
                sDto.getPageNum(),
                sDto.getListCnt(),
                pageCnt, listName);

        pageHtml = paging.makePaging();

        return pageHtml;
    }

    public String BoardWrite(BoardDto bDto, HttpSession session, RedirectAttributes rttr) {
        log.info("boardService.BoardWrite()");
        int num = (int)session.getAttribute("pageNum");
        MemberDto mDto = (MemberDto)session.getAttribute("mb");
        bDto.setB_id(mDto.getMid());
        log.info("b_id : " + bDto.getB_id() + ", b_contents : " + bDto.getB_contents() + ", b_title : " + bDto.getB_title() +
                ", b_type : " + bDto.getB_type());
        String view = null;
        String msg = null;
        try {
            bDao.BoardWrite(bDto);
            view = "redirect:/boarddetail?b_num=" + bDto.getB_num();
            msg = "success";
        } catch (Exception e) {
            e.printStackTrace();
            view = "redirect:/boardwrite";
            msg = "fail";
        }
        rttr.addFlashAttribute("msg",msg);
        return view;
    }

    public String BoardDetail(Integer b_num, Model model, HttpSession session) {
        String view = null;
        try {
            // 글정보 가져오기
            BoardDto bDto  = bDao.selectBoardInfo(b_num);

            // 댓글 가져오기
            List<ReplyDto> rList = bDao.selectReplies(b_num);
            model.addAttribute("bDto", bDto);
            model.addAttribute("rList",rList);
            view = "/boarddetail";
        } catch (Exception e){
            e.printStackTrace();
        }

        return view;
    }

    public String DeleteBoard(HttpSession session, Integer b_num, RedirectAttributes rttr) {
        log.info("boardService.DeleteBoard()");
        String view = null;
        String msg = null;
        String page = (String) session.getAttribute("page");
        String type = (String) session.getAttribute("test");
        log.info("type" + type);
        Integer pageNum = (Integer) session.getAttribute("pageNum");
        log.info("pageNum : " + pageNum);
        try {
            bDao.deleteReply(b_num);
            bDao.deleteBoard(b_num);
            msg = "success";
            if (page.equals("board")){
                view = "redirect:/profile?page="+page+"&type="+type+"&pageNum="+pageNum;
            } else {
                view = "redirect:/board?type=" + type +"&pageNum="+pageNum;
            }

        } catch (Exception e){
            e.printStackTrace();
            msg = "fail";
            view = "redirect:/boarddetail?b_num=" + b_num;
        }
        rttr.addFlashAttribute("msg",msg);

        return view;
    }

    public ModelAndView UpdateBoard(Integer b_num) {
        log.info("boardService.UpdateBoard()");
        mav = new ModelAndView();

        BoardDto bDto = bDao.selectBoardInfo(b_num);
        mav.addObject("bDto",bDto);
        mav.setViewName("boardupdate");


        return mav;
    }

    public String BoardUpdateProc(BoardDto bDto, RedirectAttributes rttr) {
        log.info("boardService.BoardUpdateProc()");
        String view = null;
        String msg = null;

        try {
            bDao.updateboard(bDto);
            msg = "success";
        } catch (Exception e){
            e.printStackTrace();
            msg = "fail";
        }
        view = "redirect:/boarddetail?b_num="+bDto.getB_num();
        rttr.addFlashAttribute("msg",msg);

        return view;
    }

    public ReplyDto replyInsert(ReplyDto rDto) {
        log.info("boardService.replyInsert");
        try {
            bDao.insertReply(rDto);
            rDto = bDao.selectLastReply(rDto.getR_num());
        } catch (Exception e){
            e.printStackTrace();
            rDto = null;
        }
        return rDto;
    }

    public String replyDelete(int r_num) {
        log.info("boardService.replyDelete()");
        String res = null;
        try {
            bDao.deleteSingleReply(r_num);
            res = "true";
        } catch (Exception e){
            e.printStackTrace();
            res = "false";
        }
        return res;
    }
}
