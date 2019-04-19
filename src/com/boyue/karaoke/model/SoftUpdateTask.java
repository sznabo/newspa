package com.boyue.karaoke.model;

import java.util.Date;
import java.util.List;

/**
 * 
 */
public class SoftUpdateTask implements java.io.Serializable {
	//启用
	public static final int ENABLE = 1;
	//停用
	public static final int DISABLE = 0;
	
	//
	private Integer id;
	
	//名称
	private String name;
	
	//1启用 0停用
	private Integer status;
	
	
	//目标版本
	private String targetVersion;
	
	//备注
	private String remark;
	
	//创建时间
	private java.util.Date createTime;
	
	private String softName;
	
	private Soft soft;
	//任务开始时间
	private Date startTime;
	//任务结束时间
	private Date endTime;
	
	private List<SoftUpdateDevice> softUpdateDevices;
	
	// get set 方法
	
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public Integer getStatus() {
		return status;
	}
	
	public void setStatus(Integer status) {
		this.status = status;
	}

	public String getTargetVersion() {
		return targetVersion;
	}

	public void setTargetVersion(String targetVersion) {
		this.targetVersion = targetVersion;
	}

	public String getRemark() {
		return remark;
	}
	
	public void setRemark(String remark) {
		this.remark = remark;
	}
	public java.util.Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}
	
	public Soft getSoft() {
		return soft;
	}

	public void setSoft(Soft soft) {
		this.soft = soft;
	}

	public String getSoftName() {
		return softName;
	}

	public void setSoftName(String softName) {
		this.softName = softName;
	}

	public List<SoftUpdateDevice> getSoftUpdateDevices() {
		return softUpdateDevices;
	}

	public void setSoftUpdateDevices(List<SoftUpdateDevice> softUpdateDevices) {
		this.softUpdateDevices = softUpdateDevices;
	}

	public Date getStartTime() {
		return startTime;
	}

	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}

	public Date getEndTime() {
		return endTime;
	}

	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
	
}