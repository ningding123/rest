package com.ocpap.rest.entity;

public class Student {

    private Integer id;

    private String name;

    private Integer sex;

    private String  year;

    private String company;

    private Integer type;

    private String eyear;

    private String phone;

    private String studentdesc;

    public Integer getId() {
        return id;
    }

    public void setId(Integer id) {
        this.id = id;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public Integer getSex() {
        return sex;
    }

    public void setSex(Integer sex) {
        this.sex = sex;
    }

    public String getYear() {
        return year;
    }

    public void setYear(String year) {
        this.year = year;
    }

    public String getCompany() {
        return company;
    }

    public void setCompany(String company) {
        this.company = company;
    }

    public Integer getType() {
        return type;
    }

    public void setType(Integer type) {
        this.type = type;
    }

    public String getEyear() {
        return eyear;
    }

    public void setEyear(String eyear) {
        this.eyear = eyear;
    }

    public String getPhone() {
        return phone;
    }

    public void setPhone(String phone) {
        this.phone = phone;
    }

    public String getStudentdesc() {
        return studentdesc;
    }

    public void setStudentdesc(String studentdesc) {
        this.studentdesc = studentdesc;
    }
}
