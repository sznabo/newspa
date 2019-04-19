package com.boyue.karaoke.model;

/**
 * AppInfo entity. @author MyEclipse Persistence Tools
 */

public class AppInfo implements java.io.Serializable {

	// Fields
	private Integer id;
	private Integer category;
	private String appName;
	private String appNamee;
	private String appName_jap;
	private String appName_kor;
	private String path;
	private String packageName;
	private String icon;
	private Integer kind;
	private Integer position;
	private String version;
	
	

	public String getAppName_jap() {
		return appName_jap;
	}

	public void setAppName_jap(String appName_jap) {
		this.appName_jap = appName_jap;
	}

	public String getAppName_kor() {
		return appName_kor;
	}

	public void setAppName_kor(String appName_kor) {
		this.appName_kor = appName_kor;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getCategory() {
		return this.category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	public String getAppName() {
		return this.appName;
	}

	public void setAppName(String appName) {
		this.appName = appName;
	}

	
	public String getAppNamee() {
		return appNamee;
	}

	public void setAppNamee(String appNamee) {
		this.appNamee = appNamee;
	}

	public String getPath() {
		return this.path;
	}

	public void setPath(String path) {
		this.path = path;
	}


	public String getIcon() {
		return this.icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public Integer getKind() {
		return kind;
	}

	public void setKind(Integer kind) {
		this.kind = kind;
	}

	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

	public String getPackageName() {
		return packageName;
	}

	public void setPackageName(String packageName) {
		this.packageName = packageName;
	}

	public String getVersion() {
		return version;
	}

	public void setVersion(String version) {
		this.version = version;
	}

}