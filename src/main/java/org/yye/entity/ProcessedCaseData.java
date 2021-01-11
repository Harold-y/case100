package org.yye.entity;

public class ProcessedCaseData {
    private Integer id;

    private Integer answerid;

    private String original_answer;

    private String processed_answer;

    private String sat;

    private String act;

    private String toefl;

    private String ielts;

    private String gpa;

    public ProcessedCaseData(Integer id, Integer answerid, String original_answer, String processed_answer, String sat, String act, String toefl, String ielts, String gpa, String note) {
        this.id = id;
        this.answerid = answerid;
        this.original_answer = original_answer;
        this.processed_answer = processed_answer;
        this.sat = sat;
        this.act = act;
        this.toefl = toefl;
        this.ielts = ielts;
        this.gpa = gpa;
        this.note = note;
    }

    public ProcessedCaseData(Integer answerid, String original_answer, String processed_answer, String sat, String act, String toefl, String ielts, String gpa, String note) {
        this.answerid = answerid;
        this.original_answer = original_answer;
        this.processed_answer = processed_answer;
        this.sat = sat;
        this.act = act;
        this.toefl = toefl;
        this.ielts = ielts;
        this.gpa = gpa;
        this.note = note;
    }

    public String getOriginal_answer() {
        return original_answer;
    }

    public void setOriginal_answer(String original_answer) {
        this.original_answer = original_answer;
    }

    public String getProcessed_answer() {
        return processed_answer;
    }

    public void setProcessed_answer(String processed_answer) {
        this.processed_answer = processed_answer;
    }

    private String note;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public Integer getAnswerid() {
        return answerid;
    }

    public void setAnswerid(Integer answerid) {
        this.answerid = answerid;
    }

    public String getSat() {
        return sat;
    }

    public void setSat(String sat) {
        this.sat = sat == null ? null : sat.trim();
    }

    public String getAct() {
        return act;
    }

    public void setAct(String act) {
        this.act = act == null ? null : act.trim();
    }

    public String getToefl() {
        return toefl;
    }

    public void setToefl(String toefl) {
        this.toefl = toefl == null ? null : toefl.trim();
    }

    public String getIelts() {
        return ielts;
    }

    public void setIelts(String ielts) {
        this.ielts = ielts == null ? null : ielts.trim();
    }

    public String getGpa() {
        return gpa;
    }

    public void setGpa(String gpa) {
        this.gpa = gpa == null ? null : gpa.trim();
    }

    public String getNote() {
        return note;
    }

    public void setNote(String note) {
        this.note = note == null ? null : note.trim();
    }
}