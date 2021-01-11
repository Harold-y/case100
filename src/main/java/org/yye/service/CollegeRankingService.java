package org.yye.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.yye.dao.mapper.CollegeRankingMapper;
import org.yye.entity.College;
import org.yye.entity.CollegeRanking;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class CollegeRankingService {
    @Autowired
    CollegeRankingMapper collegeRankingMapper;

    public List<College> selectCollegeRankingByName(String collegeName)
    {
        return collegeRankingMapper.selectCollegeRankingByName(collegeName);
    }
    public CollegeRanking selectCollegeRankingByCollegeId_rk(int collegeid,int rankingYear)
    {
        return collegeRankingMapper.selectCollegeRankingByCollegeId_rk(collegeid,rankingYear);
    }
    public List<LinkedHashMap> selectCollegeRankingAll()
    {
        return collegeRankingMapper.selectCollegeRankingAll();
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int insertCollegeRanking(CollegeRanking collegeRanking)
    {
        return collegeRankingMapper.insertCollegeRanking(collegeRanking);
    }

    public List<CollegeRanking> selectCollegeRankingAllByCollegeId(int collegeid)
    {
        return collegeRankingMapper.selectCollegeRankingAllByCollegeId(collegeid);
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int deleteRankingByRankingId(int rankingId)
    {
        return collegeRankingMapper.deleteRankingByRankingId(rankingId);
    }

    public int selectCollegeRankingByIdAndYear_Count(int collegeid,String year)
    {
        return collegeRankingMapper.selectCollegeRankingByIdAndYear_Count(collegeid,year);
    }
}
