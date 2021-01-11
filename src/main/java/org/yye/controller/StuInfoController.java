package org.yye.controller;

import org.springframework.stereotype.Controller;
import org.springframework.util.ClassUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.yye.entity.*;
import org.yye.service.StuInfoService;
import org.yye.util.AESUtils;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.IOException;
import java.sql.Date;
import java.util.*;

@Controller
@RequestMapping("stuInfo")
public class StuInfoController {
    @Resource
    StuInfoService stuInfoService;

    @RequestMapping("selectAll")
    @ResponseBody
    public List selectAll(){
        return stuInfoService.selectAll();
    }

    @RequestMapping("insert")
    @ResponseBody
    public int insertIntoStuInfo(StuInfo record){
        String uuid = UUID.randomUUID().toString();
        record.setStucaseid(uuid);
        String encrypted = AESUtils.aesEncryptStr(record.getStupassword(), AESUtils.getPkey());
        record.setStupassword(encrypted);
        return stuInfoService.insertIntoStuInfo(record);
    }

    @RequestMapping("checkEmailUsed")
    @ResponseBody
    public Boolean checkEmailUsed(String stuemail){
        int used = stuInfoService.checkEmailUsed(stuemail);
        if(used == 1)
        {
            return true;
        }
        return false;
    }

    @RequestMapping("StuInfoLogin")
    @ResponseBody
    public Boolean StuInfoLogin(String stuemail,String stupassword,HttpSession session)
    {
        String encrypted = AESUtils.aesEncryptStr(stupassword, AESUtils.getPkey());
        int checked = stuInfoService.StuInfoLogin(stuemail,encrypted);
        if(checked == 1)
        {
            Map map1 = selectStuInfoGeneralInfo(stuemail,encrypted);
            String username = (String)map1.get("stuUsername");
            Integer stuId = (Integer)map1.get("stuId");
            session.setAttribute("stuUsername",username);
            session.setAttribute("stuId",stuId);
            return true;
        }
        return false;
    }

    public Map selectStuInfoGeneralInfo(String stuemail, String stupassword)
    {
        return stuInfoService.selectStuInfoGeneralInfo(stuemail,stupassword);
    }

    @RequestMapping("removeSession")
    @ResponseBody
    public int removeSession(HttpSession session)
    {
        session.invalidate();
        return 1;
    }

    @RequestMapping("selectById")
    @ResponseBody
    public StuInfo selectById(HttpSession session) throws Exception {
        Integer stuId = (Integer)session.getAttribute("stuId");
        StuInfo info = stuInfoService.selectStuInfoById(stuId);
        String password = AESUtils.aesDecodeStr(info.getStupassword(), AESUtils.getPkey());
        info.setStupassword(password);
        return info;
    }
    @RequestMapping("updateByPrimaryKey")
    @ResponseBody
    public int updateByPrimaryKeySelective(StuInfo record,HttpSession session)
    {
        Integer stuId = (Integer)session.getAttribute("stuId");
        record.setStuid(stuId);
        String password = AESUtils.aesEncryptStr(record.getStupassword(), AESUtils.getPkey());
        record.setStupassword(password);
        return stuInfoService.updateByPrimaryKeySelective(record);
    }
    @RequestMapping("selectStuScoreByStuId")
    @ResponseBody
    public List<LinkedHashMap> selectStuScoreByStuId(HttpSession session)
    {
        Integer stuId = (Integer)session.getAttribute("stuId");
        return stuInfoService.selectStuScoreByStuId(stuId);
    }
    @RequestMapping("selectStuScoreByStuId_R")
    @ResponseBody
    public List<LinkedHashMap> selectStuScoreByStuId_R(Integer stuId)
    {
        return stuInfoService.selectStuScoreByStuId(stuId);
    }
    @RequestMapping("selectStuScoreByStuId_Edit")
    @ResponseBody
    public LinkedHashMap selectStuScoreByStuId_Edit(HttpSession session,String stuExamSubId1)
    {
        Integer stuId = (Integer)session.getAttribute("stuId");
        Integer stuExamSubId = Integer.parseInt(stuExamSubId1);
        return stuInfoService.selectStuScoreByStuId_Edit(stuId,stuExamSubId);
    }



