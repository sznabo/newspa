package com.boyue.karaoke.model;

import java.io.Serializable;

public class AppCategoryDetail implements Serializable{
	
	private Integer id;
	private String name;
	private Integer position;
	private String content;
	private String contente;
	private String path;
	
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
	public Integer getPosition() {
		return position;
	}
	public void setPosition(Integer position) {
		this.position = position;
	}
	public String getPath() {
		return path;
	}
	public void setPath(String path) {
		this.path = path;
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

	
	

}
