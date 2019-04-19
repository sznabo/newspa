package com.boyue.karaoke.model;

import java.io.Serializable;

public class HotelRegister implements Serializable{

	private Integer id;
	
	private String hotelname;
	
	private String hotelid;
	
	private String oldhotelname;
	public String getOldhotelname() {
		return oldhotelname;
	}
	public void setOldhotelname(String oldhotelname) {
		this.oldhotelname = oldhotelname;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
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
	
	
	
}
