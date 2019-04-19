package com.boyue.spa.domain;

import java.util.Date;

public class Vodvideo implements java.io.Serializable {

	// Fields
	public static final int ENABLE = 1;
	public static final int DISABLE = 0;
	private Integer id;
	private Integer vodprogramid;
	private String voidname;
	private String voidnamee;
	private String voidpath;
	private String voidformat;
	private String voidgrade;
	private String serverid;
	private String filmid;
	private String servername;
	private Integer voidstatus;
	private Integer ifenable;
	private Integer releasetype;
	private Date createtime;
	private Date releasetime;
	private String createadmin;
	private Integer position;
	private String server;
	// Constructors

	/** default constructor */
	public Vodvideo() {
	}

	/** minimal constructor */
	public Vodvideo(Integer vodprogramid, String voidname, String voidpath,
			String voidformat, String voidgrade, String serverid,
			Integer voidstatus, Integer ifenable, Integer releasetype,
			Date createtime, String createadmin) {
		this.vodprogramid = vodprogramid;
		this.voidname = voidname;
		this.voidpath = voidpath;
		this.voidformat = voidformat;
		this.voidgrade = voidgrade;
		this.serverid = serverid;
		this.voidstatus = voidstatus;
		this.ifenable = ifenable;
		this.releasetype = releasetype;
		this.createtime = createtime;
		this.createadmin = createadmin;
	}

	/** full constructor */
	public Vodvideo(Integer vodprogramid, String voidname, String voidpath,
			String voidformat, String voidgrade, String serverid,
			String filmid, String servername, Integer voidstatus,
			Integer ifenable, Integer releasetype, Date createtime,
			Date releasetime, String createadmin) {
		this.vodprogramid = vodprogramid;
		this.voidname = voidname;
		this.voidpath = voidpath;
		this.voidformat = voidformat;
		this.voidgrade = voidgrade;
		this.serverid = serverid;
		this.filmid = filmid;
		this.servername = servername;
		this.voidstatus = voidstatus;
		this.ifenable = ifenable;
		this.releasetype = releasetype;
		this.createtime = createtime;
		this.releasetime = releasetime;
		this.createadmin = createadmin;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getVodprogramid() {
		return this.vodprogramid;
	}

	public void setVodprogramid(Integer vodprogramid) {
		this.vodprogramid = vodprogramid;
	}

	public String getVoidname() {
		return this.voidname;
	}

	public void setVoidname(String voidname) {
		this.voidname = voidname;
	}

	public String getVoidnamee() {
		return voidnamee;
	}

	public void setVoidnamee(String voidnamee) {
		this.voidnamee = voidnamee;
	}

	public String getVoidpath() {
		return this.voidpath;
	}

	public void setVoidpath(String voidpath) {
		this.voidpath = voidpath;
	}

	public String getVoidformat() {
		return this.voidformat;
	}

	public void setVoidformat(String voidformat) {
		this.voidformat = voidformat;
	}

	public String getVoidgrade() {
		return this.voidgrade;
	}

	public void setVoidgrade(String voidgrade) {
		this.voidgrade = voidgrade;
	}

	public String getServerid() {
		return this.serverid;
	}

	public void setServerid(String serverid) {
		this.serverid = serverid;
	}

	public String getFilmid() {
		return this.filmid;
	}

	public void setFilmid(String filmid) {
		this.filmid = filmid;
	}

	public String getServername() {
		return this.servername;
	}

	public void setServername(String servername) {
		this.servername = servername;
	}

	public Integer getVoidstatus() {
		return this.voidstatus;
	}

	public void setVoidstatus(Integer voidstatus) {
		this.voidstatus = voidstatus;
	}

	public Integer getIfenable() {
		return this.ifenable;
	}

	public void setIfenable(Integer ifenable) {
		this.ifenable = ifenable;
	}

	public Integer getReleasetype() {
		return this.releasetype;
	}

	public void setReleasetype(Integer releasetype) {
		this.releasetype = releasetype;
	}

	public Date getCreatetime() {
		return createtime;
	}

	public void setCreatetime(Date createtime) {
		this.createtime = createtime;
	}

	public Date getReleasetime() {
		return releasetime;
	}

	public void setReleasetime(Date releasetime) {
		this.releasetime = releasetime;
	}

	public String getCreateadmin() {
		return this.createadmin;
	}

	public void setCreateadmin(String createadmin) {
		this.createadmin = createadmin;
	}

	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

	public String getServer() {
		return server;
	}

	public void setServer(String server) {
		this.server = server;
	}

}