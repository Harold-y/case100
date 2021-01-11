package org.yye.service;

import org.apache.ibatis.annotations.Delete;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.yye.dao.mapper.StuCollegeMapper;
import org.yye.entity.StuCollege;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;

@Service
public class StuCollegeService {
    @Resource
    StuCollegeMapper stuCollegeMapper;

    //@Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)

    public List<LinkedHashMap> selectStuCollegeByStuId(Integer stuId)
    {
        return stuCollegeMapper.selectStuCollegeByStuId(stuId);
    }
    public String selectStuCollegeEssay(Integer stucollegeid)
    {
        return stuCollegeMapper.selectStuCollegeEssay(stucollegeid);
    }

    public LinkedHashMap selectScore(Integer stuExamSubId)
    {
        return stuCollegeMapper.selectScore(stuExamSubId);
    }
    public String selectStuCollegeScoreString(Integer stucollegeid)
    {
        return stuCollegeMapper.selectStuCollegeScoreString(stucollegeid);
    }
    /*public List<LinkedHashMap> selectDetails(Integer stuCollegeId)
    {
        return stuCollegeMapper.selectDetails(stuCollegeId);
    }*/
    public int selectStuIdByStuCollegeId(Integer stuCollegeId)
    {
        return stuCollegeMapper.selectStuIdByStuCollegeId(stuCollegeId);
    }
    public StuCollege selectByPrimaryKey1(Integer stucollegeid)
    {
        return stuCollegeMapper.selectByPrimaryKey1(stucollegeid);
    }
    public int selectCollegeIdByStuCollegeId(Integer stuCollegeId)
    {
        return stuCollegeMapper.selectCollegeIdByStuCollegeId(stuCollegeId);
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int insertSelective(StuCollege stuCollege)
    {
        return stuCollegeMapper.insertSelective(stuCollege);
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int insertIntoStuCollegeCollection(Integer stuId,Integer stuCollegeId)
    {
        return stuCollegeMapper.insertIntoStuCollegeCollection(stuId,stuCollegeId);
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int deleteStuCollegeCollectionById(Integer stuId,Integer stuCollegeId)
    {
        return stuCollegeMapper.deleteStuCollegeCollectionById(stuId,stuCollegeId);
    }

    public LinkedHashMap selectStuCollegeCollectionByCondition(Integer stuId,Integer stuCollegeId)
    {
        return stuCollegeMapper.selectStuCollegeCollectionByCondition(stuId,stuCollegeId);
    }
    public List<LinkedHashMap> selectStuCollegeCollectionByStuId(Integer stuId)
    {
        return stuCollegeMapper.selectStuCollegeCollectionByStuId(stuId);
    }
    public LinkedHashMap selectCollectionInfoByStuCollegeId(Integer stuCollegeId)
    {
        return stuCollegeMapper.selectCollectionInfoByStuCollegeId(stuCollegeId);
    }
    public List<LinkedHashMap> selectStudentOfferByCollegeId(Integer collegeId)
    {
        return stuCollegeMapper.selectStudentOfferByCollegeId(collegeId);
    }
    public LinkedHashMap selectStuCollegeByStuCollegeId(String stuCollegeId)
    {
        return stuCollegeMapper.selectStuCollegeByStuCollegeId(stuCollegeId);
    }
}
