package com.lime.limetest.service;

import com.lime.limetest.dao.ArtworkDao;
import com.lime.limetest.dao.MemberDao;
import com.lime.limetest.dao.PaymentDao;
import com.lime.limetest.dao.SaleDao;
import com.lime.limetest.dto.*;
import com.lime.limetest.util.PagingUtil;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;
import java.util.List;

@Service
@Slf4j
public class ArtworkService {
    @Autowired
    private ArtworkDao aDao;

    @Autowired
    private MemberDao mDao;

    @Autowired
    private PaymentDao pDao;

    private int lcnt = 16;

    private ModelAndView mav;

    public String WriteArt(MultipartFile img_file, MultipartFile music_file, ArtworkDto aDto, HttpSession session, RedirectAttributes rttr) {
        log.info("ArtworkService.WriteArt()");
        String msg = null;
        String view = null;
        if (aDto.getA_release().equals(null) || aDto.getA_release().equals("")) {
            aDto.setA_release("미정");
        }
        try {
            aDao.insertArtwork(aDto);
            log.info("게시글 번호 : " + aDto.getA_num());

            String result = fileUpload(img_file, music_file, session, aDto);
            if (result.equals("fail")) {
                view = "redirect:artworkwrite";
                msg = "fileupload fail";
                rttr.addFlashAttribute("msg", msg);
                return view;
            }
            MemberDto mDto = (MemberDto) session.getAttribute("mb");

            MemberDto mdto = mDao.selectMember(mDto.getMid());

            session.setAttribute("mb", mdto);

            view = "redirect:/artworkdetail?a_num=" + aDto.getA_num();
            msg = "작성 성공";
        } catch (Exception e) {
            e.printStackTrace();
            view = "redirect:artworkwrite";
            msg = "작성 실패";
        }
        rttr.addFlashAttribute("msg", msg);

        return view;
    }

    private String fileUpload(MultipartFile img_file, MultipartFile music_file, HttpSession session, ArtworkDto aDto) {
        log.info("ArtworkService.fileUpload()");
        String imgrealPath = session.getServletContext().getRealPath("/") + "upload/image/";
        String musicrealPath = session.getServletContext().getRealPath("/") + "upload/music/";
        String imgoriname = null;
        String musicoriname = null;
        String imgsysname = null;
        String musicsysname = null;
        try {
            if (img_file.isEmpty()) {
                imgoriname = "none.PNG";
            } else {
                imgoriname = img_file.getOriginalFilename();
                File imgfolder = new File(imgrealPath);
                if (imgfolder.isDirectory() == false) {
                    imgfolder.mkdir();
                }
                imgsysname = System.currentTimeMillis() + imgoriname.substring(imgoriname.lastIndexOf(".")); // 저장용 이름
            }
            if (music_file.isEmpty()) {
            } else {
                musicoriname = music_file.getOriginalFilename();
                File musicfolder = new File(musicrealPath);
                if (musicfolder.isDirectory() == false) {
                    musicfolder.mkdir();
                }
                musicsysname = System.currentTimeMillis() + musicoriname.substring(musicoriname.lastIndexOf(".")); // 저장용 이름
            }
            ArtfileDto af = new ArtfileDto();
            af.setAf_anum(aDto.getA_num());
            af.setAf_imgoriname(imgoriname);
            af.setAf_imgsysname(imgsysname);
            af.setAf_musicoriname(musicoriname);
            af.setAf_musicsysname(musicsysname);

            if (imgoriname != "none.PNG") {
                File file = new File(imgrealPath + imgsysname);
                img_file.transferTo(file);
            }
            if (musicoriname != null) {
                File file = new File(musicrealPath + musicsysname);
                music_file.transferTo(file);
            }
            aDao.insertFile(af);
        } catch (Exception e) {
            return "fail";
        }
        return "true";
    }

    public ModelAndView getArtwork(Integer a_num, HttpSession session) {
        log.info("ArtworkService.getArtwork()");
        mav = new ModelAndView();
        MemberDto mDto = (MemberDto) session.getAttribute("mb");
        String isbought = "false";
        if (mDto != null) {
            if (pDao.confirmbuy(mDto.getMid(), a_num) > 0) {
                isbought = "true";
            }
        }
        session.setAttribute("isbought", isbought);
        ArtworkDto aDto = aDao.getArtwork(a_num);
        ArtfileDto afDto = aDao.selectFiles(a_num);

        String myself = mDao.selectText(aDto.getA_id());

        mav.addObject("aDto", aDto);
        mav.addObject("afDto", afDto);
        mav.addObject("mtext", myself);
        mav.setViewName("artworkdetail");


        return mav;
    }

