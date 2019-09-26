package com.ocpap.rest.entity;


public class QueryVo{

	private Integer agId;
	private String amName;
	//模块查询
	private String auName;
	//权限组查询
	private String agName;
	//素材查询
	private String amlName;

	private String name;

	private String ordernumber;
	
	private int isFul;
	
	private String type;
	//当前页
	private Integer page;
	//每页数
	private Integer size;
	
	//开始行
	private Integer startRow = 0;
	
	private Integer resultType;

	private Integer status;

	private Integer sstatus;

	public Integer getStatus() {
		return status;
	}

	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getSstatus() {
		return sstatus;
	}

	public void setSstatus(Integer sstatus) {
		this.sstatus = sstatus;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getResultType() {
		return resultType;
	}
	public void setResultType(Integer resultType) {
		this.resultType = resultType;
	}
	public int getIsFul() {
		return isFul;
	}
	public void setIsFul(int isFul) {
		this.isFul = isFul;
	}
	public Integer getAgId() {
		return agId;
	}
	public void setAgId(Integer agId) {
		this.agId = agId;
	}

	public String getAmName() {
		return amName;
	}
	public void setAmName(String amName) {
		this.amName = amName;
	}
	public Integer getPage() {
		return page;
	}
	public void setPage(Integer page) {
		this.page = page;
	}
	public Integer getSize() {
		return size;
	}
	public void setSize(Integer size) {
		this.size = size;
	}
	public Integer getStartRow() {
		return startRow;
	}
	public void setStartRow(Integer startRow) {
		this.startRow = startRow;
	}
	public String getAuName() {
		return auName;
	}
	public void setAuName(String auName) {
		this.auName = auName;
	}
	public String getAgName() {
		return agName;
	}
	public void setAgName(String agName) {
		this.agName = agName;
	}
	public String getAmlName() {
		return amlName;
	}
	public void setAmlName(String amlName) {
		this.amlName = amlName;
	}
	public String getType() {
		return type;
	}
	public void setType(String type) {
		this.type = type;
	}

	public String getOrdernumber() {
		return ordernumber;
	}

	public void setOrdernumber(String ordernumber) {
		this.ordernumber = ordernumber;
	}
}
