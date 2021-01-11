package org.yye.dao.mapper;

import org.yye.entity.StuExamSub;

public interface StuExamSubMapper {
    int deleteByPrimaryKey(Integer stuexamsubid);

    int insert(StuExamSub record);

    int insertSelective(StuExamSub record);

    StuExamSub selectByPrimaryKey(Integer stuexamsubid);

    int updateByPrimaryKeySelective(StuExamSub record);

    int updateByPrimaryKey(StuExamSub record);
}