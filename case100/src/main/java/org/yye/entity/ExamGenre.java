package org.yye.entity;


public class ExamGenre {
    private Integer examid;

    private String examname;

    private String note;

    public ExamGenre() {
    }

    public ExamGenre(String examname, String note) {
        this.examname = examname;
        this.note = note;
    }

    public ExamGenre(Integer examid, String examname, String note) {
        this.examid = examid;
        this.examname = examname;
        this.note = note;
    }

    public Integer getExamid() {
        return examid;
    }

    public void setExamid(Integer examid) {
        this.examid = examid;
    }

    public String getExamname() {
        return examname;
    }

    public void setExamname(String examname) {
        this.examname = examname == null ? null : examname.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }
}