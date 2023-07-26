package com.lime.limetest.service;

import com.lime.limetest.dao.MemberDao;
import com.lime.limetest.dao.MessageDao;
import com.lime.limetest.dto.MessageDto;
import jakarta.servlet.http.HttpSession;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import java.io.File;

@Service
@Slf4j
public class MessageService {
    @Autowired
    private MessageDao mesDao;

    @Autowired
    private MemberDao mDao;

    public String InsertMessage(MultipartFile file, MessageDto mDto, HttpSession session, RedirectAttributes rttr) {
        log.info("MessageService.InsertMessage()");
        String res = null;
        String rmid = null;
        if (mDao.selectId(mDto.getM_rmid())==null){
            res = "보내는 사람을 확인해주세요.";
            session.setAttribute("result",res);
            session.setAttribute("pages","result");

            return "popup";
        } else{
            rmid = mDao.selectId(mDto.getM_rmid());
            mDto.setM_rmid(rmid);
        }

        if (!file.isEmpty()){
            try {
                String realPath = session.getServletContext().getRealPath("/") + "upload/message/";
                String oriname = file.getOriginalFilename();
                File folder = new File(realPath);
                if (folder.isDirectory() == false){
                    folder.mkdir();
                }
                String sysname = System.currentTimeMillis() + oriname.substring(oriname.lastIndexOf("."));
                File filed = new File(realPath + sysname);
                file.transferTo(filed);
                mDto.setM_fileoriname(oriname);
                mDto.setM_filesysname(sysname);
                res = "메시지 전송 완료";
                mesDao.insertMessage(mDto);
            } catch (Exception e){
                e.printStackTrace();
                res = "메시지 전송 실패";
                return res;
            }
        } else {
            mesDao.insertMessage(mDto);
            res ="메시지 전송 완료";
        }
        session.setAttribute("result",res);
        session.setAttribute("pages","result");
        return "popup";
    }
}
