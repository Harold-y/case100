package org.yye.dao.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.yye.entity.ExamSub;

import java.util.List;

@Mapper
public interface ExamSubMapper {
    int deleteByPrimaryKey(Integer examsubid);

    int insert(ExamSub record);

    int insertSelective(ExamSub record);

    ExamSub selectByPrimaryKey(Integer examsubid);

    int updateByPrimaryKeySelective(ExamSub record);

    int updateByPrimaryKey(ExamSub record);

    @Select("select * from examsub")
    List<ExamSub> selectExamSubAll();
}