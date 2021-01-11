package org.yye.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Controller;
import org.springframework.util.ClassUtils;
import org.springframework.util.ResourceUtils;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.yye.entity.College;
import org.yye.service.CollegeService;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import java.io.File;
import java.io.IOException;
import java.util.LinkedHashMap;
import java.util.List;

@Controller
@RequestMapping("college")
public class CollegeController {
    @Autowired
    CollegeService collegeService;

    //@Value("${server.tomcat.basedir}")
    //private String systemPath;

    @RequestMapping("selectPanel")
    @ResponseBody
    public List selectPanel()
    {
        return collegeService.selectPanel();
    }

    @RequestMapping("selectByName")
    @ResponseBody
    public List selectByName(String collegename)
    {
        return collegeService.selectCollegeByName(collegename);
    }

    @RequestMapping("selectByName_Count")
    @ResponseBody
    public int selectCollegeByName_Count(String collegename)
    {
        return collegeService.selectCollegeByName_Count(collegename);
    }

    @RequestMapping("delete")
    @ResponseBody
    public int delete(int collegeid)
    {
        return collegeService.delete(collegeid);
    }

    @RequestMapping("insert")
    @ResponseBody
    public int insert(HttpServletRequest request, @RequestParam("collegeId")String collegeId,
                      @RequestParam("collegeName")String collegename, @RequestParam("collegeChineseName")String collegeChineseName,
                      @RequestParam("collegeArea")String collegearea, @RequestParam("collegeTuition")String collegetuition,
                      @RequestParam("collegeExpense")String collegeexpense,
                      @RequestParam("collegeAcceptanceRate")String collegeacceptancerate, @RequestParam("collegeCampSize")String collegecampsize,
                      @RequestParam("collegeMenWomanRadio")String collegemenwomanradio,
                      @RequestParam("collegeEarlyDecision")String collegeearlydecision,
                      @RequestParam("collegeRegularDecision")String collegeregulardecision,
                      @RequestParam("collegeIntroduction")String collegeintroduction,
                      @RequestParam("collegeAvgFreshmanRetention")String collegeavgfreshmanretention,
                      @RequestParam("collegeEarlyAction")String collegeearlyaction,@RequestParam("collegeStudentCount")String collegestudentcount,
                      @RequestParam("collegeTeacherStudentRatio")String collegeteacherstudentratio,@RequestParam("collegeAdvanSubject")String collegeadvansubject,
                      @RequestParam("collegeIsPublic")String collegeispublic,@RequestParam("collegeCity")String collegecity,
                      @RequestParam("collegeInternationalStuCount")String collegeinternationalstucount,@RequestParam("collegeAudition")String collegeaudition,
                      @RequestParam("collegeStuFeeling")String collegestufeeling,@RequestParam("collegeFuture")String collegefuture,
                      @RequestParam("college_img") MultipartFile college_img) throws IOException {
        //Windows Upload
        //String path = request.getSession().getServletContext().getRealPath("/static/img/college/");
        // String path= ClassUtils.getDefaultClassLoader().getResource("static/img/college/").getPath();

        //Linux Upload
        //String realPath =(systemPath.endsWith(File.separator)?systemPath:(systemPath + File.separator))+request.getParameter("target");
        String path = "/www/wwwroot/yeyixuan.top/wp-content/uploads/stuInfo/";

        //定义上传文件的路径
        File file=new File(path);
        if(!file.exists()){
            file.mkdir();
        }
        //String filename = college_img.getOriginalFilename();
        college_img.transferTo(new File(path,collegename+".jpg"));

        int collegeisp = Integer.parseInt(collegeispublic);
        College collge = new College(null,collegename,collegeChineseName,collegearea,collegetuition,collegeexpense,
                collegeacceptancerate,collegecampsize,collegemenwomanradio,collegeearlydecision,
                collegeregulardecision,collegeavgfreshmanretention,collegeintroduction,collegeearlyaction,
                collegestudentcount,collegeteacherstudentratio,collegeadvansubject,collegeisp,
                collegecity,collegeinternationalstucount,collegeaudition,collegestufeeling,collegefuture);
        return collegeService.insertCollege(collge);
    }
    @RequestMapping("selectById")
    @ResponseBody
    public College selectCollegeById(int collegeid)
    {
        return collegeService.selectCollegeById(collegeid);
    }

    @RequestMapping("selectCollegeAll")
    @ResponseBody
    public List<College> selectCollegeAll()
    {
        return collegeService.selectCollegeAll();
    }


    @RequestMapping("update")
    @ResponseBody
    public int update(College college)
    {
        return collegeService.updateCollege(college);
    }

    @RequestMapping("changeIMG")
    @ResponseBody
    public int changeIMG(@RequestParam("collegeId")int collegeId,HttpServletRequest request,
                         @RequestParam("college_img") MultipartFile college_img) throws IOException {
        College college = collegeService.selectCollegeById(collegeId);
        String collegename = college.getCollegename();
        //Windows Upload
        //String path = request.getSession().getServletContext().getRealPath("/static/img/college/");
        //String path= ClassUtils.getDefaultClassLoader().getResource("static/img/college/").getPath();

        //Linux Upload
        //String realPath =(systemPath.endsWith(File.separator)?systemPath:(systemPath + File.separator))+request.getParameter("target");
        String path = "/www/wwwroot/yeyixuan.top/wp-content/uploads/college/";
        File file=new File(path);
        if(!file.exists()){
            file.mkdir();
        }
        //String filename = college_img.getOriginalFilename();
        college_img.transferTo(new File(path,collegename+".jpg"));
        return 0;
    }
    @RequestMapping("selectCountCollegeAll")
    @ResponseBody
    public int selectCountCollegeAll()
    {
        return collegeService.selectCountCollegeAll();
    }

    @RequestMapping("selectCollegeInfoAll")
    @ResponseBody
    public List<LinkedHashMap> selectCollegeInfoAll(String rankingYear, int starter, int limit)
    {
        return collegeService.selectCollegeInfoAll(rankingYear,starter,limit+1);
    }
    @RequestMapping("selectCollegeInfoByCollegeName")
    @ResponseBody
    public  List<LinkedHashMap> selectCollegeInfoByCollegeName(String rankingYear,String collegeName,String collegeArea)
    {
        return collegeService.selectCollegeInfoByCollegeName(rankingYear,collegeName,collegeArea);
    }

    @RequestMapping("selectOfferInfo")
    @ResponseBody
    public LinkedHashMap selectOfferInfo(Integer collegeid)
    {
        return collegeService.selectOfferInfo(collegeid);
    }
}
