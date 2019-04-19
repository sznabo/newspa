package com.boyue.spa.domain;

import static javax.persistence.GenerationType.IDENTITY;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.Table;

public class Vodgrade implements java.io.Serializable {

	// Fields

	private Integer id;
	private String gradename;
	private Double price;
	private String gradedesc;
	private Integer gradestatus;
	private Integer gradetype;

	// Constructors

	/** default constructor */
	public Vodgrade() {
	}

	/** full constructor */
	public Vodgrade(String gradename, Double price, String gradedesc,
			Integer gradestatus, Integer gradetype) {
		this.gradename = gradename;
		this.price = price;
		this.gradedesc = gradedesc;
		this.gradestatus = gradestatus;
		this.gradetype = gradetype;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getGradename() {
		return this.gradename;
	}

	public void setGradename(String gradename) {
		this.gradename = gradename;
	}

	public Double getPrice() {
		return this.price;
	}

	public void setPrice(Double price) {
		this.price = price;
	}

	public String getGradedesc() {
		return this.gradedesc;
	}

	public void setGradedesc(String gradedesc) {
		this.gradedesc = gradedesc;
	}

	public Integer getGradestatus() {
		return this.gradestatus;
	}

	public void setGradestatus(Integer gradestatus) {
		this.gradestatus = gradestatus;
	}

	public Integer getGradetype() {
		return this.gradetype;
	}

	public void setGradetype(Integer gradetype) {
		this.gradetype = gradetype;
	}

}