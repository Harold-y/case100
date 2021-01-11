package org.yye.entity;

public class StuCollege {
    private Integer stucollegeid;

    private Integer stuid;

    private Integer collegeid;

    private String stucollegemajor;

    private Double stucollegescholarship;

    private String stucollegealumnirelation;

    private String stucollegeselffeeling;

    private String stucollegedistinctessayurl;
    private String stucollegescoreid;

    public String getStucollegescoreid() {
        return stucollegescoreid;
    }

    @Override
    public String toString() {
        return "StuCollege{" +
                "stucollegeid=" + stucollegeid +
                ", stuid=" + stuid +
                ", collegeid=" + collegeid +
                ", stucollegemajor='" + stucollegemajor + '\'' +
                ", stucollegescholarship=" + stucollegescholarship +
                ", stucollegealumnirelation='" + stucollegealumnirelation + '\'' +
                ", stucollegeselffeeling='" + stucollegeselffeeling + '\'' +
                ", stucollegedistinctessayurl='" + stucollegedistinctessayurl + '\'' +
                ", stucollegescoreid='" + stucollegescoreid + '\'' +
                '}';
    }

    public void setStucollegescoreid(String stucollegescoreid) {
        this.stucollegescoreid = stucollegescoreid;
    }

    public StuCollege() {
    }

    public StuCollege(Integer stuid, Integer collegeid, String stucollegemajor, Double stucollegescholarship, String stucollegealumnirelation, String stucollegeselffeeling, String stucollegedistinctessayurl, String stucollegescoreid) {
        this.stuid = stuid;
        this.collegeid = collegeid;
        this.stucollegemajor = stucollegemajor;
        this.stucollegescholarship = stucollegescholarship;
        this.stucollegealumnirelation = stucollegealumnirelation;
        this.stucollegeselffeeling = stucollegeselffeeling;
        this.stucollegedistinctessayurl = stucollegedistinctessayurl;
        this.stucollegescoreid = stucollegescoreid;
    }

    public StuCollege(Integer stucollegeid, Integer stuid, Integer collegeid, String stucollegemajor, Double stucollegescholarship, String stucollegealumnirelation, String stucollegeselffeeling, String stucollegedistinctessayurl, String stucollegescoreid) {
        this.stucollegeid = stucollegeid;
        this.stuid = stuid;
        this.collegeid = collegeid;
        this.stucollegemajor = stucollegemajor;
        this.stucollegescholarship = stucollegescholarship;
        this.stucollegealumnirelation = stucollegealumnirelation;
        this.stucollegeselffeeling = stucollegeselffeeling;
        this.stucollegedistinctessayurl = stucollegedistinctessayurl;
        this.stucollegescoreid = stucollegescoreid;
    }

    public Integer getStucollegeid() {
        return stucollegeid;
    }

    public void setStucollegeid(Integer stucollegeid) {
        this.stucollegeid = stucollegeid;
    }

    public Integer getStuid() {
        return stuid;
    }

    public void setStuid(Integer stuid) {
        this.stuid = stuid;
    }

    public Integer getCollegeid() {
        return collegeid;
    }

    public void setCollegeid(Integer collegeid) {
        this.collegeid = collegeid;
    }

    public String getStucollegemajor() {
        return stucollegemajor;
    }

    public void setStucollegemajor(String stucollegemajor) {
        this.stucollegemajor = stucollegemajor == null ? null : stucollegemajor.trim();
    }

    public Double getStucollegescholarship() {
        return stucollegescholarship;
    }

    public void setStucollegescholarship(Double stucollegescholarship) {
        this.stucollegescholarship = stucollegescholarship;
    }

    public String getStucollegealumnirelation() {
        return stucollegealumnirelation;
    }

    public void setStucollegealumnirelation(String stucollegealumnirelation) {
        this.stucollegealumnirelation = stucollegealumnirelation == null ? null : stucollegealumnirelation.trim();
    }

    public String getStucollegeselffeeling() {
        return stucollegeselffeeling;
    }

    public void setStucollegeselffeeling(String stucollegeselffeeling) {
        this.stucollegeselffeeling = stucollegeselffeeling == null ? null : stucollegeselffeeling.trim();
    }

    public String getStucollegedistinctessayurl() {
        return stucollegedistinctessayurl;
    }

    public void setStucollegedistinctessayurl(String stucollegedistinctessayurl) {
        this.stucollegedistinctessayurl = stucollegedistinctessayurl == null ? null : stucollegedistinctessayurl.trim();
    }
}