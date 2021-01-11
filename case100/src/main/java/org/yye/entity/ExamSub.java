package org.yye.entity;

public class ExamSub {
    private Integer examsubid;

    private Integer examid;

    private String examsubname;

    private String note;

    public ExamSub() {
    }

    public ExamSub(Integer examid, String examsubname, String note) {
        this.examid = examid;
        this.examsubname = examsubname;
        this.note = note;
    }

    public ExamSub(Integer examsubid, Integer examid, String examsubname, String note) {
        this.examsubid = examsubid;
        this.examid = examid;
        this.examsubname = examsubname;
        this.note = note;
    }

    public Integer getExamsubid() {
        return examsubid;
    }

    public void setExamsubid(Integer examsubid) {
        this.examsubid = examsubid;
    }

    public Integer getExamid() {
        return examid;
    }

    public void setExamid(Integer examid) {
        this.examid = examid;
    }

    public String getExamsubname() {
        return examsubname;
    }

    public void setExamsubname(String examsubname) {
        this.examsubname = examsubname == null ? null : examsubname.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }
}