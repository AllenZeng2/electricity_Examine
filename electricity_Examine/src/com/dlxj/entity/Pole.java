package com.dlxj.entity;

public class Pole {
	private Integer POLE_ID;
	private Integer LINE_ID;
	private String POLE_NUMBER;
	private Integer TASK_ID;
	
	private Line line;
	private Task task;
	
	public Pole() {
		// TODO Auto-generated constructor stub
	}
	
	public Pole(Integer pOLE_ID, Integer lINE_ID, String pOLE_NUMBER,
			Integer tASK_ID) {
		super();
		POLE_ID = pOLE_ID;
		LINE_ID = lINE_ID;
		POLE_NUMBER = pOLE_NUMBER;
		TASK_ID = tASK_ID;
	}

	public Pole(Integer pOLE_ID, Integer lINE_ID, String pOLE_NUMBER,
			Integer tASK_ID, Line line, Task task) {
		super();
		POLE_ID = pOLE_ID;
		LINE_ID = lINE_ID;
		POLE_NUMBER = pOLE_NUMBER;
		TASK_ID = tASK_ID;
		this.line = line;
		this.task = task;
	}

	public Integer getPOLE_ID() {
		return POLE_ID;
	}

	public void setPOLE_ID(Integer pOLE_ID) {
		POLE_ID = pOLE_ID;
	}

	public Integer getLINE_ID() {
		return LINE_ID;
	}

	public void setLINE_ID(Integer lINE_ID) {
		LINE_ID = lINE_ID;
	}

	public String getPOLE_NUMBER() {
		return POLE_NUMBER;
	}

	public void setPOLE_NUMBER(String pOLE_NUMBER) {
		POLE_NUMBER = pOLE_NUMBER;
	}

	public Integer getTASK_ID() {
		return TASK_ID;
	}

	public void setTASK_ID(Integer tASK_ID) {
		TASK_ID = tASK_ID;
	}

	public Line getLine() {
		return line;
	}

	public void setLine(Line line) {
		this.line = line;
	}

	public Task getTask() {
		return task;
	}

	public void setTask(Task task) {
		this.task = task;
	}

	@Override
	public String toString() {
		return "Pole [POLE_ID=" + POLE_ID + ", LINE_ID=" + LINE_ID
				+ ", POLE_NUMBER=" + POLE_NUMBER + ", TASK_ID=" + TASK_ID + "]";
	}

	
	

}
