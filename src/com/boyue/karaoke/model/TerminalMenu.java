package com.boyue.karaoke.model;

import java.util.List;

public class TerminalMenu {
	private Integer id;
	private String name;
	private String namee;
	private String name_kor;
	private String name_jap;
	private Integer statu;
	private String logoUrl;
	private List<TerminalSubMenu> subMenus;
	
	
	
	
	public String getName_kor() {
		return name_kor;
	}
	public void setName_kor(String name_kor) {
		this.name_kor = name_kor;
	}
	public String getName_jap() {
		return name_jap;
	}
	public void setName_jap(String name_jap) {
		this.name_jap = name_jap;
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
	public Integer getStatu() {
		return statu;
	}
	public void setStatu(Integer statu) {
		this.statu = statu;
	}
	public String getLogoUrl() {
		return logoUrl;
	}
	public void setLogoUrl(String logoUrl) {
		this.logoUrl = logoUrl;
	}
	public List<TerminalSubMenu> getSubMenus() {
		return subMenus;
	}
	public void setSubMenus(List<TerminalSubMenu> subMenus) {
		this.subMenus = subMenus;
	}
}
