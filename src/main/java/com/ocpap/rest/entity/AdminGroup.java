package com.ocpap.rest.entity;

public class AdminGroup {
    private Integer agId;

    private String agName;

    private String agInfo;

    private Boolean agStatus;

    private String agAuth;

    public Integer getAgId() {
        return agId;
    }

    public void setAgId(Integer agId) {
        this.agId = agId;
    }

    public String getAgName() {
        return agName;
    }

    public void setAgName(String agName) {
        this.agName = agName == null ? null : agName.trim();
    }

    public String getAgInfo() {
        return agInfo;
    }

    public void setAgInfo(String agInfo) {
        this.agInfo = agInfo == null ? null : agInfo.trim();
    }

    public Boolean getAgStatus() {
        return agStatus;
    }

    public void setAgStatus(Boolean agStatus) {
        this.agStatus = agStatus;
    }

    public String getAgAuth() {
        return agAuth;
    }

    public void setAgAuth(String agAuth) {
        this.agAuth = agAuth == null ? null : agAuth.trim();
    }
}