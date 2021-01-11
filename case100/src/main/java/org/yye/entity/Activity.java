package org.yye.entity;

public class Activity {
    private Integer activityid;

    private Integer stuid;

    private String activityname;

    private String activityresult;

    private String activitynote;

    public Activity() {
    }

    public Activity(Integer stuid, String activityname, String activityresult, String activitynote) {
        this.stuid = stuid;
        this.activityname = activityname;
        this.activityresult = activityresult;
        this.activitynote = activitynote;
    }

    public Activity(Integer activityid, Integer stuid, String activityname, String activityresult, String activitynote) {
        this.activityid = activityid;
        this.stuid = stuid;
        this.activityname = activityname;
        this.activityresult = activityresult;
        this.activitynote = activitynote;
    }

    public Integer getActivityid() {
        return activityid;
    }

    public void setActivityid(Integer activityid) {
        this.activityid = activityid;
    }

    public Integer getStuid() {
        return stuid;
    }

    public void setStuid(Integer stuid) {
        this.stuid = stuid;
    }

    public String getActivityname() {
        return activityname;
    }

    public void setActivityname(String activityname) {
        this.activityname = activityname == null ? null : activityname.trim();
    }

    public String getActivityresult() {
        return activityresult;
    }

    public void setActivityresult(String activityresult) {
        this.activityresult = activityresult == null ? null : activityresult.trim();
    }

    public String getActivitynote() {
        return activitynote;
    }

    public void setActivitynote(String activitynote) {
        this.activitynote = activitynote == null ? null : activitynote.trim();
    }
}