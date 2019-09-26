package com.ocpap.rest.entity;

import java.util.List;


public class AdminMenu {
    private Integer auId;

    private String auName;

    private String auTitle;

    private Integer auLevel;

    private Integer auClickable;

    private Integer auPid;

    private Integer auSort;
    
    private Integer checked;
    
    private String auClass;
    
    private String auInfo;
    
    private  List<AdminMenu> sub_list;
    
    public Integer getAuId() {
        return auId;
    }

    public void setAuId(Integer auId) {
        this.auId = auId;
    }

    public String getAuName() {
        return auName;
    }

    public void setAuName(String auName) {
        this.auName = auName == null ? null : auName.trim();
    }

    public String getAuTitle() {
        return auTitle;
    }

    public void setAuTitle(String auTitle) {
        this.auTitle = auTitle == null ? null : auTitle.trim();
    }


    public Integer getAuPid() {
        return auPid;
    }

    public void setAuPid(Integer auPid) {
        this.auPid = auPid;
    }

    public Integer getAuSort() {
        return auSort;
    }

    public void setAuSort(Integer auSort) {
        this.auSort = auSort;
    }

	public List<AdminMenu> getSub_list() {
		return sub_list;
	}

	public void setSub_list(List<AdminMenu> sub_list) {
		this.sub_list = sub_list;
	}

	@Override
	public String toString() {
		return "AdminMenu [auId=" + auId + ", auName=" + auName + ", auTitle="
				+ auTitle + ", auLevel=" + getAuLevel() + ", auClickable="
				+ getAuClickable() + ", auPid=" + auPid + ", auSort=" + auSort
				+ ", sub_list=" + sub_list + "]";
	}

	public Integer getChecked() {
		return checked;
	}

	public void setChecked(Integer checked) {
		this.checked = checked;
	}

	public Integer getAuClickable() {
		return auClickable;
	}

	public void setAuClickable(Integer auClickable) {
		this.auClickable = auClickable;
	}

	public Integer getAuLevel() {
		return auLevel;
	}

	public void setAuLevel(Integer auLevel) {
		this.auLevel = auLevel;
	}

	public String getAuClass() {
		return auClass;
	}

	public void setAuClass(String auClass) {
		this.auClass = auClass;
	}

	public String getAuInfo() {
		return auInfo;
	}

	public void setAuInfo(String auInfo) {
		this.auInfo = auInfo;
	}
	
}