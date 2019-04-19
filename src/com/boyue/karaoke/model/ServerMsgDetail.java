package com.boyue.karaoke.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class ServerMsgDetail implements Serializable {

	private Integer id;			//留言明细ID
	private Integer msgid;		//留言外键ID
	private Integer userid;		//device设备外键ID
	
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Integer getMsgid() {
		return msgid;
	}
	public void setMsgid(Integer msgid) {
		this.msgid = msgid;
	}
	public Integer getUserid() {
		return userid;
	}
	public void setUserid(Integer userid) {
		this.userid = userid;
	}
}
