package org.yye.entity;

public class CollegeRanking {
    private Integer rankingid;

    private Integer collegeid;

    private String rankingusnewslocal;

    private String rankingusnewsworld;

    private String rankingqsworld;

    private String rankingarwuworld;

    private String rankingyear;


    public CollegeRanking() {
    }

    public CollegeRanking(Integer collegeid, String rankingusnewslocal, String rankingusnewsworld, String rankingqsworld, String rankingarwuworld, String rankingyear) {
        this.collegeid = collegeid;
        this.rankingusnewslocal = rankingusnewslocal;
        this.rankingusnewsworld = rankingusnewsworld;
        this.rankingqsworld = rankingqsworld;
        this.rankingarwuworld = rankingarwuworld;
        this.rankingyear = rankingyear;
    }

    public CollegeRanking(Integer rankingid, Integer collegeid, String rankingusnewslocal, String rankingusnewsworld, String rankingqsworld, String rankingarwuworld, String rankingyear) {
        this.rankingid = rankingid;
        this.collegeid = collegeid;
        this.rankingusnewslocal = rankingusnewslocal;
        this.rankingusnewsworld = rankingusnewsworld;
        this.rankingqsworld = rankingqsworld;
        this.rankingarwuworld = rankingarwuworld;
        this.rankingyear = rankingyear;
    }

    public Integer getRankingid() {
        return rankingid;
    }

    public void setRankingid(Integer rankingid) {
        this.rankingid = rankingid;
    }

    public Integer getCollegeid() {
        return collegeid;
    }

    public void setCollegeid(Integer collegeid) {
        this.collegeid = collegeid;
    }

    public String getRankingusnewslocal() {
        return rankingusnewslocal;
    }

    public void setRankingusnewslocal(String rankingusnewslocal) {
        this.rankingusnewslocal = rankingusnewslocal == null ? null : rankingusnewslocal.trim();
    }

    public String getRankingusnewsworld() {
        return rankingusnewsworld;
    }

    public void setRankingusnewsworld(String rankingusnewsworld) {
        this.rankingusnewsworld = rankingusnewsworld == null ? null : rankingusnewsworld.trim();
    }

    public String getRankingqsworld() {
        return rankingqsworld;
    }

    public void setRankingqsworld(String rankingqsworld) {
        this.rankingqsworld = rankingqsworld == null ? null : rankingqsworld.trim();
    }

    public String getRankingarwuworld() {
        return rankingarwuworld;
    }

    public void setRankingarwuworld(String rankingarwuworld) {
        this.rankingarwuworld = rankingarwuworld == null ? null : rankingarwuworld.trim();
    }

    public String getRankingyear() {
        return rankingyear;
    }

    public void setRankingyear(String rankingyear) {
        this.rankingyear = rankingyear == null ? null : rankingyear.trim();
    }
}