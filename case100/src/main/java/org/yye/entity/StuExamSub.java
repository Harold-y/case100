package org.yye.entity;

import java.sql.Date;

public class StuExamSub {
    private Integer stuexamsubid;

    private Integer stuid;

    private Integer subid;

    private String stuexamsubscore;

    private Date testdate;

    private String note;

    @Override
    public String toString() {
        return "StuExamSub{" +
                "stuexamsubid=" + stuexamsubid +
                ", stuid=" + stuid +
                ", subid=" + subid +
                ", stuexamsubscore='" + stuexamsubscore + '\'' +
                ", testdate=" + testdate +
                ", note='" + note + '\'' +
                '}';
    }

    public StuExamSub() {
    }

    public StuExamSub(Integer stuid, Integer subid, String stuexamsubscore, Date testdate, String note) {
        this.stuid = stuid;
        this.subid = subid;
        this.stuexamsubscore = stuexamsubscore;
        this.testdate = testdate;
        this.note = note;
    }

    public StuExamSub(Integer stuexamsubid, Integer stuid, Integer subid, String stuexamsubscore, Date testdate, String note) {
        this.stuexamsubid = stuexamsubid;
        this.stuid = stuid;
        this.subid = subid;
        this.stuexamsubscore = stuexamsubscore;
        this.testdate = testdate;
        this.note = note;
    }

    public Integer getStuexamsubid() {
        return stuexamsubid;
    }

    public void setStuexamsubid(Integer stuexamsubid) {
        this.stuexamsubid = stuexamsubid;
    }

    public Integer getStuid() {
        return stuid;
    }

    public void setStuid(Integer stuid) {
        this.stuid = stuid;
    }

    public Integer getSubid() {
        return subid;
    }

    public void setSubid(Integer subid) {
        this.subid = subid;
    }

    public String getStuexamsubscore() {
        return stuexamsubscore;
    }

    public void setStuexamsubscore(String stuexamsubscore) {
        this.stuexamsubscore = stuexamsubscore == null ? null : stuexamsubscore.trim();
    }

    public Date getTestdate() {
        return testdate;
    }

    public void setTestdate(Date testdate) {
        this.testdate = testdate;
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }
}