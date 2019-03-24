package com.ronghao.grade.bean;

import java.io.Serializable;

public class Grade implements Serializable {
    private String code;
    private String math;
    private String english;
    private String total;
    private String rank;
    private String econemy;
    private String politics;

    public String getCode() {
        return code;
    }

    public void setCode(String code) {
        this.code = code;
    }

    public String getMath() {
        return math;
    }

    public void setMath(String math) {
        this.math = math;
    }

    public String getEnglish() {
        return english;
    }

    public void setEnglish(String english) {
        this.english = english;
    }

    public String getTotal() {
        return total;
    }

    public void setTotal(String total) {
        this.total = total;
    }

    public String getRank() {
        return rank;
    }

    public void setRank(String rank) {
        this.rank = rank;
    }

    public String getEconemy() {
        return econemy;
    }

    public void setEconemy(String econemy) {
        this.econemy = econemy;
    }

    public String getPolitics() {
        return politics;
    }

    public void setPolitics(String politics) {
        this.politics = politics;
    }
}
