package com.dlxj.entity;

import java.util.List;

public class Users {
	private Integer USER_ID;
	private Integer ROLE_ID;
	private String USER_NAME;
	private String USER_LOGINNAME;
	private String USER_PASSWORD;
	private String USER_INTIME;
	private String USER_OUTTIME;
	private Integer USER_STATE;
	private String USER_LOGINTIME;
	private String USER_EMAIL;
	private String USER_REMARK;
	private Integer USER_AGE;
	private String USER_PHONE;
	private Integer USER_SEX;
	private Integer USER_DEL;

	private Role roles;

	private List<Log> logs;

	public List<Log> getLogs() {
		return logs;
	}

	public void setLogs(List<Log> logs) {
		this.logs = logs;
	}

	public Users(Integer uSER_ID, Integer rOLE_ID, String uSER_NAME,
			String uSER_LOGINNAME, String uSER_PASSWORD, String uSER_INTIME,
			String uSER_OUTTIME, Integer uSER_STATE, String uSER_LOGINTIME,
			String uSER_EMAIL, String uSER_REMARK, Integer uSER_AGE,
			String uSER_PHONE, Integer uSER_SEX, Integer uSER_DEL, Role roles,
			List<Log> logs) {
		super();
		USER_ID = uSER_ID;
		ROLE_ID = rOLE_ID;
		USER_NAME = uSER_NAME;
		USER_LOGINNAME = uSER_LOGINNAME;
		USER_PASSWORD = uSER_PASSWORD;
		USER_INTIME = uSER_INTIME;
		USER_OUTTIME = uSER_OUTTIME;
		USER_STATE = uSER_STATE;
		USER_LOGINTIME = uSER_LOGINTIME;
		USER_EMAIL = uSER_EMAIL;
		USER_REMARK = uSER_REMARK;
		USER_AGE = uSER_AGE;
		USER_PHONE = uSER_PHONE;
		USER_SEX = uSER_SEX;
		USER_DEL = uSER_DEL;
		this.roles = roles;
		this.logs = logs;
	}

	public Users() {
		// TODO Auto-generated constructor stub
	}

	public Users(Integer uSER_ID, Integer rOLE_ID, String uSER_NAME,
			String uSER_LOGINNAME, String uSER_PASSWORD, String uSER_INTIME,
			String uSER_OUTTIME, Integer uSER_STATE, String uSER_LOGINTIME,
			String uSER_EMAIL, String uSER_REMARK, Integer uSER_AGE,
			String uSER_PHONE, Integer uSER_SEX, Integer uSER_DEL) {
		super();
		USER_ID = uSER_ID;
		ROLE_ID = rOLE_ID;
		USER_NAME = uSER_NAME;
		USER_LOGINNAME = uSER_LOGINNAME;
		USER_PASSWORD = uSER_PASSWORD;
		USER_INTIME = uSER_INTIME;
		USER_OUTTIME = uSER_OUTTIME;
		USER_STATE = uSER_STATE;
		USER_LOGINTIME = uSER_LOGINTIME;
		USER_EMAIL = uSER_EMAIL;
		USER_REMARK = uSER_REMARK;
		USER_AGE = uSER_AGE;
		USER_PHONE = uSER_PHONE;
		USER_SEX = uSER_SEX;
		USER_DEL = uSER_DEL;
	}

	public Users(Integer uSER_ID, Integer rOLE_ID, String uSER_NAME,
			String uSER_LOGINNAME, String uSER_PASSWORD, String uSER_INTIME,
			String uSER_OUTTIME, Integer uSER_STATE, String uSER_LOGINTIME,
			String uSER_EMAIL, String uSER_REMARK, Integer uSER_AGE,
			String uSER_PHONE, Integer uSER_SEX, Integer uSER_DEL, Role roles) {
		super();
		USER_ID = uSER_ID;
		ROLE_ID = rOLE_ID;
		USER_NAME = uSER_NAME;
		USER_LOGINNAME = uSER_LOGINNAME;
		USER_PASSWORD = uSER_PASSWORD;
		USER_INTIME = uSER_INTIME;
		USER_OUTTIME = uSER_OUTTIME;
		USER_STATE = uSER_STATE;
		USER_LOGINTIME = uSER_LOGINTIME;
		USER_EMAIL = uSER_EMAIL;
		USER_REMARK = uSER_REMARK;
		USER_AGE = uSER_AGE;
		USER_PHONE = uSER_PHONE;
		USER_SEX = uSER_SEX;
		USER_DEL = uSER_DEL;
		this.roles = roles;
	}

	public Integer getUSER_ID() {
		return USER_ID;
	}

	public void setUSER_ID(Integer uSER_ID) {
		USER_ID = uSER_ID;
	}

	public Integer getROLE_ID() {
		return ROLE_ID;
	}

	public void setROLE_ID(Integer rOLE_ID) {
		ROLE_ID = rOLE_ID;
	}

	public String getUSER_NAME() {
		return USER_NAME;
	}

	public void setUSER_NAME(String uSER_NAME) {
		USER_NAME = uSER_NAME;
	}

	public String getUSER_LOGINNAME() {
		return USER_LOGINNAME;
	}

	public void setUSER_LOGINNAME(String uSER_LOGINNAME) {
		USER_LOGINNAME = uSER_LOGINNAME;
	}

	public String getUSER_PASSWORD() {
		return USER_PASSWORD;
	}

	public void setUSER_PASSWORD(String uSER_PASSWORD) {
		USER_PASSWORD = uSER_PASSWORD;
	}

	public String getUSER_INTIME() {
		return USER_INTIME;
	}

	public void setUSER_INTIME(String uSER_INTIME) {
		USER_INTIME = uSER_INTIME;
	}

	public String getUSER_OUTTIME() {
		return USER_OUTTIME;
	}

	public void setUSER_OUTTIME(String uSER_OUTTIME) {
		USER_OUTTIME = uSER_OUTTIME;
	}

	public Integer getUSER_STATE() {
		return USER_STATE;
	}

	public void setUSER_STATE(Integer uSER_STATE) {
		USER_STATE = uSER_STATE;
	}

	public String getUSER_LOGINTIME() {
		return USER_LOGINTIME;
	}

	public void setUSER_LOGINTIME(String uSER_LOGINTIME) {
		USER_LOGINTIME = uSER_LOGINTIME;
	}

	public String getUSER_EMAIL() {
		return USER_EMAIL;
	}

	public void setUSER_EMAIL(String uSER_EMAIL) {
		USER_EMAIL = uSER_EMAIL;
	}

	public String getUSER_REMARK() {
		return USER_REMARK;
	}

	public void setUSER_REMARK(String uSER_REMARK) {
		USER_REMARK = uSER_REMARK;
	}

	public Integer getUSER_AGE() {
		return USER_AGE;
	}

	public void setUSER_AGE(Integer uSER_AGE) {
		USER_AGE = uSER_AGE;
	}

	public String getUSER_PHONE() {
		return USER_PHONE;
	}

	public void setUSER_PHONE(String uSER_PHONE) {
		USER_PHONE = uSER_PHONE;
	}

	public Integer getUSER_SEX() {
		return USER_SEX;
	}

	public void setUSER_SEX(Integer uSER_SEX) {
		USER_SEX = uSER_SEX;
	}

	public Integer getUSER_DEL() {
		return USER_DEL;
	}

	public void setUSER_DEL(Integer uSER_DEL) {
		USER_DEL = uSER_DEL;
	}

	public Role getRoles() {
		return roles;
	}

	public void setRoles(Role roles) {
		this.roles = roles;
	}

}
