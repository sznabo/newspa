package com.boyue.karaoke.model;

import java.io.Serializable;
import com.boyue.karaoke.model.TechnicianLevel;;
public class Technician implements Serializable{
	private Integer id;
	private Integer number;
	private Integer sex;
	private Integer age;
	private Integer typeId;
	private Integer levelId;
	private String name;
	private String namee;
	private String name_kor;
	private String name_jap;
	private String img;
	private Integer heigh;
	private String nativePlace;   //籍贯
	private String nativePlacee;   //籍贯
	private Integer onDuty;
	private Integer status;
	private String scopeService; //服务范围
	
	private TechnicianLevel level;
	private TechnicianType type;

	
	
	
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
	public Integer getNumber() {
		return number;
	}
	public void setNumber(Integer number) {
		this.number = number;
	}
	public Integer getSex() {
		return sex;
	}
	public void setSex(Integer sex) {
		this.sex = sex;
	}
	
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
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
	public Integer getHeigh() {
		return heigh;
	}
	public void setHeigh(Integer heigh) {
		this.heigh = heigh;
	}
	public String getNativePlace() {
		return nativePlace;
	}
	public void setNativePlace(String nativePlace) {
		this.nativePlace = nativePlace;
	}
	
	public String getNativePlacee() {
		return nativePlacee;
	}
	public void setNativePlacee(String nativePlacee) {
		this.nativePlacee = nativePlacee;
	}
	public Integer getOnDuty() {
		return onDuty;
	}
	public void setOnDuty(Integer onDuty) {
		this.onDuty = onDuty;
	}
	public Integer getStatus() {
		return status;
	}
	public void setStatus(Integer status) {
		this.status = status;
	}

	public Integer getTypeId() {
		return typeId;
	}
	public void setTypeId(Integer typeId) {
		this.typeId = typeId;
	}
	public Integer getLevelId() {
		return levelId;
	}
	public void setLevelId(Integer levelId) {
		this.levelId = levelId;
	}
	public TechnicianLevel getLevel() {
		return level;
	}
	public void setLevel(TechnicianLevel level) {
		this.level = level;
	}
	public TechnicianType getType() {
		return type;
	}
	public void setType(TechnicianType type) {
		this.type = type;
	}
	public String getScopeService() {
		return scopeService;
	}
	public void setScopeService(String scopeService) {
		this.scopeService = scopeService;
	}
	
}
