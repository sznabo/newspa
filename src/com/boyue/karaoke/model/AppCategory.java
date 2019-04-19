package com.boyue.karaoke.model;

import java.io.Serializable;
import java.util.List;

public class AppCategory implements Serializable{
	
	private Integer id;
	private String name;
	private String namee;
	private String name_jap;
	private String name_kor;
	
	private Integer position;
	private String path;
	private Integer fileType;
	private List<AppInfo> infos;
	private List<AppCategoryDetail> details;
	
	
	
	
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
	
	public String getNamee() {
		return namee;
	}
	public void setNamee(String namee) {
		this.namee = namee;
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
	
	public Integer getFileType() {
		return fileType;
	}
	public void setFileType(Integer fileType) {
		this.fileType = fileType;
	}
	public List<AppInfo> getInfos() {
		return infos;
	}
	public void setInfos(List<AppInfo> infos) {
		this.infos = infos;
	}
	public List<AppCategoryDetail> getDetails() {
		return details;
	}
	public void setDetails(List<AppCategoryDetail> details) {
		this.details = details;
	}
	
	

}