    public ModelAndView goartwork(SearchDto sDto, HttpSession session) {
        log.info("ArtworkService.goartwork()");
        mav = new ModelAndView();
        switch (sDto.getCategory()) {
            case "vocal":
                break;
            case "composition":
                break;
            case "lyricist":
                break;
            default:
                sDto.setCategory("all");
        }

        switch (sDto.getGenre()) {
            case "KPOP":
                break;
            case "Ballad":
                break;
            case "Indie":
                break;
            case "Rap/Hip-hop":
                break;
            case "POP":
                break;
            default:
                sDto.setGenre("all");
        }

        switch (sDto.getColname()) {
            case "a_title":
                break;
            case "mnick":
                break;
            default:
                sDto.setColname("all");
        }

        switch (sDto.getKeyword()) {
            case "all":
                sDto.setKeyword("");
                break;
        }
        session.setAttribute("sDto", sDto);

        int num = sDto.getPageNum();
        log.info("sDto.getPageNUM() : " + num);
        sDto.setListCnt(lcnt);
        sDto.setPageNum((num - 1) * sDto.getListCnt());
        log.info("sDto.getPageNUM2() : " + num);
        List<ArtworkDto> aList = aDao.selectArtworks(sDto);

        sDto.setPageNum(num);
        String pageHtml = getPaging(sDto);
        mav.addObject("paging", pageHtml);
        session.setAttribute("pageNum", num);
        mav.addObject("aList", aList);
        mav.setViewName("artwork");


        return mav;
    }

    private String getPaging(SearchDto sDto) {
        String pageHtml = null;
        int maxNum = aDao.getArtworkcount(sDto);

        int pageCnt = 5;
        String listName = null;

        listName = "artwork?category=" + sDto.getCategory()
                + "&genre=" + sDto.getGenre() + "&colname=" + sDto.getColname()
                + "&keyword=" + sDto.getKeyword() + "&";

        PagingUtil paging = new PagingUtil(maxNum,
                sDto.getPageNum(),
                sDto.getListCnt(),
                pageCnt, listName);

        pageHtml = paging.makePaging();

        return pageHtml;
    }


    public String UpdateArt(MultipartFile img_file, MultipartFile music_file, ArtworkDto aDto, HttpSession session, RedirectAttributes rttr) {
        log.info("ArtworkService.updateArt()");
        String msg = null;
        String view = null;
        if (aDto.getA_release().equals(null) || aDto.getA_release().equals("")) {
            aDto.setA_release("미정");
        }
        try {
            aDao.UpdateArt(aDto);
            if (img_file.isEmpty() && music_file.isEmpty()) {

            } else {
                deleteupfiles(img_file, music_file, aDto.getA_num(), session);
            }
            fileUpDate(img_file, music_file, session, aDto);
            msg = "수정 성공";
        } catch (Exception e) {
            e.printStackTrace();
            msg = "수정 실패";
        }
        view = "redirect:/artworkdetail?a_num=" + aDto.getA_num();

        rttr.addFlashAttribute("msg", msg);

        return view;
    }

    private void deleteupfiles(MultipartFile imgFile, MultipartFile musicFile, int a_num, HttpSession session) {
        log.info("ArtworkServcie.delteupfiles()");
        ArtfileDto afDto = aDao.selectFiles(a_num);
        String img = afDto.getAf_imgsysname();
        String music = afDto.getAf_musicsysname();
        log.info("music sysname ; " + music);
        if (imgFile.isEmpty()) {

        } else {
            String imgrealpath = session.getServletContext().getRealPath("/") + "upload/image/";
            File imgfile = new File(imgrealpath + img);
            if (imgfile.exists()) {
                imgfile.delete();
            }
        }
        if (musicFile.isEmpty()) {
        } else {
            String musicrealpath = session.getServletContext().getRealPath("/") + "upload/music/";
            File musicfile = new File(musicrealpath + music);
            if (musicfile.exists()) {
                musicfile.delete();
            }
        }
    }

