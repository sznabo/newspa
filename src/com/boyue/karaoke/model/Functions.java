package com.boyue.karaoke.model;

import java.io.Serializable;

public class Functions implements Serializable{

	private Integer id;
	
	private String name;
	
	private String namee;
	private String name_jap;
	private String name_kor;
	private Integer status;
	
	
	
	public String getNamee() {
		return namee;
	}
	public void setNamee(String namee) {
		this.namee = namee;
	}
	public String getName_jap() {
		return name_jap;
	}
	public void setName_jap(String name_jap) {
		this.name_jap = name_jap;
	}
	public String getName_kor() {
		return name_kor;
	}
	public void setName_kor(String name_kor) {
		this.name_kor = name_kor;
	}
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
	
	
}
