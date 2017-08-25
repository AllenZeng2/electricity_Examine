package com.dlxj.entity;

public class PageInfo {
	private Integer pageNum;
	private Integer pageSize;
	private Integer totlePage;
	private Integer totleCount;
	private Integer limit1;
	private Integer limit2;
	
	
	public PageInfo() {
		// TODO Auto-generated constructor stub
	}


	public PageInfo(Integer pageNum, Integer pageSize, Integer totlePage,
			Integer totleCount) {
		super();
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.totlePage = totlePage;
		this.totleCount = totleCount;
	}


	public PageInfo(Integer pageNum, Integer pageSize, Integer totlePage,
			Integer totleCount, Integer limit1, Integer limit2) {
		super();
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.totlePage = totlePage;
		this.totleCount = totleCount;
		this.limit1 = limit1;
		this.limit2 = limit2;
	}


	public Integer getPageNum() {
		return pageNum;
	}


	public void setPageNum(Integer pageNum) {
		this.pageNum = pageNum;
	}


	public Integer getPageSize() {
		return pageSize;
	}


	public void setPageSize(Integer pageSize) {
		this.pageSize = pageSize;
	}


	public Integer getTotlePage() {
		return totlePage;
	}


	public void setTotlePage(Integer totlePage) {
		this.totlePage = totlePage;
	}


	public Integer getTotleCount() {
		return totleCount;
	}


	public void setTotleCount(Integer totleCount) {
		this.totleCount = totleCount;
	}


	public Integer getLimit1() {
		return limit1;
	}


	public void setLimit1() {
		this.limit1 = (this.pageNum-1)*this.pageSize;
	}


	public Integer getLimit2() {
		return limit2;
	}


	public void setLimit2() {
		this.limit2 = this.pageNum*this.pageSize;
	}
	
	
}
