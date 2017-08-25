package com.dlxj.entity;

public class Defect {

	private Integer DEFECT_ID;
	private String DEFECT_NAME;
	private Integer DEFECT_STATE;
	private Integer DEFECT_DEL;
	
	public Defect() {
		// TODO Auto-generated constructor stub
	}

	public Defect(Integer dEFECT_ID, String dEFECT_NAME, Integer dEFECT_STATE,
			Integer dEFECT_DEL) {
		super();
		DEFECT_ID = dEFECT_ID;
		DEFECT_NAME = dEFECT_NAME;
		DEFECT_STATE = dEFECT_STATE;
		DEFECT_DEL = dEFECT_DEL;
	}

	public Integer getDEFECT_ID() {
		return DEFECT_ID;
	}

	public void setDEFECT_ID(Integer dEFECT_ID) {
		DEFECT_ID = dEFECT_ID;
	}

	public String getDEFECT_NAME() {
		return DEFECT_NAME;
	}

	public void setDEFECT_NAME(String dEFECT_NAME) {
		DEFECT_NAME = dEFECT_NAME;
	}

	public Integer getDEFECT_STATE() {
		return DEFECT_STATE;
	}

	public void setDEFECT_STATE(Integer dEFECT_STATE) {
		DEFECT_STATE = dEFECT_STATE;
	}

	public Integer getDEFECT_DEL() {
		return DEFECT_DEL;
	}

	public void setDEFECT_DEL(Integer dEFECT_DEL) {
		DEFECT_DEL = dEFECT_DEL;
	}
	
	
	
}
