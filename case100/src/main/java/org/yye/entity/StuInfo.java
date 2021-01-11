package org.yye.entity;

public class StuInfo {
    private Integer stuid;

    private String stucaseid;

    private String stuusername;

    private String stutelephone;

    private String stupassword;

    private String stuphotourl;

    private String stugpa;

    private String stusex;

    private String stuhighschool;

    private String stunationality;

    private String stusexualorientation;

    private String stuessayurl;

    private String stuotherinfo;

    private String stuprovince;

    private String stucity;

    private String stuemail;

    public StuInfo() {
    }

    @Override
    public String toString() {
        return "StuInfo{" +
                "stuid=" + stuid +
                ", stucaseid='" + stucaseid + '\'' +
                ", stuusername='" + stuusername + '\'' +
                ", stutelephone='" + stutelephone + '\'' +
                ", stupassword='" + stupassword + '\'' +
                ", stuphotourl='" + stuphotourl + '\'' +
                ", stugpa='" + stugpa + '\'' +
                ", stusex='" + stusex + '\'' +
                ", stuhighschool='" + stuhighschool + '\'' +
                ", stunationality='" + stunationality + '\'' +
                ", stusexualorientation='" + stusexualorientation + '\'' +
                ", stuessayurl='" + stuessayurl + '\'' +
                ", stuotherinfo='" + stuotherinfo + '\'' +
                ", stuprovince='" + stuprovince + '\'' +
                ", stucity='" + stucity + '\'' +
                ", stuemail='" + stuemail + '\'' +
                '}';
    }

    public StuInfo(String stucaseid, String stuusername, String stutelephone, String stupassword, String stuphotourl, String stugpa, String stusex, String stuhighschool, String stunationality, String stusexualorientation, String stuessayurl, String stuotherinfo, String stuprovince, String stucity, String stuemail) {
        this.stucaseid = stucaseid;
        this.stuusername = stuusername;
        this.stutelephone = stutelephone;
        this.stupassword = stupassword;
        this.stuphotourl = stuphotourl;
        this.stugpa = stugpa;
        this.stusex = stusex;
        this.stuhighschool = stuhighschool;
        this.stunationality = stunationality;
        this.stusexualorientation = stusexualorientation;
        this.stuessayurl = stuessayurl;
        this.stuotherinfo = stuotherinfo;
        this.stuprovince = stuprovince;
        this.stucity = stucity;
        this.stuemail = stuemail;
    }

    public StuInfo(Integer stuid, String stucaseid, String stuusername, String stutelephone, String stupassword, String stuphotourl, String stugpa, String stusex, String stuhighschool, String stunationality, String stusexualorientation, String stuessayurl, String stuotherinfo, String stuprovince, String stucity, String stuemail) {
        this.stuid = stuid;
        this.stucaseid = stucaseid;
        this.stuusername = stuusername;
        this.stutelephone = stutelephone;
        this.stupassword = stupassword;
        this.stuphotourl = stuphotourl;
        this.stugpa = stugpa;
        this.stusex = stusex;
        this.stuhighschool = stuhighschool;
        this.stunationality = stunationality;
        this.stusexualorientation = stusexualorientation;
        this.stuessayurl = stuessayurl;
        this.stuotherinfo = stuotherinfo;
        this.stuprovince = stuprovince;
        this.stucity = stucity;
        this.stuemail = stuemail;
    }

    public Integer getStuid() {
        return stuid;
    }

    public void setStuid(Integer stuid) {
        this.stuid = stuid;
    }

    public String getStucaseid() {
        return stucaseid;
    }

    public void setStucaseid(String stucaseid) {
        this.stucaseid = stucaseid == null ? null : stucaseid.trim();
    }

    public String getStuusername() {
        return stuusername;
    }

    public void setStuusername(String stuusername) {
        this.stuusername = stuusername == null ? null : stuusername.trim();
    }

    public String getStutelephone() {
        return stutelephone;
    }

    public void setStutelephone(String stutelephone) {
        this.stutelephone = stutelephone == null ? null : stutelephone.trim();
    }

    public String getStupassword() {
        return stupassword;
    }

    public void setStupassword(String stupassword) {
        this.stupassword = stupassword == null ? null : stupassword.trim();
    }

    public String getStuphotourl() {
        return stuphotourl;
    }

    public void setStuphotourl(String stuphotourl) {
        this.stuphotourl = stuphotourl == null ? null : stuphotourl.trim();
    }

    public String getStugpa() {
        return stugpa;
    }

    public void setStugpa(String stugpa) {
        this.stugpa = stugpa == null ? null : stugpa.trim();
    }

    public String getStusex() {
        return stusex;
    }

    public void setStusex(String stusex) {
        this.stusex = stusex == null ? null : stusex.trim();
    }

    public String getStuhighschool() {
        return stuhighschool;
    }

    public void setStuhighschool(String stuhighschool) {
        this.stuhighschool = stuhighschool == null ? null : stuhighschool.trim();
    }

    public String getStunationality() {
        return stunationality;
    }

    public void setStunationality(String stunationality) {
        this.stunationality = stunationality == null ? null : stunationality.trim();
    }

    public String getStusexualorientation() {
        return stusexualorientation;
    }

    public void setStusexualorientation(String stusexualorientation) {
        this.stusexualorientation = stusexualorientation == null ? null : stusexualorientation.trim();
    }

    public String getStuessayurl() {
        return stuessayurl;
    }

    public void setStuessayurl(String stuessayurl) {
        this.stuessayurl = stuessayurl == null ? null : stuessayurl.trim();
    }

    public String getStuotherinfo() {
        return stuotherinfo;
    }

    public void setStuotherinfo(String stuotherinfo) {
        this.stuotherinfo = stuotherinfo == null ? null : stuotherinfo.trim();
    }

    public String getStuprovince() {
        return stuprovince;
    }

    public void setStuprovince(String stuprovince) {
        this.stuprovince = stuprovince == null ? null : stuprovince.trim();
    }

    public String getStucity() {
        return stucity;
    }

    public void setStucity(String stucity) {
        this.stucity = stucity == null ? null : stucity.trim();
    }

    public String getStuemail() {
        return stuemail;
    }

    public void setStuemail(String stuemail) {
        this.stuemail = stuemail == null ? null : stuemail.trim();
    }
}