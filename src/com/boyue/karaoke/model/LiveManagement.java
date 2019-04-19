package com.boyue.karaoke.model;

import java.io.Serializable;

@SuppressWarnings("serial")
public class LiveManagement implements Serializable {
	
	private Integer id;			//直播ID
	private String name;		//频道名称
	private String namee;
	private String name_jap;
	private String name_kor;
	private String freq;		//频率
	private Integer position;	//排序号
	private String zhishi;		//彩图制式
	private String radiozhishi; //声音制式
	private Integer channelcode;//频道号
	
	
	
	public String getNamee() {
		return namee;
	}
	public void setNamee(String namee) {
		this.namee = namee;
	}
	public String getName_jap() {
		return name_jap;
	}
	public void setName_jap(String name_jap) {
		this.name_jap = name_jap;
	}
	public String getName_kor() {
		return name_kor;
	}
	public void setName_kor(String name_kor) {
		this.name_kor = name_kor;
	}
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getFreq() {
		return freq;
	}
	public void setFreq(String freq) {
		this.freq = freq;
	}
	public Integer getPosition() {
		return position;
	}
	public void setPosition(Integer position) {
		this.position = position;
	}
	public String getZhishi() {
		return zhishi;
	}
	public void setZhishi(String zhishi) {
		this.zhishi = zhishi;
	}
	public String getRadiozhishi() {
		return radiozhishi;
	}
	public void setRadiozhishi(String radiozhishi) {
		this.radiozhishi = radiozhishi;
	}
	public Integer getChannelcode() {
		return channelcode;
	}
	public void setChannelcode(Integer channelcode) {
		this.channelcode = channelcode;
	}
}
