package com.boyue.karaoke.model;

/**
 * 
 */
public class Admin implements java.io.Serializable {
	public static final int IS_SUPER_ADMIN=1;
	public static final int NOT_SUPER_ADMIN=0;
	//
	private Integer id;
	//
	private String userName;
	//
	private String loginName;
	//
	private String password;
	//
	private java.util.Date createTime;
	private Integer superAdmin;
	// get set 方法
	
	public Integer getId() {
		return id;
	}
	
	public void setId(Integer id) {
		this.id = id;
	}
	public String getUserName() {
		return userName;
	}
	
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public String getLoginName() {
		return loginName;
	}
	
	public void setLoginName(String loginName) {
		this.loginName = loginName;
	}
	public String getPassword() {
		return password;
	}
	
	public void setPassword(String password) {
		this.password = password;
	}
	public java.util.Date getCreateTime() {
		return createTime;
	}
	
	public void setCreateTime(java.util.Date createTime) {
		this.createTime = createTime;
	}

	public Integer getSuperAdmin() {
		return superAdmin;
	}

	public void setSuperAdmin(Integer superAdmin) {
		this.superAdmin = superAdmin;
	}
	
	
}