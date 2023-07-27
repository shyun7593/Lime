package com.lime.limetest.service;

import com.lime.limetest.dao.*;
import com.lime.limetest.dto.*;
import com.lime.limetest.util.PagingUtil;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.core.io.InputStreamResource;
import org.springframework.core.io.Resource;
import org.springframework.http.CacheControl;
import org.springframework.http.HttpHeaders;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Service;
import org.springframework.web.servlet.ModelAndView;

import java.io.FileInputStream;
import java.io.IOException;
import java.net.URLEncoder;
import java.rmi.server.ExportException;
import java.util.List;

@Service
@Slf4j
public class ProfileService {
    @Autowired
    private MemberDao mDao;

    @Autowired
    private BoardDao bDao;

    @Autowired
    private ArtworkDao aDao;

    @Autowired
    private PaymentDao pDao;

    @Autowired
    private StoreDao sDao;

    @Autowired
    private MessageDao messageDao;

    private int lcnt = 9;

    private ModelAndView mav;

    public ModelAndView showProfilePage(String page, HttpSession session) {
        log.info("ProfileService.showProfile()");
        mav = new ModelAndView();
        MemberDto m = (MemberDto) session.getAttribute("mb");
        session.setAttribute("page", page);
        Integer count = noReadcount(m.getMid());
        session.setAttribute("count",count);
            MemberDto mDto = mDao.userInfo(m.getMid());
            log.info("showprofile");
            mav.addObject("userInfo", mDto);
        mav.setViewName("profile");

        return mav;
    }

    public ModelAndView showArtworkPage(String page, HttpSession session, SearchDto sDto) {
        log.info("ProfileService.showArtworkPage()");
        mav = new ModelAndView();
        MemberDto m = (MemberDto) session.getAttribute("mb");
        Integer count = noReadcount(m.getMid());
        session.setAttribute("count",count);
        session.setAttribute("page", page);
        int num = sDto.getPageNum();
        log.info("sDto pageNum : "+num);
        if(sDto.getListCnt() == 0){
            sDto.setListCnt(lcnt);
        }

        sDto.setPageNum((num-1) * sDto.getListCnt());
        sDto.setColname("A_ID");
        sDto.setKeyword(m.getMid());
        List<ArtworkDto> aList = aDao.selectArtwork(sDto);
        mav.addObject("aList",aList);


        sDto.setPageNum(num);
        String pageHtml = getPaging(sDto, page);
        mav.addObject("paging",pageHtml);
        session.setAttribute("pageNum", num);
        session.setAttribute("sDto", sDto);
        mav.setViewName("profile");

        return mav;
    }
    public ModelAndView showBoardPage(String page, HttpSession session, SearchDto sDto, String type) {
        log.info("ProfileService.showBoardPage()");
        session.setAttribute("test", type);
        List <BoardDto> bList;
        mav = new ModelAndView();
        log.info("ProfileService : " + sDto.getType());
        MemberDto m = (MemberDto) session.getAttribute("mb");
        Integer count = noReadcount(m.getMid());
        session.setAttribute("count",count);
        session.setAttribute("page", page);
        int num = sDto.getPageNum();
        log.info("sDto pageNum : "+num);
        if(sDto.getListCnt() == 0){
            sDto.setListCnt(lcnt);
        }
        sDto.setPageNum((num-1) * sDto.getListCnt());
        sDto.setColname("B_ID");
        sDto.setKeyword(m.getMid());
        if (sDto.getType() == null || sDto.getType().equals("all")) {
            bList = bDao.selectBoard(sDto);
            session.setAttribute("sDto", sDto);
        } else {
            bList = bDao.selectTypeBoard(sDto);
            session.setAttribute("sDto", sDto);
        }
        mav.addObject("bList",bList);

        sDto.setPageNum(num);
        String pageHtml = getPaging(sDto, page);
        mav.addObject("paging",pageHtml);
        session.setAttribute("pageNum", num);
        session.setAttribute("sDto", sDto);
        mav.setViewName("profile");

        return mav;
    }

