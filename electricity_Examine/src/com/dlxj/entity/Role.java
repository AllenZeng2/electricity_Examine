package com.dlxj.entity;

import java.util.List;

public class Role {
	private Integer ROLE_ID;
	private String ROLE_NAME;
	private Integer ROLE_STATE;
	private String ROLE_CREATETIME;
	private String ROLE_UPDATETIME;
	private String ROLE_NUMBER;
	private Integer ROLE_DEL;
	private String USER_NAME;
	private List<Menu> menus;

	public Role() {
		// TODO Auto-generated constructor stub
	}

	public Role(Integer rOLE_ID, String rOLE_NAME, Integer rOLE_STATE,
			String rOLE_CREATETIME, String rOLE_UPDATETIME,
			String rOLE_NUMBER, Integer rOLE_DEL, String uSER_NAME) {
		super();
		ROLE_ID = rOLE_ID;
		ROLE_NAME = rOLE_NAME;
		ROLE_STATE = rOLE_STATE;
		ROLE_CREATETIME = rOLE_CREATETIME;
		ROLE_UPDATETIME = rOLE_UPDATETIME;
		ROLE_NUMBER = rOLE_NUMBER;
		ROLE_DEL = rOLE_DEL;
		USER_NAME = uSER_NAME;
	}

	public Role(Integer rOLE_ID, String rOLE_NAME, Integer rOLE_STATE,
			String rOLE_CREATETIME, String rOLE_UPDATETIME,
			String rOLE_NUMBER, Integer rOLE_DEL, String uSER_NAME,
			List<Menu> menus) {
		super();
		ROLE_ID = rOLE_ID;
		ROLE_NAME = rOLE_NAME;
		ROLE_STATE = rOLE_STATE;
		ROLE_CREATETIME = rOLE_CREATETIME;
		ROLE_UPDATETIME = rOLE_UPDATETIME;
		ROLE_NUMBER = rOLE_NUMBER;
		ROLE_DEL = rOLE_DEL;
		USER_NAME = uSER_NAME;
		this.menus = menus;
	}

	public Integer getROLE_ID() {
		return ROLE_ID;
	}

	public void setROLE_ID(Integer rOLE_ID) {
		ROLE_ID = rOLE_ID;
	}

	public String getROLE_NAME() {
		return ROLE_NAME;
	}

	public void setROLE_NAME(String rOLE_NAME) {
		ROLE_NAME = rOLE_NAME;
	}

	public Integer getROLE_STATE() {
		return ROLE_STATE;
	}

	public void setROLE_STATE(Integer rOLE_STATE) {
		ROLE_STATE = rOLE_STATE;
	}

	public String getROLE_CREATETIME() {
		return ROLE_CREATETIME;
	}

	public void setROLE_CREATETIME(String rOLE_CREATETIME) {
		ROLE_CREATETIME = rOLE_CREATETIME;
	}

	public String getROLE_UPDATETIME() {
		return ROLE_UPDATETIME;
	}

	public void setROLE_UPDATETIME(String rOLE_UPDATETIME) {
		ROLE_UPDATETIME = rOLE_UPDATETIME;
	}

	public String getROLE_NUMBER() {
		return ROLE_NUMBER;
	}

	public void setROLE_NUMBER(String rOLE_NUMBER) {
		ROLE_NUMBER = rOLE_NUMBER;
	}

	public Integer getROLE_DEL() {
		return ROLE_DEL;
	}

	public void setROLE_DEL(Integer rOLE_DEL) {
		ROLE_DEL = rOLE_DEL;
	}

	public String getUSER_NAME() {
		return USER_NAME;
	}

	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}

	public List<Menu> getMenus() {
		return menus;
	}

	public void setMenus(List<Menu> menus) {
		this.menus = menus;
	}

}
