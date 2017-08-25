package com.dlxj.entity;

public class PageInfo2 {
	private int pageNum;// 当前页
	private int pageSize;// 每页多少条
	private int totalCount;// 总条数
	private int totalPage;// 总页数
	private int limit1;// （pageNum-1）*pageSize
	private int limit2;

	public int getLimit2() {
		return limit2;
	}

	public void setLimit2(int limit2) {
		this.limit2 = limit2;
	}

	public void setLimit1(int limit1) {
		this.limit1 = limit1;
	}

	public PageInfo2() {
		// TODO Auto-generated constructor stub
	}

	public PageInfo2(int pageNum, int pageSize, int totalCount, int totalPage) {
		super();
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.totalPage = totalPage;
	}

	public PageInfo2(int pageNum, int pageSize, int totalCount, int totalPage,
			int limit1) {
		super();
		this.pageNum = pageNum;
		this.pageSize = pageSize;
		this.totalCount = totalCount;
		this.totalPage = totalPage;
		this.limit1 = limit1;
	}

	public int getPageNum() {
		return pageNum;
	}

	public void setPageNum(int pageNum) {
		this.pageNum = pageNum;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public int getTotalCount() {
		return totalCount;
	}

	public void setTotalCount(int totalCount) {
		this.totalCount = totalCount;
	}

	public int getTotalPage() {
		return totalPage;
	}

	public void setTotalPage(int totalPage) {
		this.totalPage = totalPage;
	}

	public int getLimit1() {
		return limit1;
	}

}
