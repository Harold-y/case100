package org.yye.dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.yye.entity.StuCollege;

import java.util.LinkedHashMap;
import java.util.List;

@Mapper
public interface StuCollegeMapper {
    int deleteByPrimaryKey(Integer stucollegeid);

    int insert(StuCollege record);

    int insertSelective(StuCollege record);

    @Select("select * from stucollege where stuCollegeId = #{stucollegeid}")
    StuCollege selectByPrimaryKey1(Integer stucollegeid);

    int updateByPrimaryKeySelective(StuCollege record);

    int updateByPrimaryKey(StuCollege record);

    @Select("select stuCollegeId,collegeName,stucollege.stuId,stucollege.collegeId,stuCollegeMajor," +
            "stuCollegeScholarship,stuCollegeAlumniRelation,stuCollegeSelfFeeling,stuCollegeScoreId from stucollege,college where " +
            "stucollege.stuId = #{stuId} and stucollege.collegeId = college.collegeId")
    List<LinkedHashMap> selectStuCollegeByStuId(Integer stuId);

    @Select("select stuCollegeId,collegeName,stucollege.stuId,stucollege.collegeId,stuCollegeMajor," +
            "stuCollegeScholarship,stuCollegeAlumniRelation,stuCollegeSelfFeeling,stuCollegeScoreId from stucollege,college where " +
            "stucollege.collegeId = college.collegeId and stuCollegeId = #{stuCollegeId}")
    LinkedHashMap selectStuCollegeByStuCollegeId(String stuCollegeId);

    @Select("select stuCollegeDistinctEssayUrl from stucollege where stuCollegeId = #{stucollegeid}")
    String selectStuCollegeEssay(Integer stucollegeid);

    @Select("select stuCollegeScoreId from stucollege where stuCollegeId = #{stucollegeid}")
    String selectStuCollegeScoreString(Integer stucollegeid);

    @Select("select stuExamSubId,examname,examSubName,stuExamSubScore,testDate " +
            "from stuexamsub,stucollege,examgenre,examsub where stucollege.stuId = stuexamsub.stuId and " +
            "stuExamSubId = #{stuExamSubId} and stuexamsub.subid = examsub.examSubId and examsub.examId = examgenre.examid limit 0,1")
    LinkedHashMap selectScore(Integer stuExamSubId);



    /*@Select("select stuinfo.stuUsername,stuGPA,stuSex,stuinfo.stuId,stuHighSchool,stuNationality," +
            " stuSexualOrientation, stuOtherInfo, stucollege.stuCollegeMajor, stucollege.stuCollegeScholarship," +
            "stucollege.stuCollegeAlumniRelation, stucollege.stuCollegeSelfFeeling,stucollege.stuCollegeDistinctEssayUrl," +
            "stucollege.stuCollegeScoreId,college.collegeName, college.collegeChineseName," +
            "collegeArea,college.collegeTuition,college.collegeExpense,college.collegeAcceptanceRate," +
            "college.collegeCampSize, activity.activityName,activity.activityResult,activity.activityNote from college,stucollege,stuexamsub,activity,stuinfo where" +
            " stucollege.stuId = stuinfo.stuId and stucollege.collegeId = college.collegeId and " +
            "activity.stuId = stucollege.stuId ")
    List<LinkedHashMap> selectDetails(Integer stuCollegeId);*/

    @Select("select stuId from stucollege where stuCollegeId = #{stuCollegeId}")
    int selectStuIdByStuCollegeId(Integer stuCollegeId);

    @Select("select collegeId from stucollege where stuCollegeId = #{stuCollegeId}")
    int selectCollegeIdByStuCollegeId(Integer stuCollegeId);

    @Insert("insert into stucollegecollection (stuId,stuCollegeId) values(#{stuId},#{stuCollegeId})")
    int insertIntoStuCollegeCollection(Integer stuId,Integer stuCollegeId);

    @Delete("delete from stucollegecollection where stuId = #{stuId} and stuCollegeId = #{stuCollegeId}")
    int deleteStuCollegeCollectionById(Integer stuId,Integer stuCollegeId);

    @Select("select * from stucollegecollection where stuId = #{stuId} and stuCollegeId = #{stuCollegeId}")
    LinkedHashMap selectStuCollegeCollectionByCondition(Integer stuId,Integer stuCollegeId);

    @Select("select stuCollegeCollectionId,stuCollegeId from stucollegecollection where stuId = #{stuId}")
    List<LinkedHashMap> selectStuCollegeCollectionByStuId(Integer stuId);

    @Select("select stuCollegeId,collegeName,stucollege.stuId,stucollege.collegeId,stuCollegeMajor," +
            "stuCollegeScoreId,stuinfo.stuUsername from stucollege,college,stuinfo where " +
            "stucollege.stuCollegeId = #{stuCollegeId} and stucollege.collegeId = college.collegeId and stucollege.stuId" +
            " = stuinfo.stuId")
    LinkedHashMap selectCollectionInfoByStuCollegeId(Integer stuCollegeId);

    @Select("select stuinfo.stuUsername,stuinfo.stuId,stucollege.stuCollegeId,stuCollegeScoreId from stuCollege,stuinfo where " +
            "stuinfo.stuId = stucollege.stuId and stucollege.collegeId = #{collegeId} limit 0, 10")
    List<LinkedHashMap> selectStudentOfferByCollegeId(Integer collegeId);
}