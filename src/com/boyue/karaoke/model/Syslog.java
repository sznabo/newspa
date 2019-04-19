package com.boyue.karaoke.model;

import java.util.Date;

/**
 * Syslog entity. @author MyEclipse Persistence Tools
 */

public class Syslog implements java.io.Serializable {
	//用户操作
	public static final int  USER_OPERATE = 1;
	//系统操作
	public static final int  SYS_OPERATE = 2;
	// Fields

	private Integer id;
	private Integer type;
	private String operate;
	private String ip;
	private String operator;
	private Date time;
	private String remark;

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getType() {
		return this.type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public String getOperate() {
		return this.operate;
	}

	public void setOperate(String operate) {
		this.operate = operate;
	}

	public String getIp() {
		return this.ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	public String getOperator() {
		return this.operator;
	}

	public void setOperator(String operator) {
		this.operator = operator;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}


}