    private String fileUpDate(MultipartFile img_file, MultipartFile music_file, HttpSession session, ArtworkDto aDto) {
        log.info("ArtworkService.fileUpdate()");
        String imgrealPath = session.getServletContext().getRealPath("/") + "upload/image/";
        String musicrealPath = session.getServletContext().getRealPath("/") + "upload/music/";
        String imgoriname = null;
        String musicoriname = null;
        String imgsysname = null;
        String musicsysname = null;
        ArtfileDto af = new ArtfileDto();
        af.setAf_anum(aDto.getA_num());
        try {
            if (!img_file.isEmpty()) {
                imgoriname = img_file.getOriginalFilename();
                File imgfolder = new File(imgrealPath);
                if (imgfolder.isDirectory() == false) {
                    imgfolder.mkdir();
                }
                imgsysname = System.currentTimeMillis() + imgoriname.substring(imgoriname.lastIndexOf(".")); // 저장용 이름
                af.setAf_imgoriname(imgoriname);
                af.setAf_imgsysname(imgsysname);
                if (imgoriname != "none.PNG") {
                    File file = new File(imgrealPath + imgsysname);
                    img_file.transferTo(file);
                }
                aDao.updateimgFile(af);
            }
            if (!music_file.isEmpty()) {
                musicoriname = music_file.getOriginalFilename();
                File musicfolder = new File(musicrealPath);
                if (musicfolder.isDirectory() == false) {
                    musicfolder.mkdir();
                }
                musicsysname = System.currentTimeMillis() + musicoriname.substring(musicoriname.lastIndexOf(".")); // 저장용 이름
                af.setAf_musicoriname(musicoriname);
                af.setAf_musicsysname(musicsysname);
                if (musicoriname != null) {
                    File file = new File(musicrealPath + musicsysname);
                    music_file.transferTo(file);
                }
                aDao.updatemusicFile(af);
            }
        } catch (Exception e) {
            return "fail";
        }
        return "true";
    }

    public String DeleteArtwork(Integer a_num, HttpSession session, RedirectAttributes rttr) {
        log.info("ArtworkService.DeleteArtwork()");
        String view = null;
        String msg = null;
        String page = (String) session.getAttribute("page");
        int pageNum = (int) session.getAttribute("pageNum");
        MemberDto mDto = (MemberDto) session.getAttribute("mb");
        SearchDto sDto = (SearchDto) session.getAttribute("sDto");
        try {
            if (pDao.countPayment(a_num) > 0) {
                aDao.setdel(a_num);
            } else {
                deletefiles(a_num, session);
                aDao.deleteFile(a_num);
                aDao.deleteArtwork(a_num);
                mDao.disupdateMemberPoint(mDto);
            }
            msg = "삭제 성공";
            if (page.equals("artwork")) {
                view = "redirect:/profile?page=" + page + "&category=" + sDto.getCategory() + "&genre=" + sDto.getGenre() + "&pageNum=" + pageNum;
            } else {
                view = "redirect:/artwork?category=" + sDto.getCategory() + "&genre=" + sDto.getGenre() + "&colname=" + sDto.getColname() + "&keyword=" + sDto.getKeyword() + "&pageNum=" + pageNum;
            }

        } catch (Exception e){
            msg = "삭제 실패";
            view = "redirect:/artworkdetail?a_num=" + a_num;
        }
        rttr.addFlashAttribute("msg",msg);

        return view;
    }

    private void deletefiles(Integer a_num, HttpSession session) {
        log.info("ArtworkService.deletefiles()");

        ArtfileDto afDto = aDao.selectFiles(a_num);
        String img = afDto.getAf_imgsysname();
        String music = afDto.getAf_musicsysname();
        log.info("music sysname ; " + music);
        if (img == null && music == null) {

        } else {
            if (img != null) {
                String imgrealpath = session.getServletContext().getRealPath("/") + "upload/image/";
                File imgfile = new File(imgrealpath + img);
                if (imgfile.exists()) {
                    imgfile.delete();
                }
            }
            if (music != null) {
                String musicrealpath = session.getServletContext().getRealPath("/") + "upload/music/";
                File musicfile = new File(musicrealpath + music);
                if (musicfile.exists()) {
                    musicfile.delete();
                }
            }
        }
    }

    public ModelAndView getArtworkInfo(Integer a_num) {
        mav = new ModelAndView();

        ArtworkDto aDto = aDao.getArtwork(a_num);
        ArtfileDto afDto = aDao.selectFiles(a_num);

        String myself = mDao.selectText(aDto.getA_id());

        mav.addObject("aDto", aDto);
        mav.addObject("afDto", afDto);
        mav.addObject("mtext", myself);
        mav.setViewName("artworkupdate");


        return mav;
    }
}
