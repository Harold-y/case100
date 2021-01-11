package org.yye.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yye.entity.StuCollege;
import org.yye.service.StuCollegeService;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;

@Controller
@RequestMapping("stuCollege")
public class StuCollegeController {
    @Resource
    StuCollegeService stuCollegeService;

    @RequestMapping("selectStuCollegeByStuId")
    @ResponseBody
    public List<LinkedHashMap> selectStuCollegeByStuId(HttpSession session)
    {
        Integer stuId = (Integer)session.getAttribute("stuId");
        return stuCollegeService.selectStuCollegeByStuId(stuId);
    }
    @RequestMapping("selectStuCollegeEssay")
    @ResponseBody
    public String selectStuCollegeEssay(String stucollegeid)
    {
        Integer stucollegeid1 = Integer.parseInt(stucollegeid);
        return stuCollegeService.selectStuCollegeEssay(stucollegeid1);
    }

    @RequestMapping("selectScore")
    @ResponseBody
    public List<LinkedHashMap> selectScore(String stucollegeid)
    {
        String stuCollegeScoreId = selectStuCollegeScoreString(Integer.parseInt(stucollegeid));
        String[] listOfScores = stuCollegeScoreId.split("-");
        List returnList = new ArrayList();
        for(String item:listOfScores)
        {
            LinkedHashMap map = stuCollegeService.selectScore(Integer.parseInt(item));
            returnList.add(map);
        }
        return returnList;
    }
    @RequestMapping("selectStuCollegeScoreString")
    @ResponseBody
    public String selectStuCollegeScoreString(Integer stucollegeid)
    {
        return stuCollegeService.selectStuCollegeScoreString(stucollegeid);
    }
    /*@RequestMapping("selectDetails")
    @ResponseBody
    public List<LinkedHashMap> selectDetails(String stuCollegeId)
    {
        return stuCollegeService.selectDetails(Integer.parseInt(stuCollegeId));
    }*/
    @RequestMapping("selectStuIdByStuCollegeId")
    @ResponseBody
    public int selectStuIdByStuCollegeId(String stuCollegeId)
    {
        return stuCollegeService.selectStuIdByStuCollegeId(Integer.parseInt(stuCollegeId));
        //return stuCollegeService.selectStuIdByStuCollegeId(stuCollegeId);
    }
    @RequestMapping("selectByPrimaryKey")
    @ResponseBody
    public StuCollege selectByPrimaryKey(Integer stuCollegeId)
    {
        return stuCollegeService.selectByPrimaryKey1(stuCollegeId);
    }
    @RequestMapping("selectCollegeIdByStuCollegeId")
    @ResponseBody
    public int selectCollegeIdByStuCollegeId(String stuCollegeId)
    {
        return stuCollegeService.selectCollegeIdByStuCollegeId(Integer.parseInt(stuCollegeId));
    }
    @RequestMapping("insertIntoStuCollegeSelective")
    @ResponseBody
    public int insertIntoStuCollegeSelective(StuCollege record,HttpSession session)
    {
        Integer stuId = (Integer)session.getAttribute("stuId");
        record.setStuid(stuId);
        return stuCollegeService.insertSelective(record);
    }
    @RequestMapping("insertIntoStuCollegeCollection")
    @ResponseBody
    public int insertIntoStuCollegeCollection(Integer stuId,Integer stuCollegeId)
    {
        return stuCollegeService.insertIntoStuCollegeCollection(stuId,stuCollegeId);
    }
    @RequestMapping("deleteStuCollegeCollectionById")
    @ResponseBody
    public int deleteStuCollegeCollectionById(Integer stuId,Integer stuCollegeId)
    {
        return stuCollegeService.deleteStuCollegeCollectionById(stuId,stuCollegeId);
    }
    @RequestMapping("selectStuCollegeCollectionByCondition")
    @ResponseBody
    public LinkedHashMap selectStuCollegeCollectionByCondition(HttpSession session,Integer stuCollegeId)
    {
        Integer stuId = (Integer)session.getAttribute("stuId");
        return stuCollegeService.selectStuCollegeCollectionByCondition(stuId,stuCollegeId);
    }
    @RequestMapping("selectStuCollegeCollectionByStuId")
    @ResponseBody
    public List selectStuCollegeCollectionByStuId(HttpSession session)
    {
        Integer stuId = (Integer)session.getAttribute("stuId");
        List<LinkedHashMap> getList = stuCollegeService.selectStuCollegeCollectionByStuId(stuId);
        List<Integer> stuCollegeIdList = new ArrayList();
        List returnList = new ArrayList<>();
        for(LinkedHashMap im:getList)
        {
            int stuCollegeId = (Integer)im.get("stuCollegeId");
            stuCollegeIdList.add(stuCollegeId);
        }
        for(Integer stuCollegeId : stuCollegeIdList)
        {
            LinkedHashMap infoMap = selectCollectionInfoByStuCollegeId(stuCollegeId);
            List<LinkedHashMap> infoList = selectScore(String.valueOf(stuCollegeId));
            LinkedHashMap score1 = null;
            if(infoList.size()>0)
            {
                score1 = infoList.get(0);
            }
            List info = new ArrayList();
            info.add(infoMap);
            info.add(score1);
            returnList.add(info);
        }
        //Dangerous
        /*System.out.println(returnList);*/
        return returnList;
    }
    public LinkedHashMap selectCollectionInfoByStuCollegeId(Integer stuCollegeId)
    {
        return stuCollegeService.selectCollectionInfoByStuCollegeId(stuCollegeId);
    }
    @RequestMapping("selectStudentOfferByCollegeId")
    @ResponseBody
    public List<LinkedHashMap> selectStudentOfferByCollegeId(Integer collegeId)
    {
        List<LinkedHashMap> getList = stuCollegeService.selectStudentOfferByCollegeId(collegeId);
        for(LinkedHashMap lm:getList)
        {
            String[] scores = String.valueOf(lm.get("stuCollegeScoreId")).split("-");
            String firstScore = "Null";
            if(scores.length>=0)
            {
                firstScore = scores[0];
                LinkedHashMap scoreMapFirst = stuCollegeService.selectScore(Integer.parseInt(firstScore));
                lm.put("score",scoreMapFirst);
            }

        }
        return getList;
    }

