package org.yye.dao.mapper;

import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.annotations.Select;
import org.yye.entity.College;
import org.yye.entity.CollegeRanking;

import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

@Mapper
public interface CollegeRankingMapper {
    int deleteByPrimaryKey(Integer rankingid);

    int insert(CollegeRanking record);

    int insertSelective(CollegeRanking record);

    CollegeRanking selectByPrimaryKey(Integer rankingid);

    int updateByPrimaryKeySelective(CollegeRanking record);

    int updateByPrimaryKey(CollegeRanking record);

    @Select("select collegeId,collegeName,collegeChineseName,collegeArea from college where collegeName like concat('%',#{collegeName},'%') or collegeChineseName like concat('%',#{collegeName},'%')")
    List<College> selectCollegeRankingByName(String collegeName);

    @Select("select rankingId,collegeranking.collegeId,collegeName,collegeArea,rankingUsNewsLocal,rankingUsNewsWorld,rankingQsWorld," +
            "rankingArwuWorld,rankingYear from collegeranking,college where collegeranking.collegeId = college.collegeId")
    List<LinkedHashMap> selectCollegeRankingAll();

    @Insert("insert into collegeranking(collegeId,rankingUsNewsLocal,rankingUsNewsWorld,rankingQsWorld,rankingArwuWorld,rankingYear) values(" +
            "#{collegeid},#{rankingusnewslocal},#{rankingusnewsworld},#{rankingqsworld},#{rankingarwuworld}," +
            "#{rankingyear})")
    int insertCollegeRanking(CollegeRanking collegeRanking);

    @Select("select * from collegeranking where collegeId = #{collegeid}")
    public List<CollegeRanking> selectCollegeRankingAllByCollegeId(int collegeid);

    @Select("select * from collegeranking where collegeId = #{collegeid} and rankingYear = #{rankingYear}")
    public CollegeRanking selectCollegeRankingByCollegeId_rk(int collegeid,int rankingYear);

    @Select("select count(*) from collegeranking where collegeId = #{collegeid} and rankingYear = #{year}")
    int selectCollegeRankingByIdAndYear_Count(int collegeid,String year);

    @Delete("delete from collegeranking where rankingId = #{rankingId}")
    int deleteRankingByRankingId(int rankingId);
}