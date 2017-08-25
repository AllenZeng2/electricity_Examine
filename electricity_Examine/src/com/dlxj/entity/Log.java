package com.dlxj.entity;

public class Log {
	private Integer LOG_ID;
	private String LOG_NAME;
	private String LOG_USERNAME;
	private String LOG_DOING;
	private String LOG_DATE;

	public Log() {
		// TODO Auto-generated constructor stub
	}

	public String getLOG_DATE() {
		return LOG_DATE;
	}

	public void setLOG_DATE(String lOG_DATE) {
		LOG_DATE = lOG_DATE;
	}

	public Log(Integer lOG_ID, String lOG_NAME, String lOG_USERNAME,
			String lOG_DOING, String lOG_DATE) {
		super();
		LOG_ID = lOG_ID;
		LOG_NAME = lOG_NAME;
		LOG_USERNAME = lOG_USERNAME;
		LOG_DOING = lOG_DOING;
		LOG_DATE = lOG_DATE;
	}

	public Integer getLOG_ID() {
		return LOG_ID;
	}

	public void setLOG_ID(Integer lOG_ID) {
		LOG_ID = lOG_ID;
	}

	public String getLOG_NAME() {
		return LOG_NAME;
	}

	public void setLOG_NAME(String lOG_NAME) {
		LOG_NAME = lOG_NAME;
	}

	public String getLOG_USERNAME() {
		return LOG_USERNAME;
	}

	public void setLOG_USERNAME(String lOG_USERNAME) {
		LOG_USERNAME = lOG_USERNAME;
	}

	public String getLOG_DOING() {
		return LOG_DOING;
	}

	public void setLOG_DOING(String lOG_DOING) {
		LOG_DOING = lOG_DOING;
	}

}
