package com.dlxj.entity;

public class Task {
	private Integer TASK_ID;
	private Integer LINE_ID;
	private String TASK_NUMBER;
	private String TASK_NAME;
	private String TASK_BEGINTIME;
	private Integer TASK_STATIC;
	private String TASK_USERNAME;
	private Integer TASK_DEL;
	private String TASK_ENDDATE;
	private String TASK_REMARK;
	private String TASK_ENDPOLE;
	private String GIVE_USERNAME;
	private String TASK_BEGINPOLE;
	private Integer TASK_STATE;
	
	private Line line;
	private Receipt receipt;
	
	public Task() {
		// TODO Auto-generated constructor stub
	}

	public Task(Integer tASK_ID, Integer lINE_ID, String tASK_NUMBER,
			String tASK_NAME, String tASK_BEGINTIME, Integer tASK_STATIC,
			String tASK_USERNAME, Integer tASK_DEL, String tASK_ENDDATE,
			String tASK_REMARK, String tASK_ENDPOLE, String gIVE_USERNAME,
			String tASK_BEGINPOLE, Integer tASK_STATE) {
		super();
		TASK_ID = tASK_ID;
		LINE_ID = lINE_ID;
		TASK_NUMBER = tASK_NUMBER;
		TASK_NAME = tASK_NAME;
		TASK_BEGINTIME = tASK_BEGINTIME;
		TASK_STATIC = tASK_STATIC;
		TASK_USERNAME = tASK_USERNAME;
		TASK_DEL = tASK_DEL;
		TASK_ENDDATE = tASK_ENDDATE;
		TASK_REMARK = tASK_REMARK;
		TASK_ENDPOLE = tASK_ENDPOLE;
		GIVE_USERNAME = gIVE_USERNAME;
		TASK_BEGINPOLE = tASK_BEGINPOLE;
		TASK_STATE = tASK_STATE;
	}
	
	public Task(Integer tASK_ID, Integer lINE_ID, String tASK_NUMBER,
			String tASK_NAME, String tASK_BEGINTIME, Integer tASK_STATIC,
			String tASK_USERNAME, Integer tASK_DEL, String tASK_ENDDATE,
			String tASK_REMARK, String tASK_ENDPOLE, String gIVE_USERNAME,
			String tASK_BEGINPOLE, Integer tASK_STATE, Line line,
			Receipt receipt) {
		super();
		TASK_ID = tASK_ID;
		LINE_ID = lINE_ID;
		TASK_NUMBER = tASK_NUMBER;
		TASK_NAME = tASK_NAME;
		TASK_BEGINTIME = tASK_BEGINTIME;
		TASK_STATIC = tASK_STATIC;
		TASK_USERNAME = tASK_USERNAME;
		TASK_DEL = tASK_DEL;
		TASK_ENDDATE = tASK_ENDDATE;
		TASK_REMARK = tASK_REMARK;
		TASK_ENDPOLE = tASK_ENDPOLE;
		GIVE_USERNAME = gIVE_USERNAME;
		TASK_BEGINPOLE = tASK_BEGINPOLE;
		TASK_STATE = tASK_STATE;
		this.line = line;
		this.receipt = receipt;
	}

	public Integer getTASK_ID() {
		return TASK_ID;
	}

	public void setTASK_ID(Integer tASK_ID) {
		TASK_ID = tASK_ID;
	}

	public Integer getLINE_ID() {
		return LINE_ID;
	}

	public void setLINE_ID(Integer lINE_ID) {
		LINE_ID = lINE_ID;
	}

	public String getTASK_NUMBER() {
		return TASK_NUMBER;
	}

	public void setTASK_NUMBER(String tASK_NUMBER) {
		TASK_NUMBER = tASK_NUMBER;
	}

	public String getTASK_NAME() {
		return TASK_NAME;
	}

	public void setTASK_NAME(String tASK_NAME) {
		TASK_NAME = tASK_NAME;
	}

	public String getTASK_BEGINTIME() {
		return TASK_BEGINTIME;
	}

	public void setTASK_BEGINTIME(String tASK_BEGINTIME) {
		TASK_BEGINTIME = tASK_BEGINTIME;
	}

	public Integer getTASK_STATIC() {
		return TASK_STATIC;
	}

	public void setTASK_STATIC(Integer tASK_STATIC) {
		TASK_STATIC = tASK_STATIC;
	}

	public String getTASK_USERNAME() {
		return TASK_USERNAME;
	}

	public void setTASK_USERNAME(String tASK_USERNAME) {
		TASK_USERNAME = tASK_USERNAME;
	}

	public Integer getTASK_DEL() {
		return TASK_DEL;
	}

	public void setTASK_DEL(Integer tASK_DEL) {
		TASK_DEL = tASK_DEL;
	}

	public String getTASK_ENDDATE() {
		return TASK_ENDDATE;
	}

	public void setTASK_ENDDATE(String tASK_ENDDATE) {
		TASK_ENDDATE = tASK_ENDDATE;
	}

	public String getTASK_REMARK() {
		return TASK_REMARK;
	}

	public void setTASK_REMARK(String tASK_REMARK) {
		TASK_REMARK = tASK_REMARK;
	}

	public String getTASK_ENDPOLE() {
		return TASK_ENDPOLE;
	}

	public void setTASK_ENDPOLE(String tASK_ENDPOLE) {
		TASK_ENDPOLE = tASK_ENDPOLE;
	}

	public String getGIVE_USERNAME() {
		return GIVE_USERNAME;
	}

	public void setGIVE_USERNAME(String gIVE_USERNAME) {
		GIVE_USERNAME = gIVE_USERNAME;
	}

	public String getTASK_BEGINPOLE() {
		return TASK_BEGINPOLE;
	}

	public void setTASK_BEGINPOLE(String tASK_BEGINPOLE) {
		TASK_BEGINPOLE = tASK_BEGINPOLE;
	}

	public Integer getTASK_STATE() {
		return TASK_STATE;
	}

	public void setTASK_STATE(Integer tASK_STATE) {
		TASK_STATE = tASK_STATE;
	}

	public Line getLine() {
		return line;
	}

	public void setLine(Line line) {
		this.line = line;
	}

	public Receipt getReceipt() {
		return receipt;
	}

	public void setReceipt(Receipt receipt) {
		this.receipt = receipt;
	}
	
	
	
}
