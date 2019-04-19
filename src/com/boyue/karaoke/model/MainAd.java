package com.boyue.karaoke.model;

import java.io.Serializable;

public class MainAd implements Serializable{

	private Integer id;
	private String name;//名称
	private String namee;
	private String name_jap;
	private String name_kor;
	private Integer type;//1 图片 2 视频
	private String filePath;//路径
	private String musicPath;//音频路径 当类型为图片时
	private Integer position;//排序号
	private Integer inter;//时间间隔
	
	
	
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
	public Integer getType() {
		return type;
	}
	public void setType(Integer type) {
		this.type = type;
	}
	public String getFilePath() {
		return filePath;
	}
	public void setFilePath(String filePath) {
		this.filePath = filePath;
	}
	public String getMusicPath() {
		return musicPath;
	}
	public void setMusicPath(String musicPath) {
		this.musicPath = musicPath;
	}
	public Integer getPosition() {
		return position;
	}
	public void setPosition(Integer position) {
		this.position = position;
	}
	public Integer getInter() {
		return inter;
	}
	public void setInter(Integer inter) {
		this.inter = inter;
	}
	
	
}
