package com.boyue.karaoke.model;

import java.io.Serializable;
import java.util.Date;

@SuppressWarnings("serial")
public class ServerMsg implements Serializable{

	private Integer id;				//留言ID
	private String title;			//留言标题
	private String content;			//留言内容
	private String contente;			//留言内容
	private Date time;				//创建时间
	
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
	public Date getTime() {
		return time;
	}
	public void setTime(Date time) {
		this.time = time;
	}
}
