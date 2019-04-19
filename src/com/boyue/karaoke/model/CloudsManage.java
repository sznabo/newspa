package com.boyue.karaoke.model;

import java.util.Date;
/**
 * 云端服务器信息管理（只允许修改，不允许删除）
 * @author lmy
 *
 */
public class CloudsManage implements java.io.Serializable{
	private Integer id;
	private String nodeName;
	private String nodeIp;
	private Integer dataPort;   //数据库端口
	private String dataName;    //数据库名称
	private String dataUser;    //数据库用户名
	private String dataPass;    //数据库密码
	private Integer startLine;
	private Integer endLine;
	private String descript;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getNodeName() {
		return nodeName;
	}
	public void setNodeName(String nodeName) {
		this.nodeName = nodeName;
	}
	
	public String getNodeIp() {
		return nodeIp;
	}
	
	public void setNodeIp(String nodeIp) {
		this.nodeIp = nodeIp;
	}
	
	public Integer getDataPort() {
		return dataPort;
	}
	public void setDataPort(Integer dataPort) {
		this.dataPort = dataPort;
	}
	
	public String getDataName() {
		return dataName;
	}
	public void setDataName(String dataName) {
		this.dataName = dataName;
	}
	
	
	public String getDataUser() {
		return dataUser;
	}
	public void setDataUser(String dataUser) {
		this.dataUser = dataUser;
	}
	public String getDataPass() {
		return dataPass;
	}
	public void setDataPass(String dataPass) {
		this.dataPass = dataPass;
	}
	
	
	public Integer getStartLine() {
		return startLine;
	}
	public void setStartLine(Integer startLine) {
		this.startLine = startLine;
	}
	public Integer getEndLine() {
		return endLine;
	}
	public void setEndLine(Integer endLine) {
		this.endLine = endLine;
	}
	public String getDescript() {
		return descript;
	}
	public void setDescript(String descript) {
		this.descript = descript;
	}
	
	
}
