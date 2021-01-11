package org.yye.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.yye.entity.College;
import org.yye.entity.CollegeRanking;
import org.yye.service.CollegeRankingService;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Controller
@RequestMapping("collegeranking")
public class CollegeRankingController {
    @Autowired
    CollegeRankingService collegeRankingService;

    @RequestMapping("selectByName")
    @ResponseBody
    public List<College> selectCollegeRankingByName(String collegeName)
    {
        return collegeRankingService.selectCollegeRankingByName(collegeName);
    }

    @RequestMapping("selectAll")
    @ResponseBody
    public List<LinkedHashMap> selectAll()
    {
        return collegeRankingService.selectCollegeRankingAll();
    }

    @RequestMapping("insert")
    @ResponseBody
    public int insert(CollegeRanking collegeRanking)
    {
        return collegeRankingService.insertCollegeRanking(collegeRanking);
    }

    @RequestMapping("selectByCollegeId")
    @ResponseBody
    public List<CollegeRanking> selectByCollegeId(String collegeId)
    {
        int collegeId2 = Integer.parseInt(collegeId);
        return collegeRankingService.selectCollegeRankingAllByCollegeId(collegeId2);
    }
    @RequestMapping("selectByCollegeId_rk")
    @ResponseBody
    public CollegeRanking selectCollegeRankingByCollegeId_rk(int collegeid,int rankingYear)
    {
        return collegeRankingService.selectCollegeRankingByCollegeId_rk(collegeid,rankingYear);
    }

    @RequestMapping("deleteRankingByRankingId")
    @ResponseBody
    public int deleteRankingByRankingId(String rankingId)
    {
        int rankingId2 = Integer.parseInt(rankingId);
        return collegeRankingService.deleteRankingByRankingId(rankingId2);
    }
    @RequestMapping("selectCollegeRankingByIdAndYear_Count")
    @ResponseBody
    public int selectCollegeRankingByIdAndYear_Count(String collegeid,String year)
    {
        int collegeId2 = Integer.parseInt(collegeid);
        return collegeRankingService.selectCollegeRankingByIdAndYear_Count(collegeId2,year);
    }
}
