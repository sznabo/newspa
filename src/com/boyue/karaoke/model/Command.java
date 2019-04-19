package com.boyue.karaoke.model;

/**
 * 
 */
public class Command implements java.io.Serializable {
	//新建
	public static final int CREATED = 1;
	//执行失败
	public static final int FAIL = 2;
	//执行成功
	public static final int SUCCESS = 3;
	//已经接收
	public static final int RECEIVED = 4;
	
	/**
	 * 命令类型
	 * @author Administrator
	 *
	 */
	public static class  Type {
		//节目单更新
		public static final int UPDATE_PROGRAM = 1;
	}
	
	private Integer id;
	
	//设备id
	private Integer deviceid;
	
	//指令类型:
	private Integer command;
	
	//
	private java.util.Date createTime;
	
	//执行时间
	private java.util.Date executeTime;
	
	//描述
	private String description;
	
	//状态: 1未执行, 2执行失败,3 执行成功
	private Integer status;
	//执行结果描述
	private String executeResult;
	// get set 方法
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getDeviceid() {
		return deviceid;
	}
	
	public void setDeviceid(Integer deviceid) {
		this.deviceid = deviceid;
	}
	public Integer getCommand() {
		return command;
	}
	
	public void setCommand(Integer command) {
		this.command = command;
	}
	public java.util.Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	public java.util.Date getExecuteTime() {
		return executeTime;
	}
	
	public void setExecuteTime(java.util.Date executeTime) {
		this.executeTime = executeTime;
	}
	public String getDescription() {
		return description;
	}
	
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getStatus() {
		return status;
	}
	
	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getExecuteResult() {
		return executeResult;
	}

	public void setExecuteResult(String executeResult) {
		this.executeResult = executeResult;
	}
	
	
}