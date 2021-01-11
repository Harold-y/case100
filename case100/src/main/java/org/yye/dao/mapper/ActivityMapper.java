package org.yye.dao.mapper;

import org.yye.entity.Activity;

public interface ActivityMapper {
    int deleteByPrimaryKey(Integer activityid);

    int insert(Activity record);

    int insertSelective(Activity record);

    Activity selectByPrimaryKey(Integer activityid);

    int updateByPrimaryKeySelective(Activity record);

    int updateByPrimaryKey(Activity record);
}