package com.boyue.karaoke.model;

import java.util.Date;

/**
 * 
 */
public class Message implements java.io.Serializable {
	public static final int ENABLE = 1;
	public static final int DISABLE = 0;
	//
	private Integer id;
	
	//标题
	private String title;
	
	//状态1启用,0停用
	private Integer status;
	
	//1顶部，2底部
	private Integer position;
	
//	//显示开始时间
//	private java.util.Date startTime;
//	
//	//显示结束时间
//	private java.util.Date endTime;
//	
	private Date startDate;			//开始日期
	private Date endDate;			//结束日期
	private String startTime;		//开始时间
	private String endTime;			//结束时间
	//内容
	private String content;
	
	private String contente;
	//1:实时,2:定时(默认为实时)
	private Integer type;
	
	
	// get set 方法
	
	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	public String getTitle() {
		return title;
	}
	
	public void setTitle(String title) {
		this.title = title;
	}
	public Integer getStatus() {
		return status;
	}
	
	public void setStatus(Integer status) {
		this.status = status;
	}
	public Integer getPosition() {
		return position;
	}
	
	public void setPosition(Integer position) {
		this.position = position;
	}
//	public java.util.Date getStartTime() {
//		return startTime;
//	}
//	
//	public void setStartTime(java.util.Date startTime) {
//		this.startTime = startTime;
//	}
//	public java.util.Date getEndTime() {
//		return endTime;
//	}
//	
//	public void setEndTime(java.util.Date endTime) {
//		this.endTime = endTime;
//	}
	public String getContent() {
		return content;
	}
	
	public void setContent(String content) {
		this.content = content;
	}

	
	public String getContente() {
		return contente;
	}

	public void setContente(String contente) {
		this.contente = contente;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public String getStartTime() {
		return startTime;
	}

	public void setStartTime(String startTime) {
		this.startTime = startTime;
	}

	public String getEndTime() {
		return endTime;
	}

	public void setEndTime(String endTime) {
		this.endTime = endTime;
	}
	
	
}