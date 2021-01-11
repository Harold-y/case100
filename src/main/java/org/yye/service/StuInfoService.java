package org.yye.service;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.yye.dao.mapper.StuInfoMapper;
import org.yye.entity.*;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Service
public class StuInfoService {
    @Resource
    StuInfoMapper stuInfoMapper;

    public List<StuInfo> selectAll()
    {
        return stuInfoMapper.selectAll();
    }

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int insertIntoStuInfo(StuInfo record)
    {
        return stuInfoMapper.insertIntoStuInfo(record);
    }

    public int checkEmailUsed(String stuemail)
    {
        return stuInfoMapper.checkEmailUsed(stuemail);
    }

    public int StuInfoLogin(String stuemail,String stupassword)
    {
        return stuInfoMapper.StuInfoLogin(stuemail,stupassword);
    }
    public Map selectStuInfoGeneralInfo(String stuemail, String stupassword)
    {
        return stuInfoMapper.selectStuInfoGeneralInfo(stuemail,stupassword);
    }
    public StuInfo selectStuInfoById(Integer stuId)
    {
        return stuInfoMapper.selectStuInfoById(stuId);
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int updateByPrimaryKeySelective(StuInfo record)
    {

        return stuInfoMapper.updateByPrimaryKeySelective(record);
    }

    public List<LinkedHashMap> selectStuScoreByStuId(Integer stuId)
    {
        return stuInfoMapper.selectStuScoreByStuId(stuId);
    }
    public LinkedHashMap selectStuScoreByStuId_Edit(Integer stuId,Integer stuExamSubId)
    {
        return stuInfoMapper.selectStuScoreByStuId_Edit(stuId,stuExamSubId);
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int updateStuExamSub(StuExamSub record)
    {
        return stuInfoMapper.updateStuExamSub(record);
    }

    public List<ExamSub> selectSub(Integer examid)
    {
        return stuInfoMapper.selectSub(examid);
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public  int insertIntostuExamSub(StuExamSub record)
    {
        return stuInfoMapper.insertIntostuExamSub(record);
    }

    public List<Activity> selectActivityByStuId(Integer stuId)
    {
        return stuInfoMapper.selectActivityByStuId(stuId);
    }
    public Activity selectActivityByActivityId(Integer activityid)
    {
        return stuInfoMapper.selectActivityByActivityId(activityid);
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int updateActivity(Activity record)
    {
        return stuInfoMapper.updateActivity(record);
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int insertIntoActivity(Activity record)
    {
        return stuInfoMapper.insertIntoActivity(record);
    }

    public StuInfo selectStuInfoByStuId(Integer stuId)
    {
        return stuInfoMapper.selectStuInfoByStuId(stuId);
    }
    public List<ExamGenre> selectExamGenreAll()
    {
        return stuInfoMapper.selectExamGenreAll();
    }
}
