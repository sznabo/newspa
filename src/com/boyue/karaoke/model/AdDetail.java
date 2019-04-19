package com.boyue.karaoke.model;

/**
 * AdDetail entity. @author MyEclipse Persistence Tools
 */

public class AdDetail implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer adid;
	private String path;
	private Integer position;
	private String name;
	private Integer inter;
	// Constructors

	/** default constructor */
	public AdDetail() {
	}


	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getAdid() {
		return this.adid;
	}

	public void setAdid(Integer adid) {
		this.adid = adid;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
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

	public Integer getInter() {
		return inter;
	}

	public void setInter(Integer inter) {
		this.inter = inter;
	}
}