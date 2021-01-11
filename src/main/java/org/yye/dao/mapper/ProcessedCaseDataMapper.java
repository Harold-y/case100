package org.yye.dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.yye.entity.ProcessedCaseData;

import java.util.ArrayList;
import java.util.LinkedHashMap;

@Mapper
public interface ProcessedCaseDataMapper {
    int deleteByPrimaryKey(Integer id);

    int insert(ProcessedCaseData record);

    int insertSelective(ProcessedCaseData record);

    ProcessedCaseData selectByPrimaryKey(Integer id);

    int updateByPrimaryKeySelective(ProcessedCaseData record);

    int updateByPrimaryKeyWithBLOBs(ProcessedCaseData record);

    int updateByPrimaryKey(ProcessedCaseData record);

    @Select("select id, answerId, original_answer, processed_answer, sat, act, toefl, ielts, gpa, note from processedcasedata")
    ArrayList<ProcessedCaseData> selectAll();

    @Insert("insert into statistics (college_id, college_name, sat_mean, sat_max, sat_min, sat_median, act_mean, act_max, act_min, act_median" +
            ", toefl_mean, toefl_max, toefl_min, toefl_median, ielts_mean, ielts_max, ielts_min, ielts_median, gpa_mean, gpa_max, gpa_min," +
            "gpa_median, Note) values (-1, 'Eternal University' , #{satMean}, #{satMax}, #{satMin}, #{satMedian}," +
            " #{actMean}, #{actMax}, #{actMin}, #{actMedian}," +
            " #{toeflMean}, #{toeflMax}, #{toeflMin}, #{toeflMedian}," +
            " #{ieltsMean}, #{ieltsMax}, #{ieltsMin}, #{ieltsMedian}," +
            " #{gpaMean}, #{gpaMax}, #{gpaMin}, #{gpaMedian},'This is a general statistics')")
    int insertIntoStatistics(LinkedHashMap map);

    @Delete("delete from statistics where college_id = -1")
    int deleteStatistics();

}