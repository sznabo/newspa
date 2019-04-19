package com.boyue.spa.domain;

import java.util.Date;

public class VodQueryDTO {
	//视频名称
	private String name;
	//上传日期起
	private Date upstarttime;
	//上传日期止
	private Date upendtime;
	//发布时间起
	private Date relstarttime;
	//发布时间止
	private Date relendtime;

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Date getUpstarttime() {
		return upstarttime;
	}

	public void setUpstarttime(Date upstarttime) {
		this.upstarttime = upstarttime;
	}

	public Date getUpendtime() {
		return upendtime;
	}

	public void setUpendtime(Date upendtime) {
		this.upendtime = upendtime;
	}

	public Date getRelstarttime() {
		return relstarttime;
	}

	public void setRelstarttime(Date relstarttime) {
		this.relstarttime = relstarttime;
	}

	public Date getRelendtime() {
		return relendtime;
	}

	public void setRelendtime(Date relendtime) {
		this.relendtime = relendtime;
	}
	

}
