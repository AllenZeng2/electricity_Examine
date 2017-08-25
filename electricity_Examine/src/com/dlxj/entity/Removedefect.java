package com.dlxj.entity;

public class Removedefect {

	private Integer task_id;	//主键
	private String task_name;	//任务名称
	private String task_desc;	//任务描述
	private Integer task_status;	//任务状态  1 未分配 2已分配 3执行中 4已完成
	private String task_begintime;	//任务下发时间
	private String task_endtime;	//任务结束时间
	private String giveperson_name;	//下发人姓名
	private String xqperson_name;	//消缺员姓名
	private Integer line_id;	//线路编号
	private String receiptids;	//任务中分配的有缺陷的塔杆编号
	private Integer task_del;	//任务是否取消   0否 1 是
	private String update_time;	//任务完成时间
	private String finish_desc;	//任务完成描述
	private String task_number;	//任务编号
	
	private Line line;
	
	private Receipt receipt;
	
	public Removedefect() {
		// TODO Auto-generated constructor stub
	}

	public Removedefect(Integer task_id, String task_name, String task_desc,
			Integer task_status, String task_begintime, String task_endtime,
			String giveperson_name, String xqperson_name, Integer line_id,
			String receiptids, Integer task_del, String update_time,
			String finish_desc, String task_number) {
		super();
		this.task_id = task_id;
		this.task_name = task_name;
		this.task_desc = task_desc;
		this.task_status = task_status;
		this.task_begintime = task_begintime;
		this.task_endtime = task_endtime;
		this.giveperson_name = giveperson_name;
		this.xqperson_name = xqperson_name;
		this.line_id = line_id;
		this.receiptids = receiptids;
		this.task_del = task_del;
		this.update_time = update_time;
		this.finish_desc = finish_desc;
		this.task_number = task_number;
	}

	public Removedefect(Integer task_id, String task_name, String task_desc,
			Integer task_status, String task_begintime, String task_endtime,
			String giveperson_name, String xqperson_name, Integer line_id,
			String receiptids, Integer task_del, String update_time,
			String finish_desc, String task_number, Line line) {
		super();
		this.task_id = task_id;
		this.task_name = task_name;
		this.task_desc = task_desc;
		this.task_status = task_status;
		this.task_begintime = task_begintime;
		this.task_endtime = task_endtime;
		this.giveperson_name = giveperson_name;
		this.xqperson_name = xqperson_name;
		this.line_id = line_id;
		this.receiptids = receiptids;
		this.task_del = task_del;
		this.update_time = update_time;
		this.finish_desc = finish_desc;
		this.task_number = task_number;
		this.line = line;
	}
	
	

	public Removedefect(Integer task_id, String task_name, String task_desc,
			Integer task_status, String task_begintime, String task_endtime,
			String giveperson_name, String xqperson_name, Integer line_id,
			String receiptids, Integer task_del, String update_time,
			String finish_desc, String task_number, Receipt receipt) {
		super();
		this.task_id = task_id;
		this.task_name = task_name;
		this.task_desc = task_desc;
		this.task_status = task_status;
		this.task_begintime = task_begintime;
		this.task_endtime = task_endtime;
		this.giveperson_name = giveperson_name;
		this.xqperson_name = xqperson_name;
		this.line_id = line_id;
		this.receiptids = receiptids;
		this.task_del = task_del;
		this.update_time = update_time;
		this.finish_desc = finish_desc;
		this.task_number = task_number;
		this.receipt = receipt;
	}
	
	

	public Removedefect(Integer task_id, String task_name, String task_desc,
			Integer task_status, String task_begintime, String task_endtime,
			String giveperson_name, String xqperson_name, Integer line_id,
			String receiptids, Integer task_del, String update_time,
			String finish_desc, String task_number, Line line, Receipt receipt) {
		super();
		this.task_id = task_id;
		this.task_name = task_name;
		this.task_desc = task_desc;
		this.task_status = task_status;
		this.task_begintime = task_begintime;
		this.task_endtime = task_endtime;
		this.giveperson_name = giveperson_name;
		this.xqperson_name = xqperson_name;
		this.line_id = line_id;
		this.receiptids = receiptids;
		this.task_del = task_del;
		this.update_time = update_time;
		this.finish_desc = finish_desc;
		this.task_number = task_number;
		this.line = line;
		this.receipt = receipt;
	}

	public Integer getTask_id() {
		return task_id;
	}

	public void setTask_id(Integer task_id) {
		this.task_id = task_id;
	}

	public String getTask_name() {
		return task_name;
	}

	public void setTask_name(String task_name) {
		this.task_name = task_name;
	}

	public String getTask_desc() {
		return task_desc;
	}

	public void setTask_desc(String task_desc) {
		this.task_desc = task_desc;
	}

	public Integer getTask_status() {
		return task_status;
	}

	public void setTask_status(Integer task_status) {
		this.task_status = task_status;
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

	public String getGiveperson_name() {
		return giveperson_name;
	}

	public void setGiveperson_name(String giveperson_name) {
		this.giveperson_name = giveperson_name;
	}

	public String getXqperson_name() {
		return xqperson_name;
	}

	public void setXqperson_name(String xqperson_name) {
		this.xqperson_name = xqperson_name;
	}

	public Integer getLine_id() {
		return line_id;
	}

	public void setLine_id(Integer line_id) {
		this.line_id = line_id;
	}

	public String getReceiptids() {
		return receiptids;
	}

	public void setReceiptids(String receiptids) {
		this.receiptids = receiptids;
	}

	public Integer getTask_del() {
		return task_del;
	}

	public void setTask_del(Integer task_del) {
		this.task_del = task_del;
	}

	public String getUpdate_time() {
		return update_time;
	}

	public void setUpdate_time(String update_time) {
		this.update_time = update_time;
	}

	public String getFinish_desc() {
		return finish_desc;
	}

	public void setFinish_desc(String finish_desc) {
		this.finish_desc = finish_desc;
	}

	public String getTask_number() {
		return task_number;
	}

	public void setTask_number(String task_number) {
		this.task_number = task_number;
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
