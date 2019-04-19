package com.boyue.karaoke.model;

/**
 * ProductDetail entity. @author MyEclipse Persistence Tools
 */

public class ProductDetail implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer productId;
	private Integer moduleId;

	// Constructors

	/** default constructor */
	public ProductDetail() {
	}

	/** full constructor */
	public ProductDetail(Integer productId, Integer moduleId) {
		this.productId = productId;
		this.moduleId = moduleId;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getProductId() {
		return this.productId;
	}

	public void setProductId(Integer productId) {
		this.productId = productId;
	}

	public Integer getModuleId() {
		return this.moduleId;
	}

	public void setModuleId(Integer moduleId) {
		this.moduleId = moduleId;
	}

}