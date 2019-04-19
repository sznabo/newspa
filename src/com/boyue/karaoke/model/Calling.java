package com.boyue.karaoke.model;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class Calling implements Serializable {

	private  Integer id;			//呼叫ID
	private  Integer userid;		//设备外键ID
	private  Date  time;		//呼叫时间，即创建时间
	private  Integer status;		//呼叫状态：1新增，2 已经查看
	private Integer counts;
	private Device device;
	
	public Device getDevice() {
		return device;
	}
	public void setDevice(Device device) {
		this.device = device;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getCounts() {
		return counts;
	}
	public void setCounts(Integer counts) {
		this.counts = counts;
	}
	
}
