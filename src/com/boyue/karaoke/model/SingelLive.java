package com.boyue.karaoke.model;

import java.io.Serializable;

public class SingelLive implements Serializable{
	// Fields

	private Integer id;
	private String filmid;
	private String filmname;
	private String livemanagementname;
	private String livemanagementnamee;
	private String livemanagementname_jap;
	private String livemanagementname_kor;
	private String livemanagementaddress;
	private String livemanagementserver;
	private String livemanagementservername;
	private String livemanagementagreement;
	private String livemanagementtype;
	private String livemanagementgrade;
	private String recording;
	private String source;
	private String crawladdress;
	private String programsavetime;
	private String recordingtime;
	private String begintime;
	private String endtime;
	private String description;
	private String ifable;
	private Integer position;
	private String controlServerIp;
	private Integer controlServerPort;
	// Constructors
	
	/** default constructor */
	public SingelLive() {
	}
	
	
	
	public String getLivemanagementname_jap() {
		return livemanagementname_jap;
	}



	public void setLivemanagementname_jap(String livemanagementname_jap) {
		this.livemanagementname_jap = livemanagementname_jap;
	}



	public String getLivemanagementname_kor() {
		return livemanagementname_kor;
	}



	public void setLivemanagementname_kor(String livemanagementname_kor) {
		this.livemanagementname_kor = livemanagementname_kor;
	}



	public String getControlServerIp() {
		return controlServerIp;
	}

	public void setControlServerIp(String controlServerIp) {
		this.controlServerIp = controlServerIp;
	}

	public Integer getControlServerPort() {
		return controlServerPort;
	}

	public void setControlServerPort(Integer controlServerPort) {
		this.controlServerPort = controlServerPort;
	}

	/** minimal constructor */
	public SingelLive(String filmname, String livemanagementname,
			String livemanagementaddress, String livemanagementserver,
			String livemanagementservername, String livemanagementagreement,
			String livemanagementtype, String livemanagementgrade,
			String recording, String source, String ifable) {
		this.filmname = filmname;
		this.livemanagementname = livemanagementname;
		this.livemanagementaddress = livemanagementaddress;
		this.livemanagementserver = livemanagementserver;
		this.livemanagementservername = livemanagementservername;
		this.livemanagementagreement = livemanagementagreement;
		this.livemanagementtype = livemanagementtype;
		this.livemanagementgrade = livemanagementgrade;
		this.recording = recording;
		this.source = source;
		this.ifable = ifable;
	}

	/** full constructor */
	public SingelLive(String filmid, String filmname,
			String livemanagementname, String livemanagementaddress,
			String livemanagementserver, String livemanagementservername,
			String livemanagementagreement, String livemanagementtype,
			String livemanagementgrade, String recording, String source,
			String crawladdress, String programsavetime, String recordingtime,
			String begintime, String endtime, String description, String ifable) {
		this.filmid = filmid;
		this.filmname = filmname;
		this.livemanagementname = livemanagementname;
		this.livemanagementaddress = livemanagementaddress;
		this.livemanagementserver = livemanagementserver;
		this.livemanagementservername = livemanagementservername;
		this.livemanagementagreement = livemanagementagreement;
		this.livemanagementtype = livemanagementtype;
		this.livemanagementgrade = livemanagementgrade;
		this.recording = recording;
		this.source = source;
		this.crawladdress = crawladdress;
		this.programsavetime = programsavetime;
		this.recordingtime = recordingtime;
		this.begintime = begintime;
		this.endtime = endtime;
		this.description = description;
		this.ifable = ifable;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getFilmid() {
		return this.filmid;
	}

	public void setFilmid(String filmid) {
		this.filmid = filmid;
	}

	public String getFilmname() {
		return this.filmname;
	}

	public void setFilmname(String filmname) {
		this.filmname = filmname;
	}

	public String getLivemanagementname() {
		return this.livemanagementname;
	}

	public void setLivemanagementname(String livemanagementname) {
		this.livemanagementname = livemanagementname;
	}
	

	public String getLivemanagementnamee() {
		return livemanagementnamee;
	}

	public void setLivemanagementnamee(String livemanagementnamee) {
		this.livemanagementnamee = livemanagementnamee;
	}

	public String getLivemanagementaddress() {
		return this.livemanagementaddress;
	}

	public void setLivemanagementaddress(String livemanagementaddress) {
		this.livemanagementaddress = livemanagementaddress;
	}

	public String getLivemanagementserver() {
		return this.livemanagementserver;
	}

	public void setLivemanagementserver(String livemanagementserver) {
		this.livemanagementserver = livemanagementserver;
	}

	public String getLivemanagementservername() {
		return this.livemanagementservername;
	}

	public void setLivemanagementservername(String livemanagementservername) {
		this.livemanagementservername = livemanagementservername;
	}

	public String getLivemanagementagreement() {
		return this.livemanagementagreement;
	}

	public void setLivemanagementagreement(String livemanagementagreement) {
		this.livemanagementagreement = livemanagementagreement;
	}

	public String getLivemanagementtype() {
		return this.livemanagementtype;
	}

	public void setLivemanagementtype(String livemanagementtype) {
		this.livemanagementtype = livemanagementtype;
	}

	public String getLivemanagementgrade() {
		return this.livemanagementgrade;
	}

	public void setLivemanagementgrade(String livemanagementgrade) {
		this.livemanagementgrade = livemanagementgrade;
	}

	public String getRecording() {
		return this.recording;
	}

	public void setRecording(String recording) {
		this.recording = recording;
	}

	public String getSource() {
		return this.source;
	}

	public void setSource(String source) {
		this.source = source;
	}

	public String getCrawladdress() {
		return this.crawladdress;
	}

	public void setCrawladdress(String crawladdress) {
		this.crawladdress = crawladdress;
	}

	public String getProgramsavetime() {
		return this.programsavetime;
	}

	public void setProgramsavetime(String programsavetime) {
		this.programsavetime = programsavetime;
	}

	public String getRecordingtime() {
		return this.recordingtime;
	}

	public void setRecordingtime(String recordingtime) {
		this.recordingtime = recordingtime;
	}

	public String getBegintime() {
		return this.begintime;
	}

	public void setBegintime(String begintime) {
		this.begintime = begintime;
	}

	public String getEndtime() {
		return this.endtime;
	}

	public void setEndtime(String endtime) {
		this.endtime = endtime;
	}

	public String getDescription() {
		return this.description;
	}

	public void setDescription(String description) {
		this.description = description;
	}

	public String getIfable() {
		return this.ifable;
	}

	public void setIfable(String ifable) {
		this.ifable = ifable;
	}

	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}
}
