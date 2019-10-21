package domain;

import java.io.Serializable;
import java.util.Date;

/**
 * 学生选课
 */
public class StudentCourse implements Serializable {
    private String cid;//课程id
    private String cname;//课程名

    private String sid;//选课学生id
    private String sname;//选课学生姓名

    private String tid;//老师id
    private String tname;//教课老师姓名

    private int score;//分数

    public String getTid() {
        return tid;
    }

    public void setTid(String tid) {
        this.tid = tid;
    }

    public String getSname() {
        return sname;
    }

    public void setSname(String sname) {
        this.sname = sname;
    }

    public String getCid() {
        return cid;
    }

    public void setCid(String cid) {
        this.cid = cid;
    }

    public String getCname() {
        return cname;
    }

    public void setCname(String cname) {
        this.cname = cname;
    }

    public String getTname() {
        return tname;
    }

    public void setTname(String tname) {
        this.tname = tname;
    }

    public String getSid() {
        return sid;
    }

    public void setSid(String sid) {
        this.sid = sid;
    }

    public int getScore() {
        return score;
    }

    public void setScore(int score) {
        this.score = score;
    }
}
