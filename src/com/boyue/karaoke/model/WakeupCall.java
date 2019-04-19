package com.boyue.karaoke.model;

import java.util.Date;


public class WakeupCall implements java.io.Serializable{
	
	private Integer id;
	private String wakeupTime;
	private Integer userid;
	private Device device;

	private Date createtime;   //终端请求时间
	private Date backTime;
	
	private Integer manageIf;   //返回已否
	private Integer backIf;
	private Date updatetime;    //处理时间
	
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}

	public String getWakeupTime() {
		return wakeupTime;
	}
	public void setWakeupTime(String wakeupTime) {
		this.wakeupTime = wakeupTime;
	}
	

	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Device getDevice() {
		return device;
	}
	public void setDevice(Device device) {
		this.device = device;
	}
	public Date getCreatetime() {
		return createtime;
	}
	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}
	public Integer getManageIf() {
		return manageIf;
	}
	public void setManageIf(Integer manageIf) {
		this.manageIf = manageIf;
	}
	public Integer getBackIf() {
		return backIf;
	}
	public void setBackIf(Integer backIf) {
		this.backIf = backIf;
	}
	public Date getUpdatetime() {
		return updatetime;
	}
	public void setUpdatetime(Date updatetime) {
		this.updatetime = updatetime;
	}
	public Date getBackTime() {
		return backTime;
	}
	public void setBackTime(Date backTime) {
		this.backTime = backTime;
	}

	
	
	
	
}
