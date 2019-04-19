package com.boyue.spa.domain;

import java.util.List;

public class Vodpart implements java.io.Serializable {

	// Fields

	private Integer id;
	private String vodpartname;
	private String vodpartnamee;
	private String vodpartname_jap;
	private String vodpartname_kor;
	private String img;
	private String partintr;
	private String xmlpath;
	private List<Vodprogram> voidPrograms;
	// Constructors

	/** default constructor */
	public Vodpart() {
	}

	/** minimal constructor */
	public Vodpart(String vodpartname) {
		this.vodpartname = vodpartname;
	}

	/** full constructor */
	public Vodpart(String vodpartname, String partintr, String xmlpath) {
		this.vodpartname = vodpartname;
		this.partintr = partintr;
		this.xmlpath = xmlpath;
	}
	
	
	
	public String getVodpartname_jap() {
		return vodpartname_jap;
	}

	public void setVodpartname_jap(String vodpartname_jap) {
		this.vodpartname_jap = vodpartname_jap;
	}

	public String getVodpartname_kor() {
		return vodpartname_kor;
	}

	public void setVodpartname_kor(String vodpartname_kor) {
		this.vodpartname_kor = vodpartname_kor;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getVodpartname() {
		return this.vodpartname;
	}

	public void setVodpartname(String vodpartname) {
		this.vodpartname = vodpartname;
	}

	
	public String getVodpartnamee() {
		return vodpartnamee;
	}

	public void setVodpartnamee(String vodpartnamee) {
		this.vodpartnamee = vodpartnamee;
	}

	public String getImg() {
		return img;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getPartintr() {
		return this.partintr;
	}

	public void setPartintr(String partintr) {
		this.partintr = partintr;
	}

	public String getXmlpath() {
		return this.xmlpath;
	}

	public void setXmlpath(String xmlpath) {
		this.xmlpath = xmlpath;
	}

	public List<Vodprogram> getVoidPrograms() {
		return voidPrograms;
	}

	public void setVoidPrograms(List<Vodprogram> voidPrograms) {
		this.voidPrograms = voidPrograms;
	}

}