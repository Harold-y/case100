package org.yye.entity;

public class College {
    private Integer collegeid;

    private String collegename;

    private String collegeChineseName;

    private String collegearea;

    private String collegetuition;

    private String collegeexpense;

    private String collegeacceptancerate;

    private String collegecampsize;

    private String collegemenwomanradio;

    private String collegeearlydecision;

    private String collegeregulardecision;

    private String collegeavgfreshmanretention;

    private String collegeintroduction;

    private String collegeearlyaction;
    private String collegestudentcount;
    private String collegeteacherstudentratio;
    private String collegeadvansubject;
    private int collegeispublic;
    private String collegecity;
    private String collegeinternationalstucount;
    private String collegeaudition;
    private String collegestufeeling;
    private String collegefuture;

    public College(String collegename, String collegeChineseName, String collegearea, String collegetuition, String collegeexpense, String collegeacceptancerate, String collegecampsize, String collegemenwomanradio, String collegeearlydecision, String collegeregulardecision, String collegeavgfreshmanretention, String collegeintroduction, String collegeearlyaction, String collegestudentcount, String collegeteacherstudentratio, String collegeadvansubject, int collegeispublic, String collegecity, String collegeinternationalstucount, String collegeaudition, String collegestufeeling, String collegefuture) {
        this.collegename = collegename;
        this.collegeChineseName = collegeChineseName;
        this.collegearea = collegearea;
        this.collegetuition = collegetuition;
        this.collegeexpense = collegeexpense;
        this.collegeacceptancerate = collegeacceptancerate;
        this.collegecampsize = collegecampsize;
        this.collegemenwomanradio = collegemenwomanradio;
        this.collegeearlydecision = collegeearlydecision;
        this.collegeregulardecision = collegeregulardecision;
        this.collegeavgfreshmanretention = collegeavgfreshmanretention;
        this.collegeintroduction = collegeintroduction;
        this.collegeearlyaction = collegeearlyaction;
        this.collegestudentcount = collegestudentcount;
        this.collegeteacherstudentratio = collegeteacherstudentratio;
        this.collegeadvansubject = collegeadvansubject;
        this.collegeispublic = collegeispublic;
        this.collegecity = collegecity;
        this.collegeinternationalstucount = collegeinternationalstucount;
        this.collegeaudition = collegeaudition;
        this.collegestufeeling = collegestufeeling;
        this.collegefuture = collegefuture;
    }

    public College(Integer collegeid, String collegename, String collegeChineseName, String collegearea, String collegetuition, String collegeexpense, String collegeacceptancerate, String collegecampsize, String collegemenwomanradio, String collegeearlydecision, String collegeregulardecision, String collegeavgfreshmanretention, String collegeintroduction, String collegeearlyaction, String collegestudentcount, String collegeteacherstudentratio, String collegeadvansubject, int collegeispublic, String collegecity, String collegeinternationalstucount, String collegeaudition, String collegestufeeling, String collegefuture) {
        this.collegeid = collegeid;
        this.collegename = collegename;
        this.collegeChineseName = collegeChineseName;
        this.collegearea = collegearea;
        this.collegetuition = collegetuition;
        this.collegeexpense = collegeexpense;
        this.collegeacceptancerate = collegeacceptancerate;
        this.collegecampsize = collegecampsize;
        this.collegemenwomanradio = collegemenwomanradio;
        this.collegeearlydecision = collegeearlydecision;
        this.collegeregulardecision = collegeregulardecision;
        this.collegeavgfreshmanretention = collegeavgfreshmanretention;
        this.collegeintroduction = collegeintroduction;
        this.collegeearlyaction = collegeearlyaction;
        this.collegestudentcount = collegestudentcount;
        this.collegeteacherstudentratio = collegeteacherstudentratio;
        this.collegeadvansubject = collegeadvansubject;
        this.collegeispublic = collegeispublic;
        this.collegecity = collegecity;
        this.collegeinternationalstucount = collegeinternationalstucount;
        this.collegeaudition = collegeaudition;
        this.collegestufeeling = collegestufeeling;
        this.collegefuture = collegefuture;
    }

    public String getCollegeearlyaction() {
        return collegeearlyaction;
    }

    public void setCollegeearlyaction(String collegeearlyaction) {
        this.collegeearlyaction = collegeearlyaction;
    }

    public String getCollegestudentcount() {
        return collegestudentcount;
    }

    public void setCollegestudentcount(String collegestudentcount) {
        this.collegestudentcount = collegestudentcount;
    }

