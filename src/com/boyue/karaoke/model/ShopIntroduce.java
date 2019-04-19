package com.boyue.karaoke.model;

import java.io.Serializable;
import java.util.List;

@SuppressWarnings("serial")
public class ShopIntroduce implements Serializable {
	
	private Integer id;				//本店介绍ID
	private String name;			//栏目名称
	private String namee;			//栏目名称
//	private String namee;			//栏目名称
	private String name_jap;
	private String name_kor;
	private String logo;			//小图
	private String img;				//大图
	private String description;		//描述
	private String descriptione;		//描述
	private Integer adid;			//广告外键ID
	private Integer parentID;		//父键ID
	private Integer lv;				//1第一层，2第二层
	private List<ShopIntroduce> siList;
	private Ad ad;
	private Integer position;		//位置
	private Integer shigongcanba;	//技师、技工、点餐、酒水
	
	
	
	
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
	public Ad getAd() {
		return ad;
	}
	public void setAd(Ad ad) {
		this.ad = ad;
	}
	public Integer getAdid() {
		return adid;
	}
	public void setAdid(Integer adid) {
		this.adid = adid;
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
	//	public String getNamee() {
//		return namee;
//	}
//	public void setNamee(String namee) {
//		this.namee = namee;
//	}
	public String getLogo() {
		return logo;
	}
	public void setLogo(String logo) {
		this.logo = logo;
	}
	public String getImg() {
		return img;
	}
	public void setImg(String img) {
		this.img = img;
	}
	public String getDescription() {
		return description;
	}
	
	public String getDescriptione() {
		return descriptione;
	}
	public void setDescriptione(String descriptione) {
		this.descriptione = descriptione;
	}
	public void setDescription(String description) {
		this.description = description;
	}
	public Integer getParentID() {
		return parentID;
	}
	public void setParentID(Integer parentID) {
		this.parentID = parentID;
	}
	public Integer getLv() {
		return lv;
	}
	public void setLv(Integer lv) {
		this.lv = lv;
	}
	public List<ShopIntroduce> getSiList() {
		return siList;
	}
	public void setSiList(List<ShopIntroduce> siList) {
		this.siList = siList;
	}
	public Integer getPosition() {
		return position;
	}
	public void setPosition(Integer position) {
		this.position = position;
	}
	public Integer getShigongcanba() {
		return shigongcanba;
	}
	public void setShigongcanba(Integer shigongcanba) {
		this.shigongcanba = shigongcanba;
	}
	
}
