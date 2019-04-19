package com.boyue.karaoke.model;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class GuestBook implements Serializable {
	
	private Integer id;			//留言ID
	private String user_name;	//用户姓名
	private String tel;			//用户电话
	private Date   create_time;	//创建时间
	private String msg;			//留言内容
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUser_name() {
		return user_name;
	}
	public void setUser_name(String user_name) {
		this.user_name = user_name;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public Date getCreate_time() {
		return create_time;
	}
	public void setCreate_time(Date create_time) {
		this.create_time = create_time;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}
}