    public ModelAndView showBuyPaymentPage(String page, HttpSession session, SearchDto sDto) {
        log.info("ProfileService.showBuyPaymentPage()");
        mav = new ModelAndView();
        MemberDto m = (MemberDto) session.getAttribute("mb");
        Integer count = noReadcount(m.getMid());
        session.setAttribute("count",count);
        session.setAttribute("page", page);
        int num = sDto.getPageNum();
        log.info("sDto pageNum : "+num);

        sDto.setListCnt(9);

        sDto.setPageNum((num-1) * sDto.getListCnt());
        sDto.setKeyword(m.getMid());
        List<PaymentDto> pList = pDao.selectBuyPayment(sDto);
        mav.addObject("pList", pList);

        sDto.setPageNum(num);
        String pageHtml = getPaging(sDto, page);
        mav.addObject("paging",pageHtml);
        session.setAttribute("pageNum", num);
        session.setAttribute("sDto", sDto);
        mav.setViewName("profile");

        return mav;
    }

    public ModelAndView showmyStorePage(String page, HttpSession session, SearchDto sDto) {
        mav = new ModelAndView();
        session.setAttribute("page", page);
        MemberDto mDto = (MemberDto) session.getAttribute("mb");
        Integer count = noReadcount(mDto.getMid());
        session.setAttribute("count",count);
        int num = sDto.getPageNum();
        sDto.setListCnt(6);
        sDto.setPageNum((num-1) * sDto.getListCnt());
        sDto.setKeyword(mDto.getMid());
        List<StoreDto> sList = sDao.selectStore(sDto);
        mav.addObject("sList", sList);

        sDto.setPageNum(num);
        String pageHtml = getPaging(sDto, page);
        mav.addObject("paging",pageHtml);
        session.setAttribute("pageNum", num);
        session.setAttribute("sDto", sDto);
        mav.setViewName("profile");

        return mav;
    }

    private String getPaging(SearchDto sDto, String page) {
        log.info("ProfileService.getPaging()");
        String pageHtml = null;

        //전체 글개수 구하기.
        int maxNum = 0;
        if (page.equals("artwork")){
            maxNum = aDao.selectArtworkcount(sDto);
        } else if(page.equals("board")){
            if (sDto.getType() == null || sDto.getType().equals("all")){
                sDto.setType("all");
                maxNum = bDao.selectBoardcount(sDto);
            } else {
                maxNum = bDao.selectTypeboardcount(sDto);
            }

        } else if (page.equals("buypayment")) {
            maxNum = pDao.selectBuyPaymentcount(sDto);
        } else if (page.equals("salepayment")){
            maxNum = pDao.selectSalePaymentcount(sDto);
        }
        else if (page.equals("mystore")){
            maxNum = sDao.selectStorecount(sDto);
        } else if (page.equals("sendmessage")){
            maxNum = messageDao.selectSendcount(sDto);
        } else {
            maxNum = messageDao.selectReceivecount(sDto);
        }
        //페이지에 보여질 번호 개수
        int pageCnt = 5;
        String listName = null;
        if (page.equals("artwork")){
            listName = "profile?page=" + page + "&category=" + sDto.getCategory() + "&genre=" + sDto.getGenre()
                    + "&";
        } else {
            if (sDto.getType() == null || sDto.getType().equals("all")) {
                listName = "profile?page=" + page + "&type=all&";
            } else {
                listName = "profile?page=" + page + "&type=" + sDto.getType() + "&";
            }
        }


        PagingUtil paging = new PagingUtil(maxNum,
                sDto.getPageNum(),
                sDto.getListCnt(),
                pageCnt, listName);

        pageHtml = paging.makePaging();

        return pageHtml;
    }


    public ResponseEntity<Resource> fileDownload(String oriname, String sysname, HttpSession session) throws IOException {
        log.info("ProfileService.fileDownload()");
        String realpath = session.getServletContext().getRealPath("/");
        String page = (String) session.getAttribute("page");
        if (page.equals("mystore")){
            realpath += "upload/music/" + sysname;
        }
        else {
            realpath += "upload/message/"+sysname;
        }


        InputStreamResource fResource = new InputStreamResource(new FileInputStream(realpath));

        String fileName = URLEncoder.encode(oriname,"UTF-8");

        return ResponseEntity.ok().contentType(MediaType.APPLICATION_OCTET_STREAM).cacheControl(CacheControl.noCache())
                .header(HttpHeaders.CONTENT_DISPOSITION, "attachment; filename=" + fileName)
                .body(fResource);
    }