    @RequestMapping("updateStuInfoImg")
    @ResponseBody
    public int updateStuInfoImg(HttpSession session, MultipartFile stuInfoImg, HttpServletRequest request) throws IOException {
        Integer stuId = (Integer)session.getAttribute("stuId");
        //Windows Upload
        //String path = request.getSession().getServletContext().getRealPath("/static/img/stuInfo/");
        //String path= ClassUtils.getDefaultClassLoader().getResource("static/img/stuInfo/").getPath();

        //Linux Upload
        //String realPath =(systemPath.endsWith(File.separator)?systemPath:(systemPath + File.separator))+request.getParameter("target");
        String path = "/www/wwwroot/yeyixuan.top/wp-content/uploads/stuInfo/";
        /*String path;
        String tomcat_path = System.getProperty("user.dir");
        //获取tomcat中项目同级路径
        String bin_path = tomcat_path.substring(tomcat_path.lastIndexOf("/") + 1, tomcat_path.length());
        if (("bin").equals(bin_path)) {
            path = tomcat_path.substring(0, System.getProperty("user.dir").lastIndexOf("/")) + "/webapps" + "/static" + "/img"+"/stuInfo/";
        } else {
            path = tomcat_path + "/webapps" + "/static" + "/img"+"/stuInfo/";
        }*/

        File file=new File(path);
        if(!file.exists()){
            file.mkdir();
        }
        //String filename = college_img.getOriginalFilename();
        stuInfoImg.transferTo(new File(path,stuId+".jpg"));
        return 0;
    }
    @RequestMapping("updateStuExamSub")
    @ResponseBody
    public int updateStuExamSub(StuExamSub record)
    {
        return stuInfoService.updateStuExamSub(record);
    }
    @RequestMapping("selectSub")
    @ResponseBody
    public List<ExamSub> selectSub(String examid)
    {
        Integer examid1 = Integer.parseInt(examid);
        return stuInfoService.selectSub(examid1);
    }
    @RequestMapping("insertIntostuExamSub")
    @ResponseBody
    public  int insertIntostuExamSub(HttpSession session, String examsubid, String stuexamsubscore, Date testdate)
    {
        Integer stuId = (Integer)session.getAttribute("stuId");
        Integer examsubid1 = Integer.parseInt(examsubid);
        StuExamSub record = new StuExamSub(stuId,examsubid1,stuexamsubscore,testdate,null);
        return stuInfoService.insertIntostuExamSub(record);
    }
    @RequestMapping("selectActivityByStuId")
    @ResponseBody
    public List<Activity> selectActivityByStuId(HttpSession session)
    {
        Integer stuId = (Integer)session.getAttribute("stuId");
        return stuInfoService.selectActivityByStuId(stuId);
    }

    @RequestMapping("selectActivityByStuId_R")
    @ResponseBody
    public List<Activity> selectActivityByStuId(Integer stuId)
    {
        return stuInfoService.selectActivityByStuId(stuId);
    }
    @RequestMapping("selectActivityByActivityId")
    @ResponseBody
    public Activity selectActivityByActivityId(String activityid)
    {
        Integer activityid2 = Integer.parseInt(activityid);
        return stuInfoService.selectActivityByActivityId(activityid2);
    }
    @RequestMapping("updateActivity")
    @ResponseBody
    public int updateActivity(Activity record)
    {
        return stuInfoService.updateActivity(record);
    }
    @RequestMapping("insertIntoActivity")
    @ResponseBody
    public int insertIntoActivity(Activity record,HttpSession session)
    {
        Integer stuid = (Integer)session.getAttribute("stuId");
        record.setStuid(stuid);
        return stuInfoService.insertIntoActivity(record);
    }
    @RequestMapping("selectStuInfoByStuId")
    @ResponseBody
    public StuInfo selectStuInfoByStuId(Integer stuId)
    {
        return stuInfoService.selectStuInfoByStuId(stuId);
    }

    @RequestMapping("selectExamGenreAll")
    @ResponseBody
    public List<ExamGenre> selectExamGenreAll()
    {
        return stuInfoService.selectExamGenreAll();
    }
}
