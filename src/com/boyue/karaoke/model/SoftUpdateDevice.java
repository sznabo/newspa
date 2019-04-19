package com.boyue.karaoke.model;

/**
 * 
 */
public class SoftUpdateDevice implements java.io.Serializable {
	
	//
	private Integer id;
	
	//更新任务id
	private Integer softUpdateTaskId;
	
	// 设备id
	private Integer deviceId;
	
	
	// get set 方法
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getSoftUpdateTaskId() {
		return softUpdateTaskId;
	}
	
	public void setSoftUpdateTaskId(Integer softUpdateTaskId) {
		this.softUpdateTaskId = softUpdateTaskId;
	}
	public Integer getDeviceId() {
		return deviceId;
	}
	
	public void setDeviceId(Integer deviceId) {
		this.deviceId = deviceId;
	}
	
	
}