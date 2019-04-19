package com.boyue.karaoke.util;

import java.util.Date;

/**
 *
 * @author ben
 * @date   2012-12-21 下午12:27:55
 *
 */
public class LicenceInfo {

	private String version;
	
	private boolean notLimitMemberNum = false;
	
	private boolean notLimitUserTime = false;
	
	//用数量
	private Integer num;
	
	private Date dateTo;
	//序列号
	private String sn;
	//硬件信息
	private String hardInfo;
	
	private String clientAuthFile;
	
	public String getVersion() {
		return version;
	}
	public void setVersion(String version) {
		this.version = version;
	}
	public Integer getNum() {
		return num;
	}
	public void setNum(Integer num) {
		this.num = num;
	}
	
	public String getSn() {
		return sn;
	}
	public void setSn(String sn) {
		this.sn = sn;
	}
	public String getHardInfo() {
		return hardInfo;
	}
	public void setHardInfo(String hardInfo) {
		this.hardInfo = hardInfo;
	}
	public String getClientAuthFile() {
		return clientAuthFile;
	}
	public void setClientAuthFile(String clientAuthFile) {
		this.clientAuthFile = clientAuthFile;
	}
	public boolean isNotLimitMemberNum() {
		return notLimitMemberNum;
	}
	public void setNotLimitMemberNum(boolean notLimitMemberNum) {
		this.notLimitMemberNum = notLimitMemberNum;
	}
	public boolean isNotLimitUserTime() {
		return notLimitUserTime;
	}
	public void setNotLimitUserTime(boolean notLimitUserTime) {
		this.notLimitUserTime = notLimitUserTime;
	}
	public Date getDateTo() {
		return dateTo;
	}
	public void setDateTo(Date dateTo) {
		this.dateTo = dateTo;
	}
}
