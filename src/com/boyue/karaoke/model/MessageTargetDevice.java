package com.boyue.karaoke.model;

/**
 * 
 */
public class MessageTargetDevice implements java.io.Serializable {
	
	//
	private Integer id;
	
	//消息id
	private Integer messageId;
	
	//设备id
	private Integer deviceId;
	
	
	// get set 方法
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getMessageId() {
		return messageId;
	}
	
	public void setMessageId(Integer messageId) {
		this.messageId = messageId;
	}
	public Integer getDeviceId() {
		return deviceId;
	}
	
	public void setDeviceId(Integer deviceId) {
		this.deviceId = deviceId;
	}
	
	
}