    @RequestMapping("selectStuCollegeByStuCollegeId")
    @ResponseBody
    public List<LinkedHashMap> selectStuCollegeByStuCollegeId(String stuCollegeIdList)
    {
        String[] realstuCollegeIdList = stuCollegeIdList.split("-");
        List<LinkedHashMap> getList = new ArrayList<>();
        for(String stuCollegeId:realstuCollegeIdList)
        {
            LinkedHashMap addMap = stuCollegeService.selectStuCollegeByStuCollegeId(stuCollegeId);
            getList.add(addMap);
        }
        List<Integer> stuCollegeIdList2 = new ArrayList();
        List returnList = new ArrayList<>();
        for(LinkedHashMap im:getList)
        {
            int stuCollegeId = (Integer)im.get("stuCollegeId");
            stuCollegeIdList2.add(stuCollegeId);
        }
        for(Integer stuCollegeId2 : stuCollegeIdList2)
        {
            LinkedHashMap infoMap = selectCollectionInfoByStuCollegeId(stuCollegeId2);
            List<LinkedHashMap> infoList = selectScore(String.valueOf(stuCollegeId2));
            LinkedHashMap score1 = null;
            if(infoList.size()>0)
            {
                score1 = infoList.get(0);
            }
            List info = new ArrayList();
            info.add(infoMap);
            info.add(score1);
            returnList.add(info);
        }
        //Dangerous
        /*System.out.println(returnList);*/
        return returnList;
    }
}
