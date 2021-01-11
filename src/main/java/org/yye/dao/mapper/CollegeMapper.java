package org.yye.dao.mapper;

import org.apache.ibatis.annotations.*;
import org.yye.entity.College;
import org.yye.entity.CollegeRanking;

import java.util.LinkedHashMap;
import java.util.List;

@Mapper
public interface CollegeMapper {
    @Delete("delete from college where collegeId = #{collegeid}")
    int deleteCollegeByPrimaryKey(Integer collegeid);

    int insert(College record);

    int insertSelective(College record);
    @Select("select * from college where collegeid = #{collegeid}")
    College selectById(Integer collegeid);

    @Select("select * from college")
    List<College> selectCollegeAll();

    int updateByPrimaryKeySelective(College record);

    int updateByPrimaryKey(College record);

    @Select("select collegeId,collegeName,collegeChineseName,collegeArea,collegeTuition,collegeExpense from college")
    List<College> selectPanel();

    @Select("select collegeId,collegeName,collegeChineseName,collegeArea,collegeTuition,collegeExpense from college where collegeName like concat('%',#{collegeName},'%') or collegeChineseName like concat('%',#{collegeName},'%')")
    List<College> selectCollegeByName(String collegeName);

    @Select("select count(*) from college where collegeName = #{collegeName}")
    int selectCollegeByName_Count(String collegeName);

    @Insert("insert into college(collegeId,collegeName,collegeChineseName,collegeArea,collegeTuition," +
             "collegeExpense,collegeAcceptanceRate,collegeCampSize,collegeMenWomanRadio," +
            "collegeEarlyDecision,collegeRegularDecision,collegeIntroduction,collegeAvgFreshmanRetention,collegeEarlyAction," +
            "collegeStudentCount,collegeTeacherStudentRatio," +
            "collegeAdvanSubject,collegeIsPublic,collegeCity,collegeInternationalStuCount,collegeAudition," +
            "collegeStuFeeling,collegeFuture) values(#{collegeid},#{collegename},#{collegeChineseName}," +
            "#{collegearea},#{collegetuition},#{collegeexpense},#{collegeacceptancerate},#{collegecampsize}," +
            "#{collegemenwomanradio},#{collegeearlydecision},#{collegeregulardecision},#{collegeintroduction},#{collegeavgfreshmanretention}," +
            "#{collegeearlyaction},#{collegestudentcount},#{collegeteacherstudentratio},#{collegeadvansubject}," +
            "#{collegeispublic},#{collegecity},#{collegeinternationalstucount},#{collegeaudition},#{collegestufeeling}," +
            "#{collegefuture}" +
            ")")
    int insertCollege(College college);

    @Update("update college set collegeName=#{collegename},collegeChineseName=#{collegeChineseName}," +
            "collegeArea=#{collegearea},collegeTuition=#{collegetuition},collegeExpense=#{collegeexpense}," +
            "collegeAcceptanceRate=#{collegeacceptancerate},collegeCampSize=#{collegecampsize}," +
            "collegeMenWomanRadio=#{collegemenwomanradio},collegeEarlyDecision=#{collegeearlydecision}," +
            "collegeRegularDecision=#{collegeregulardecision},collegeIntroduction=#{collegeintroduction},collegeAvgFreshmanRetention=#{collegeavgfreshmanretention}," +
            "collegeEarlyAction=#{collegeearlyaction},collegeStudentCount=#{collegestudentcount}," +
            "collegeTeacherStudentRatio=#{collegeteacherstudentratio},collegeAdvanSubject=#{collegeadvansubject}," +
            "collegeIsPublic=#{collegeispublic},collegeCity=#{collegecity}," +
            "collegeInternationalStuCount=#{collegeinternationalstucount},collegeAudition=#{collegeaudition}," +
            "collegeStuFeeling=#{collegestufeeling},collegeFuture=#{collegefuture} where collegeId = #{collegeid}")
    int updateCollege(College college);

    @Select("select count(*) from college")
    int selectCountCollegeAll();

    @Select("select college.collegeId,college.collegeName,college.collegeChineseName,collegeArea,collegeTuition," +
            "rankingUsNewsWorld,rankingYear from college,collegeranking where college.collegeId = collegeranking.collegeId and " +
            "rankingYear = #{rankingYear} order by rankingUsNewsWorld+0 limit #{starter},#{limit}")
    List<LinkedHashMap> selectCollegeInfoAll(String rankingYear, int starter, int limit);


    List<LinkedHashMap> selectCollegeInfoByCollegeName(String rankingYear,String collegeName,String collegeArea);

    CollegeRanking selectRankingByCollegeId();


    /**
     * This method is for presenting offer data to client (web)
     */
    @Select("select * from statistics where college_id = #{collegeid}")
    LinkedHashMap selectOfferInfo(Integer collegeid);

}