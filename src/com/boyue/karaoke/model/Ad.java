package com.boyue.karaoke.model;

import java.util.List;

/**
 * Ad entity. @author MyEclipse Persistence Tools
 */

public class Ad implements java.io.Serializable {
	//内容类型:1图片,2视频，3 flash
	public static final int PIC = 1;
	public static final int VIDEO = 2;
	public static final int FLASH = 3;
	
	//所属栏目:1广告,2 点播广告, 3本店介绍   4消费介绍
	public static final int AD = 1;
	public static final int VOD_AD = 2;
	public static final int INTRO_CONTENT = 3;
	public static final int EXPENSE = 4;
	public static final int MUSIC = 5;
	public static final int TV = 6;
	public static final int NETWORK = 7;
	public static final int GAMES = 8;
	
	// Fields

	private Integer id;
	private String name;
	private String namee;
	private String name_jap;
	private String name_kor;
	private Integer position;
	private Integer contentType;
	private Integer category;
	private List<AdDetail> details;
	// Constructors

	/** default constructor */
	public Ad() {
	}

	/** full constructor */
	public Ad(String name, Integer position, Integer contentType) {
		this.name = name;
		this.position = position;
		this.contentType = contentType;
	}

	// Property accessors
	
	public Integer getId() {
		return this.id;
	}

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

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public Integer getPosition() {
		return this.position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

	public Integer getContentType() {
		return this.contentType;
	}

	public void setContentType(Integer contentType) {
		this.contentType = contentType;
	}

	public List<AdDetail> getDetails() {
		return details;
	}

	public void setDetails(List<AdDetail> details) {
		this.details = details;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

}