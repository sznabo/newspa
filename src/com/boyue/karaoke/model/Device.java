package com.boyue.karaoke.model;

import java.sql.Time;
import java.util.Date;

/**
 * 
 */
public class Device implements java.io.Serializable {
	public static final int ENABLE = 1;
	public static final int STOP = 2;
	public static final int DELETEED = 3;
	
	//运行状态，在线
	public static final int ONLINE = 1;
	//离线
	public static final int OFFLINE = 2;
		//
		private Integer id;
		
		//设备ID
		private String mac;
		
		//状态1:启用,2停用, 3 已删除
		private Integer status;
		
		//分类id
		private Integer categoryId;
		
		//备注
		private String remark;
		
		//软件版本
		private String softVersion;
		
		//创建时间
		private java.util.Date createDate;
		
		//连接时间
		private java.util.Date connectTime;
		
		//用户名
		private String userName;
		
		//ip地址
		private String ipaddr;
		
		//下线时间
		private Date offlineTime;
		
		private String position;
		
		private Date curDate;
		
		private String categoryName;
		
		private Integer runStatus;
		
		private Product product;
		private Date startTime;
		private Date endTime;
		private Calling calling;
		
		private String hotelname;
		
		private String hotelid;   
		
		private String  channel;
		
		
		public String getHotelname() {
			return hotelname;
		}

		public void setHotelname(String hotelname) {
			this.hotelname = hotelname;
		}

		public String getHotelid() {
			return hotelid;
		}

		public void setHotelid(String hotelid) {
			this.hotelid = hotelid;
		}

		public String getChannel() {
			return channel;
		}

		public void setChannel(String channel) {
			this.channel = channel;
		}

		public Calling getCalling() {
			return calling;
		}

		public void setCalling(Calling calling) {
			this.calling = calling;
		}

		public Integer getId() {
			return id;
		}

		public void setId(Integer id) {
			this.id = id;
		}

		public String getMac() {
			return mac;
		}

		public void setMac(String mac) {
			this.mac = mac;
		}

		public Integer getStatus() {
			return status;
		}

		public void setStatus(Integer status) {
			this.status = status;
		}

		public Integer getCategoryId() {
			return categoryId;
		}

		public void setCategoryId(Integer categoryId) {
			this.categoryId = categoryId;
		}

		public String getRemark() {
			return remark;
		}

		public void setRemark(String remark) {
			this.remark = remark;
		}

		public String getSoftVersion() {
			return softVersion;
		}

		public void setSoftVersion(String softVersion) {
			this.softVersion = softVersion;
		}

		public java.util.Date getCreateDate() {
			return createDate;
		}

		public void setCreateDate(java.util.Date createDate) {
			this.createDate = createDate;
		}

		public java.util.Date getConnectTime() {
			return connectTime;
		}

		public void setConnectTime(java.util.Date connectTime) {
			this.connectTime = connectTime;
		}

		public String getIpaddr() {
			return ipaddr;
		}

		public void setIpaddr(String ipaddr) {
			this.ipaddr = ipaddr;
		}

		public Date getOfflineTime() {
			return offlineTime;
		}

		public void setOfflineTime(Date offlineTime) {
			this.offlineTime = offlineTime;
		}

		public Date getCurDate() {
			return curDate;
		}

		public void setCurDate(Date curDate) {
			this.curDate = curDate;
		}

		public String getCategoryName() {
			return categoryName;
		}

		public void setCategoryName(String categoryName) {
			this.categoryName = categoryName;
		}

		public Integer getRunStatus() {
			return runStatus;
		}

		public void setRunStatus(Integer runStatus) {
			this.runStatus = runStatus;
		}

		public String getUserName() {
			return userName;
		}

		public void setUserName(String userName) {
			this.userName = userName;
		}

		public Product getProduct() {
			return product;
		}

		public void setProduct(Product product) {
			this.product = product;
		}

		public Date getStartTime() {
			return startTime;
		}

		public void setStartTime(Date startTime) {
			this.startTime = startTime;
		}

		public Date getEndTime() {
			return endTime;
		}

		public void setEndTime(Date endTime) {
			this.endTime = endTime;
		}

		public String getPosition() {
			return position;
		}

		public void setPosition(String position) {
			this.position = position;
		}
		
		
	}
