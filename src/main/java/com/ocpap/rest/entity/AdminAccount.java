package com.ocpap.rest.entity;

public class AdminAccount {
    private Integer amId;

    private Boolean uStatus;

    private String uLoginname;

    private String uPassword;

    private String amName;

    private String expiredate;

    private String mobile;

    private String lastLogindate;

    private String lastLoginip;

    private Integer visitCount;

    private String lastEdit;

    private String createdUser;

    private Integer agId;

    private String createdate;
    
    private String agName;

    private Integer type;

    private String job;

    private String unit;
    
    

	public String getAgName() {
		return agName;
	}

	public void setAgName(String agName) {
		this.agName = agName;
	}

	public Integer getAmId() {
		return amId;
	}

	public void setAmId(Integer amId) {
		this.amId = amId;
	}

	public Boolean getuStatus() {
		return uStatus;
	}

	public void setuStatus(Boolean uStatus) {
		this.uStatus = uStatus;
	}

	public String getuLoginname() {
		return uLoginname;
	}

	public void setuLoginname(String uLoginname) {
		this.uLoginname = uLoginname;
	}

	public String getuPassword() {
		return uPassword;
	}

	public void setuPassword(String uPassword) {
		this.uPassword = uPassword;
	}

	public String getAmName() {
		return amName;
	}

	public void setAmName(String amName) {
		this.amName = amName;
	}

	public String getExpiredate() {
		return expiredate;
	}

	public void setExpiredate(String expiredate) {
		this.expiredate = expiredate;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getLastLogindate() {
		return lastLogindate;
	}

	public void setLastLogindate(String lastLogindate) {
		this.lastLogindate = lastLogindate;
	}

	public String getLastLoginip() {
		return lastLoginip;
	}

	public void setLastLoginip(String lastLoginip) {
		this.lastLoginip = lastLoginip;
	}

	public Integer getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(Integer visitCount) {
		this.visitCount = visitCount;
	}

	public String getLastEdit() {
		return lastEdit;
	}

	public void setLastEdit(String lastEdit) {
		this.lastEdit = lastEdit;
	}

	public String getCreatedUser() {
		return createdUser;
	}

	public void setCreatedUser(String createdUser) {
		this.createdUser = createdUser;
	}

	public Integer getAgId() {
		return agId;
	}

	public void setAgId(Integer agId) {
		this.agId = agId;
	}

	public String getCreatedate() {
		return createdate;
	}

	public void setCreatedate(String createdate) {
		this.createdate = createdate;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getJob() {
		return job;
	}

	public void setJob(String job) {
		this.job = job;
	}

	public String getUnit() {
		return unit;
	}

	public void setUnit(String unit) {
		this.unit = unit;
	}

	@Override
	public String toString() {
		return "AdminAccount [amId=" + amId + ", uStatus=" + uStatus
				+ ", uLoginname=" + uLoginname + ", uPassword=" + uPassword
				+ ", amName=" + amName + ", expiredate=" + expiredate
				+ ", mobile=" + mobile + ", lastLogindate=" + lastLogindate
				+ ", lastLoginip=" + lastLoginip + ", visitCount=" + visitCount
				+ ", lastEdit=" + lastEdit + ", createdUser=" + createdUser
				+ ", agId=" + agId + ", createdate=" + createdate + "]";
	}

   
    
    
}