    public String getCollegeteacherstudentratio() {
        return collegeteacherstudentratio;
    }

    public void setCollegeteacherstudentratio(String collegeteacherstudentratio) {
        this.collegeteacherstudentratio = collegeteacherstudentratio;
    }

    public String getCollegeadvansubject() {
        return collegeadvansubject;
    }

    public void setCollegeadvansubject(String collegeadvansubject) {
        this.collegeadvansubject = collegeadvansubject;
    }

    public int getCollegeispublic() {
        return collegeispublic;
    }

    public void setCollegeispublic(int collegeispublic) {
        this.collegeispublic = collegeispublic;
    }

    public String getCollegecity() {
        return collegecity;
    }

    public void setCollegecity(String collegecity) {
        this.collegecity = collegecity;
    }

    public String getCollegeinternationalstucount() {
        return collegeinternationalstucount;
    }

    public void setCollegeinternationalstucount(String collegeinternationalstucount) {
        this.collegeinternationalstucount = collegeinternationalstucount;
    }

    public String getCollegeaudition() {
        return collegeaudition;
    }

    public void setCollegeaudition(String collegeaudition) {
        this.collegeaudition = collegeaudition;
    }

    public String getCollegestufeeling() {
        return collegestufeeling;
    }

    public void setCollegestufeeling(String collegestufeeling) {
        this.collegestufeeling = collegestufeeling;
    }

    public String getCollegefuture() {
        return collegefuture;
    }

    public void setCollegefuture(String collegefuture) {
        this.collegefuture = collegefuture;
    }

    public String getCollegeChineseName() {
        return collegeChineseName;
    }

    public void setCollegeChineseName(String collegeChineseName) {
        this.collegeChineseName = collegeChineseName;
    }

    public College() {
    }


    public Integer getCollegeid() {
        return collegeid;
    }

    public void setCollegeid(Integer collegeid) {
        this.collegeid = collegeid;
    }

    public String getCollegename() {
        return collegename;
    }

    public void setCollegename(String collegename) {
        this.collegename = collegename == null ? null : collegename.trim();
    }

    public String getCollegearea() {
        return collegearea;
    }

    public void setCollegearea(String collegearea) {
        this.collegearea = collegearea == null ? null : collegearea.trim();
    }

    public String getCollegetuition() {
        return collegetuition;
    }

    public void setCollegetuition(String collegetuition) {
        this.collegetuition = collegetuition == null ? null : collegetuition.trim();
    }

    public String getCollegeexpense() {
        return collegeexpense;
    }

    public void setCollegeexpense(String collegeexpense) {
        this.collegeexpense = collegeexpense == null ? null : collegeexpense.trim();
    }

    public String getCollegeacceptancerate() {
        return collegeacceptancerate;
    }

    public void setCollegeacceptancerate(String collegeacceptancerate) {
        this.collegeacceptancerate = collegeacceptancerate == null ? null : collegeacceptancerate.trim();
    }

    public String getCollegecampsize() {
        return collegecampsize;
    }

    public void setCollegecampsize(String collegecampsize) {
        this.collegecampsize = collegecampsize == null ? null : collegecampsize.trim();
    }

    public String getCollegemenwomanradio() {
        return collegemenwomanradio;
    }

    public void setCollegemenwomanradio(String collegemenwomanradio) {
        this.collegemenwomanradio = collegemenwomanradio == null ? null : collegemenwomanradio.trim();
    }

    public String getCollegeearlydecision() {
        return collegeearlydecision;
    }

    public void setCollegeearlydecision(String collegeearlydecision) {
        this.collegeearlydecision = collegeearlydecision == null ? null : collegeearlydecision.trim();
    }

    public String getCollegeregulardecision() {
        return collegeregulardecision;
    }

    public void setCollegeregulardecision(String collegeregulardecision) {
        this.collegeregulardecision = collegeregulardecision == null ? null : collegeregulardecision.trim();
    }

    public String getCollegeavgfreshmanretention() {
        return collegeavgfreshmanretention;
    }

    public void setCollegeavgfreshmanretention(String collegeavgfreshmanretention) {
        this.collegeavgfreshmanretention = collegeavgfreshmanretention == null ? null : collegeavgfreshmanretention.trim();
    }

    public String getCollegeintroduction() {
        return collegeintroduction;
    }

    public void setCollegeintroduction(String collegeintroduction) {
        this.collegeintroduction = collegeintroduction == null ? null : collegeintroduction.trim();
    }
}