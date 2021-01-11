package org.yye.dao.mapper;

import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.apache.ibatis.annotations.Update;
import org.yye.entity.*;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface StuInfoMapper {
    int deleteByPrimaryKey(Integer stuid);

    int insert(StuInfo record);

    int insertSelective(StuInfo record);

    StuInfo selectByPrimaryKey(Integer stuid);

    int updateByPrimaryKeySelective(StuInfo record);

    int updateByPrimaryKey(StuInfo record);

    @Select("select * from stuinfo")
    List<StuInfo> selectAll();

    @Select("select * from stuinfo where stuId = #{stuId}")
    StuInfo selectStuInfoById(Integer stuId);

    @Insert("insert into stuinfo (stuCaseId,stuUsername,stuPassword,stuEmail,stuSex) values (#{stucaseid}," +
            "#{stuusername},#{stupassword},#{stuemail},#{stusex})")
    int insertIntoStuInfo(StuInfo record);

    @Select("select count(*) from stuinfo where stuEmail = #{stuemail}")
    int checkEmailUsed(String stuemail);

    @Select("select count(*) from stuinfo where stuEmail = #{stuemail} and stuPassword = #{stupassword}")
    int StuInfoLogin(String stuemail,String stupassword);

    @Select("select stuId, stuUsername from stuinfo where stuEmail = #{stuemail} and stuPassword = #{stupassword}")
    Map selectStuInfoGeneralInfo(String stuemail,String stupassword);


    int updateStuInfo(StuInfo record);

    @Select("select stuExamSubId,examname,examSubName,stuExamSubScore,testDate,stuexamsub.note from stuinfo,stuexamsub,examsub,examgenre" +
            " where stuinfo.stuId = #{stuId} and stuinfo.stuId = stuexamsub.stuId and stuexamsub.subid = examsub.examSubId" +
            " and examsub.examId = examgenre.examid")
    List<LinkedHashMap> selectStuScoreByStuId(Integer stuId);

    @Select("select stuExamSubId,examname,examSubName,stuExamSubScore,testDate,stuexamsub.note from stuinfo,stuexamsub,examsub,examgenre" +
            " where stuinfo.stuId = #{stuId} and stuExamSubId = #{stuExamSubId} and stuinfo.stuId = stuexamsub.stuId and stuexamsub.subid = examsub.examSubId" +
            " and examsub.examId = examgenre.examid")
    LinkedHashMap selectStuScoreByStuId_Edit(Integer stuId,Integer stuExamSubId);

    @Update("update stuexamsub set stuExamSubScore = #{stuexamsubscore}, testDate = #{testdate} where stuExamSubId = #{stuexamsubid}")
    int updateStuExamSub(StuExamSub record);

    @Select("select * from examsub where examid = #{examid}")
    List<ExamSub> selectSub(Integer examid);

    @Insert("insert into stuexamsub (stuId,subid,stuExamSubScore,testDate) values(#{stuid},#{subid},#{stuexamsubscore}," +
            "#{testdate})")
    int insertIntostuExamSub(StuExamSub record);

    @Select("select * from activity where stuId = #{stuId}")
    List<Activity> selectActivityByStuId(Integer stuId);

    @Select("select * from activity where activityId = #{activityid}")
    Activity selectActivityByActivityId(Integer activityid);

    @Update("update activity set activityName = #{activityname}, activityResult = #{activityresult}," +
            "activityNote = #{activitynote} where activityId = #{activityid}")
    int updateActivity(Activity record);

    @Insert("insert into activity(stuId,activityName,activityResult,activityNote) values(#{stuid}," +
            "#{activityname},#{activityresult},#{activitynote})")
    int insertIntoActivity(Activity record);

    @Select("select stuinfo.stuUsername,stuGPA,stuSex,stuinfo.stuId,stuHighSchool,stuNationality," +
            "stuSexualOrientation, stuOtherInfo from stuinfo where stuId = #{stuId}")
    StuInfo selectStuInfoByStuId(Integer stuId);

    @Select("select examid,examname from examgenre")
    List<ExamGenre> selectExamGenreAll();

}