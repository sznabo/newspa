package com.boyue.karaoke.model;



public class Service1 implements java.io.Serializable {

	// Fields

	private Integer id;
	private String servicename;
	private String serviceip;
	private Integer serviceid;
	private Integer serviceport;
	private String servicedirectory;
	private String servicetype;
	private String servicedesc;
	private Integer servicestatus;
	private String ftpservice;
	private String ftpaccount;
	private String ftppassword;
	private String ftpdirectory;

	// Constructors

	/** default constructor */
	public Service1() {
	}

	/** minimal constructor */
	public Service1(String servicename, String servicetype, Integer servicestatus) {
		this.servicename = servicename;
		this.servicetype = servicetype;
		this.servicestatus = servicestatus;
	}

	/** full constructor */
	public Service1(String servicename, String serviceip, Integer serviceid,
			Integer serviceport, String servicedirectory, String servicetype,
			String servicedesc, Integer servicestatus, String ftpservice,
			String ftpaccount, String ftppassword, String ftpdirectory) {
		this.servicename = servicename;
		this.serviceip = serviceip;
		this.serviceid = serviceid;
		this.serviceport = serviceport;
		this.servicedirectory = servicedirectory;
		this.servicetype = servicetype;
		this.servicedesc = servicedesc;
		this.servicestatus = servicestatus;
		this.ftpservice = ftpservice;
		this.ftpaccount = ftpaccount;
		this.ftppassword = ftppassword;
		this.ftpdirectory = ftpdirectory;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getServicename() {
		return this.servicename;
	}

	public void setServicename(String servicename) {
		this.servicename = servicename;
	}

	public String getServiceip() {
		return this.serviceip;
	}

	public void setServiceip(String serviceip) {
		this.serviceip = serviceip;
	}

	public Integer getServiceid() {
		return this.serviceid;
	}

	public void setServiceid(Integer serviceid) {
		this.serviceid = serviceid;
	}

	public Integer getServiceport() {
		return this.serviceport;
	}

	public void setServiceport(Integer serviceport) {
		this.serviceport = serviceport;
	}

	public String getServicedirectory() {
		return this.servicedirectory;
	}

	public void setServicedirectory(String servicedirectory) {
		this.servicedirectory = servicedirectory;
	}

	public String getServicetype() {
		return this.servicetype;
	}

	public void setServicetype(String servicetype) {
		this.servicetype = servicetype;
	}

	public String getServicedesc() {
		return this.servicedesc;
	}

	public void setServicedesc(String servicedesc) {
		this.servicedesc = servicedesc;
	}

	public Integer getServicestatus() {
		return this.servicestatus;
	}

	public void setServicestatus(Integer servicestatus) {
		this.servicestatus = servicestatus;
	}

	public String getFtpservice() {
		return this.ftpservice;
	}

	public void setFtpservice(String ftpservice) {
		this.ftpservice = ftpservice;
	}

	public String getFtpaccount() {
		return this.ftpaccount;
	}

	public void setFtpaccount(String ftpaccount) {
		this.ftpaccount = ftpaccount;
	}

	public String getFtppassword() {
		return this.ftppassword;
	}

	public void setFtppassword(String ftppassword) {
		this.ftppassword = ftppassword;
	}

	public String getFtpdirectory() {
		return this.ftpdirectory;
	}

	public void setFtpdirectory(String ftpdirectory) {
		this.ftpdirectory = ftpdirectory;
	}

}