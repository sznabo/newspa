package com.boyue.karaoke.model;

/**
 * Module entity. @author MyEclipse Persistence Tools
 */

public class Module implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String namee;
	private String name_jap;
	private String name_kor;
	private String code;

	
	
	
	// Constructors

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

	/** default constructor */
	public Module() {
	}

	/** full constructor */
	public Module(String name, String code) {
		this.name = name;
		this.code = code;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
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

	public String getCode() {
		return this.code;
	}

	public void setCode(String code) {
		this.code = code;
	}

}