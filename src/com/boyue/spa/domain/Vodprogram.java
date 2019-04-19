package com.boyue.spa.domain;



import java.util.List;

import com.boyue.karaoke.model.Ad;


public class Vodprogram implements java.io.Serializable {

	// Fields

	private Integer id;
	private Integer vodpartid;
	private String voidprogramname;
	private String voidprogramnamee;
	private String voidprogramname_jap;
	private String voidprogramname_kor;
	private String voidprogramdescription;
	private String voidprogramdirector;
	private String voidprogramstarring;
	private String voidprogramimg;
	private Integer position;
	private List<Vodvideo> videos;
	private Vodvideo v;
	private Vodpart vodpart;
	private Integer adid;						//广告外键ID
	private Ad ad;
	
	private String year;
	
	private String filmtype;
	
	private String area;
	
	private Integer maxVisitCount;
	
	private Integer visitCount;
	
	private Integer types;
	
	private Integer playtime;
	// Constructors

	public Integer getPlaytime() {
		return playtime;
	}

	public void setPlaytime(Integer playtime) {
		this.playtime = playtime;
	}

	
	
	/** default constructor */
	public Vodprogram() {
	}

	/** minimal constructor */
	public Vodprogram(Integer vodpartid, String voidprogramname) {
		this.vodpartid = vodpartid;
		this.voidprogramname = voidprogramname;
	}

	/** full constructor */
	public Vodprogram(Integer vodpartid, String voidprogramname,
			String voidprogramdescription, String voidprogramdirector,
			String voidprogramstarring, String voidprogramimg) {
		this.vodpartid = vodpartid;
		this.voidprogramname = voidprogramname;
		this.voidprogramdescription = voidprogramdescription;
		this.voidprogramdirector = voidprogramdirector;
		this.voidprogramstarring = voidprogramstarring;
		this.voidprogramimg = voidprogramimg;
	}
	
	
	
	public String getVoidprogramname_jap() {
		return voidprogramname_jap;
	}

	public void setVoidprogramname_jap(String voidprogramname_jap) {
		this.voidprogramname_jap = voidprogramname_jap;
	}

	public String getVoidprogramname_kor() {
		return voidprogramname_kor;
	}

	public void setVoidprogramname_kor(String voidprogramname_kor) {
		this.voidprogramname_kor = voidprogramname_kor;
	}

	public Integer getId() {
		return this.id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Integer getVodpartid() {
		return this.vodpartid;
	}

	public void setVodpartid(Integer vodpartid) {
		this.vodpartid = vodpartid;
	}

	public String getVoidprogramname() {
		return this.voidprogramname;
	}

	public void setVoidprogramname(String voidprogramname) {
		this.voidprogramname = voidprogramname;
	}

	
	public String getVoidprogramnamee() {
		return voidprogramnamee;
	}

	public void setVoidprogramnamee(String voidprogramnamee) {
		this.voidprogramnamee = voidprogramnamee;
	}

	public String getVoidprogramdescription() {
		return this.voidprogramdescription;
	}

	public void setVoidprogramdescription(String voidprogramdescription) {
		this.voidprogramdescription = voidprogramdescription;
	}

	public String getVoidprogramdirector() {
		return this.voidprogramdirector;
	}

	public void setVoidprogramdirector(String voidprogramdirector) {
		this.voidprogramdirector = voidprogramdirector;
	}

	public String getVoidprogramstarring() {
		return this.voidprogramstarring;
	}

	public void setVoidprogramstarring(String voidprogramstarring) {
		this.voidprogramstarring = voidprogramstarring;
	}

	public String getVoidprogramimg() {
		return this.voidprogramimg;
	}

	public void setVoidprogramimg(String voidprogramimg) {
		this.voidprogramimg = voidprogramimg;
	}

	public Integer getPosition() {
		return position;
	}

	public void setPosition(Integer position) {
		this.position = position;
	}

	public List<Vodvideo> getVideos() {
		return videos;
	}

	public void setVideos(List<Vodvideo> videos) {
		this.videos = videos;
	}

	public Vodpart getVodpart() {
		return vodpart;
	}

	public void setVodpart(Vodpart vodpart) {
		this.vodpart = vodpart;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getArea() {
		return area;
	}

	public void setArea(String area) {
		this.area = area;
	}

	public String getFilmtype() {
		return filmtype;
	}

	public void setFilmtype(String filmtype) {
		this.filmtype = filmtype;
	}

	public Integer getMaxVisitCount() {
		return maxVisitCount;
	}

	public void setMaxVisitCount(Integer maxVisitCount) {
		this.maxVisitCount = maxVisitCount;
	}

	public Integer getVisitCount() {
		return visitCount;
	}

	public void setVisitCount(Integer visitCount) {
		this.visitCount = visitCount;
	}

	public Integer getAdid() {
		return adid;
	}

	public void setAdid(Integer adid) {
		this.adid = adid;
	}
	public Ad getAd() {
		return ad;
	}

	public void setAd(Ad ad) {
		this.ad = ad;
	}

	public Vodvideo getV() {
		return v;
	}

	public void setV(Vodvideo v) {
		this.v = v;
	}

	public Integer getTypes() {
		return types;
	}

	public void setTypes(Integer types) {
		this.types = types;
	}
	
	
	
}