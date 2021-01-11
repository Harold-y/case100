package org.yye.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Isolation;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import org.yye.dao.mapper.CollegeMapper;
import org.yye.entity.College;

import javax.annotation.Resource;
import java.util.LinkedHashMap;
import java.util.List;

@Service
public class CollegeService{
    @Autowired
    CollegeMapper collegeMapper;

    public List<College> selectPanel()
    {
        return collegeMapper.selectPanel();
    }
    public List<College> selectCollegeByName(String collegename)
    {
        return collegeMapper.selectCollegeByName(collegename);
    }
    public int selectCollegeByName_Count(String collegename)
    {
        return collegeMapper.selectCollegeByName_Count(collegename);
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int delete(int collegeid)
    {
        return collegeMapper.deleteCollegeByPrimaryKey(collegeid);
    }

    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int insertCollege(College college)
    {
        return collegeMapper.insertCollege(college);
    }

    public College selectCollegeById(int collegeid)
    {
        return collegeMapper.selectById(collegeid);
    }
    @Transactional(isolation = Isolation.DEFAULT,propagation = Propagation.REQUIRED)
    public int updateCollege(College college)
    {
        return collegeMapper.updateCollege(college);
    }

    public List<College> selectCollegeAll()
    {
        return collegeMapper.selectCollegeAll();
    }

    public int selectCountCollegeAll()
    {
        return collegeMapper.selectCountCollegeAll();
    }
    public List<LinkedHashMap> selectCollegeInfoAll(String rankingYear, int starter, int limit)
    {
        return collegeMapper.selectCollegeInfoAll(rankingYear,starter,limit);
    }

    public  List<LinkedHashMap> selectCollegeInfoByCollegeName(String rankingYear,String collegeName,String collegeArea)
    {
        return collegeMapper.selectCollegeInfoByCollegeName(rankingYear,collegeName,collegeArea);
    }

    public LinkedHashMap selectOfferInfo(Integer collegeid)
    {
        return collegeMapper.selectOfferInfo(collegeid);
    }
}
