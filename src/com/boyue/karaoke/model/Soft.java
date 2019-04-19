package com.boyue.karaoke.model;

import java.util.List;


/**
 * 
 */
public class Soft implements java.io.Serializable {
	
	//
	private Integer id;
	
	//名称
	private String name;
	private String namee;
	private String name_jap;
	private String name_kor;
	
	//版本
	private String version;
	
	//包名
	private String packageName;
	
	//文件路径
	private String filePath;
	
	//备注
	private String remark;
	
	
	
	
	// get set 方法
	
	
	
	public Integer getId() {
		return id;
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
		return name;
	}
	
	public void setName(String name) {
		this.name = name;
	}
	public String getVersion() {
		return version;
	}
	
	public void setVersion(String version) {
		this.version = version;
	}
	public String getPackageName() {
		return packageName;
	}
	
	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}
	public String getFilePath() {
		return filePath;
	}
	
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getRemark() {
		return remark;
	}
	
	public void setRemark(String remark) {
		this.remark = remark;
	}
}