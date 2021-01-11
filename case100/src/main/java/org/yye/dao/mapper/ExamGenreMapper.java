package org.yye.dao.mapper;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.yye.entity.ExamGenre;

import java.util.List;

@Mapper
public interface ExamGenreMapper {
    int deleteByPrimaryKey(Integer examid);

    int insert(ExamGenre record);

    int insertSelective(ExamGenre record);

    ExamGenre selectByPrimaryKey(Integer examid);

    int updateByPrimaryKeySelective(ExamGenre record);

    int updateByPrimaryKey(ExamGenre record);

    @Select("select * from examgenre")
    List<ExamGenre> selectExamGenreAll();
}