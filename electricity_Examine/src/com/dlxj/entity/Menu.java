package com.dlxj.entity;

public class Menu {
	private Integer MENU_ID;
	private String MENU_NAME;
	private String MENU_URL;
	private Integer MENU_STATE;
	private Integer MENU_FATHERID;
	private String MENU_CREATETIME;
	private String MENU_REMARK;
	private Integer MENU_DEL;
	private String USER_NAME;

	public Menu() {
		// TODO Auto-generated constructor stub
	}

	public Menu(Integer mENU_ID, String mENU_NAME, String mENU_URL,
			Integer mENU_STATE, Integer mENU_FATHERID, String mENU_CREATETIME,
			String mENU_REMARK, Integer mENU_DEL, String uSER_NAME) {
		super();
		MENU_ID = mENU_ID;
		MENU_NAME = mENU_NAME;
		MENU_URL = mENU_URL;
		MENU_STATE = mENU_STATE;
		MENU_FATHERID = mENU_FATHERID;
		MENU_CREATETIME = mENU_CREATETIME;
		MENU_REMARK = mENU_REMARK;
		MENU_DEL = mENU_DEL;
		USER_NAME = uSER_NAME;
	}

	public Integer getMENU_ID() {
		return MENU_ID;
	}

	public void setMENU_ID(Integer mENU_ID) {
		MENU_ID = mENU_ID;
	}

	public String getMENU_NAME() {
		return MENU_NAME;
	}

	public void setMENU_NAME(String mENU_NAME) {
		MENU_NAME = mENU_NAME;
	}

	public String getMENU_URL() {
		return MENU_URL;
	}

	public void setMENU_URL(String mENU_URL) {
		MENU_URL = mENU_URL;
	}

	public Integer getMENU_STATE() {
		return MENU_STATE;
	}

	public void setMENU_STATE(Integer mENU_STATE) {
		MENU_STATE = mENU_STATE;
	}

	public Integer getMENU_FATHERID() {
		return MENU_FATHERID;
	}

	public void setMENU_FATHERID(Integer mENU_FATHERID) {
		MENU_FATHERID = mENU_FATHERID;
	}

	public String getMENU_CREATETIME() {
		return MENU_CREATETIME;
	}

	public void setMENU_CREATETIME(String mENU_CREATETIME) {
		MENU_CREATETIME = mENU_CREATETIME;
	}

	public String getMENU_REMARK() {
		return MENU_REMARK;
	}

	public void setMENU_REMARK(String mENU_REMARK) {
		MENU_REMARK = mENU_REMARK;
	}

	public Integer getMENU_DEL() {
		return MENU_DEL;
	}

	public void setMENU_DEL(Integer mENU_DEL) {
		MENU_DEL = mENU_DEL;
	}

	public String getUSER_NAME() {
		return USER_NAME;
	}

	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}

}