    public ModelAndView showSendmessagePage(String page, HttpSession session, SearchDto sDto) {
        log.info("ProfileService.showSendmessagePage()");
        MemberDto mDto = (MemberDto) session.getAttribute("mb");
        Integer count = noReadcount(mDto.getMid());
        session.setAttribute("count",count);
        mav = new ModelAndView();
        session.setAttribute("page", page);

        List<MessageDto> messageDto;

        int num = sDto.getPageNum();
        log.info("sDto pageNum : "+num);
        if(sDto.getListCnt() == 0){
            sDto.setListCnt(lcnt);
        }
        sDto.setPageNum((num-1) * sDto.getListCnt());
        sDto.setKeyword(mDto.getMid());

        messageDto = messageDao.selectSendMessage(sDto);
        session.setAttribute("sDto", sDto);

        mav.addObject("sendDto",messageDto);
        mav.setViewName("profile");

        sDto.setPageNum(num);
        String pageHtml = getPaging(sDto, page);
        mav.addObject("paging",pageHtml);
        session.setAttribute("pageNum", num);
        session.setAttribute("sDto", sDto);
        mav.setViewName("profile");

        return mav;
    }

    public ModelAndView showReceivemessagePage(String page, HttpSession session, SearchDto sDto, String type) {
        log.info("ProfileService.showReceivemessagePage()");
        MemberDto mDto = (MemberDto) session.getAttribute("mb");
        Integer count = noReadcount(mDto.getMid());
        session.setAttribute("count",count);
        mav = new ModelAndView();
        session.setAttribute("page", page);
        session.setAttribute("test", type);
        List<MessageDto> messageDto;

        int num = sDto.getPageNum();
        log.info("sDto pageNum : "+num);
        if(sDto.getListCnt() == 0){
            sDto.setListCnt(lcnt);
        }
        sDto.setPageNum((num-1) * sDto.getListCnt());
        sDto.setKeyword(mDto.getMid());
        if (sDto.getType() == null || sDto.getType().equals("all")){
            messageDto = messageDao.selectReceiveMessage(sDto);
            session.setAttribute("sDto", sDto);
        } else {
            messageDto = messageDao.selectreadReceiveMessage(sDto);
            session.setAttribute("sDto", sDto);
        }
        mav.addObject("receiveDto",messageDto);
        mav.setViewName("profile");

        sDto.setPageNum(num);
        String pageHtml = getPaging(sDto, page);
        mav.addObject("paging",pageHtml);
        session.setAttribute("pageNum", num);
        session.setAttribute("sDto", sDto);
        mav.setViewName("profile");

        return mav;
    }

    public Integer noReadcount(String mid){
        Integer count = messageDao.selectcount(mid);
        return count;
    }

    public ModelAndView showSalePaymentPage(String page, HttpSession session, SearchDto sDto) {
        log.info("ProfileService.showSalePaymentPage()");
        mav = new ModelAndView();
        MemberDto m = (MemberDto) session.getAttribute("mb");
        Integer count = noReadcount(m.getMid());
        session.setAttribute("count",count);
        session.setAttribute("page", page);
        int num = sDto.getPageNum();
        log.info("sDto pageNum : "+num);

        sDto.setListCnt(9);

        sDto.setPageNum((num-1) * sDto.getListCnt());
        sDto.setKeyword(m.getMid());
        List<PaymentDto> psList = pDao.selectSalePayment(sDto);
        mav.addObject("psList", psList);

        sDto.setPageNum(num);
        String pageHtml = getPaging(sDto, page);
        mav.addObject("paging",pageHtml);
        session.setAttribute("pageNum", num);
        session.setAttribute("sDto", sDto);
        mav.setViewName("profile");

        return mav;
    }
}
