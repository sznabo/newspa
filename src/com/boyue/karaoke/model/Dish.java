package com.boyue.karaoke.model;

import java.io.Serializable;

public class Dish implements Serializable{

	private Integer id;
	private Integer styleId;
	private String name;
	private String namee;
	private String name_jap;
	private String name_kor;
	private String img;
	private DishStyle style;
	private String description;
	private String descriptione;
	
	
	
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
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public Integer getStyleId() {
		return styleId;
	}
	public void setStyleId(Integer styleId) {
		this.styleId = styleId;
	}
	public DishStyle getStyle() {
		return style;
	}
	public void setStyle(DishStyle style) {
		this.style = style;
	}
	public String getDescription() {
		return description;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public String getDescriptione() {
		return descriptione;
	}
	public void setDescriptione(String descriptione) {
		this.descriptione = descriptione;
	}

	
	
	
	
}
