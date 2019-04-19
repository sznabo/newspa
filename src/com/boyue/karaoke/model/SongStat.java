package com.boyue.karaoke.model;

import java.sql.Timestamp;
import java.util.Date;

/**
 * SongStat entity. @author MyEclipse Persistence Tools
 */

public class SongStat implements java.io.Serializable {

	// Fields

	private Integer id;
	private String mac;
	private String userName;
	private String songName;
	private Date time;
	private Date startTime;
	private Date endTime;
	// Constructors

	/** default constructor */
	public SongStat() {
	}

	/** full constructor */
	public SongStat(String mac, String userName, String songName, Timestamp time) {
		this.mac = mac;
		this.userName = userName;
		this.songName = songName;
		this.time = time;
	}

	// Property accessors

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getMac() {
		return this.mac;
	}

	public void setMac(String mac) {
		this.mac = mac;
	}

	public String getUserName() {
		return this.userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getSongName() {
		return this.songName;
	}

	public void setSongName(String songName) {
		this.songName = songName;
	}

	public Date getTime() {
		return time;
	}

	public void setTime(Date time) {
		this.time = time;
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


}