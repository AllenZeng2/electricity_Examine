package com.dlxj.entity;

public class RemovedefectCondition {

	private String task_number;
	private Integer task_status;
	private String line_name;
	private String user_id;
	private String task_begintime;
	private String task_endtime;
	
	public RemovedefectCondition() {
		// TODO Auto-generated constructor stub
	}

	public RemovedefectCondition(String task_number, Integer task_status,
			String user_id, String task_begintime, String task_endtime) {
		super();
		this.task_number = task_number;
		this.task_status = task_status;
		this.user_id = user_id;
		this.task_begintime = task_begintime;
		this.task_endtime = task_endtime;
	}

	public RemovedefectCondition(String task_number, String line_name,
			String user_id, String task_begintime, String task_endtime) {
		super();
		this.task_number = task_number;
		this.line_name = line_name;
		this.user_id = user_id;
		this.task_begintime = task_begintime;
		this.task_endtime = task_endtime;
	}
	
	

	public RemovedefectCondition(String task_number, Integer task_status,
			String line_name, String user_id, String task_begintime,
			String task_endtime) {
		super();
		this.task_number = task_number;
		this.task_status = task_status;
		this.line_name = line_name;
		this.user_id = user_id;
		this.task_begintime = task_begintime;
		this.task_endtime = task_endtime;
	}

	public String getTask_number() {
		return task_number;
	}

	public void setTask_number(String task_number) {
		this.task_number = task_number;
	}

	public Integer getTask_status() {
		return task_status;
	}

	public void setTask_status(Integer task_status) {
		this.task_status = task_status;
	}

	public String getLine_name() {
		return line_name;
	}

	public void setLine_name(String line_name) {
		this.line_name = line_name;
	}

	public String getUser_id() {
		return user_id;
	}

	public void setUser_id(String user_id) {
		this.user_id = user_id;
	}

	public String getTask_begintime() {
		return task_begintime;
	}

	public void setTask_begintime(String task_begintime) {
		this.task_begintime = task_begintime;
	}

	public String getTask_endtime() {
		return task_endtime;
	}

	public void setTask_endtime(String task_endtime) {
		this.task_endtime = task_endtime;
	}
	
}
