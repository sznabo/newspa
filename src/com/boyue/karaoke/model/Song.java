package com.boyue.karaoke.model;

/**
 * Song entity. @author MyEclipse Persistence Tools
 */

public class Song implements java.io.Serializable {

	// Fields
	private Integer id;
	//歌曲名称
	private String songName;
	private String songNamee;
	private String songName_jap;
	private String songName_kor;
	//歌手
	private String singer;
	private String singere;
	//歌手类别
	private String singerType;
	//歌曲的拼音
	private String songYinpin;
	//歌曲文件路径
	private String lyricFile;
	//发行年份
	private Integer year;
	private Integer recommend;
	private String musicFile;
	//类型1 midi音乐, 2视频
	private Integer type;
	//点播次数
	private Integer playTimes;
	private String logo;
	
	//分类ID，用于查询
	private Integer categoryId;
	// Constructors

	/** default constructor */
	public Song() {
	}

	/** minimal constructor */
	public Song(String songName, String singer, String singerType,
			String songYinpin, Integer recommend) {
		this.songName = songName;
		this.singer = singer;
		this.singerType = singerType;
		this.songYinpin = songYinpin;
		this.recommend = recommend;
	}

	/** full constructor */
	public Song(String songName, String singer, String singerType,
			String songYinpin, String lyricFile, Integer year, Integer recommend) {
		this.songName = songName;
		this.singer = singer;
		this.singerType = singerType;
		this.songYinpin = songYinpin;
		this.lyricFile = lyricFile;
		this.year = year;
		this.recommend = recommend;
	}

	// Property accessors
	
	
	
	public Integer getId() {
		return this.id;
	}

	public String getSongName_jap() {
		return songName_jap;
	}

	public void setSongName_jap(String songName_jap) {
		this.songName_jap = songName_jap;
	}

	public String getSongName_kor() {
		return songName_kor;
	}

	public void setSongName_kor(String songName_kor) {
		this.songName_kor = songName_kor;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public String getSongName() {
		return this.songName;
	}

	public void setSongName(String songName) {
		this.songName = songName;
	}
	

	public String getSongNamee() {
		return songNamee;
	}

	public void setSongNamee(String songNamee) {
		this.songNamee = songNamee;
	}

	public String getSinger() {
		return this.singer;
	}

	public void setSinger(String singer) {
		this.singer = singer;
	}

	
	public String getSingere() {
		return singere;
	}

	public void setSingere(String singere) {
		this.singere = singere;
	}

	public String getSingerType() {
		return this.singerType;
	}

	public void setSingerType(String singerType) {
		this.singerType = singerType;
	}

	public String getSongYinpin() {
		return this.songYinpin;
	}

	public void setSongYinpin(String songYinpin) {
		this.songYinpin = songYinpin;
	}

	public String getLyricFile() {
		return this.lyricFile;
	}

	public void setLyricFile(String lyricFile) {
		this.lyricFile = lyricFile;
	}

	public Integer getYear() {
		return this.year;
	}

	public void setYear(Integer year) {
		this.year = year;
	}

	public Integer getRecommend() {
		return this.recommend;
	}

	public void setRecommend(Integer recommend) {
		this.recommend = recommend;
	}

	public Integer getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}

	public String getMusicFile() {
		return musicFile;
	}

	public void setMusicFile(String musicFile) {
		this.musicFile = musicFile;
	}

	public Integer getType() {
		return type;
	}

	public void setType(Integer type) {
		this.type = type;
	}

	public Integer getPlayTimes() {
		return playTimes;
	}

	public void setPlayTimes(Integer playTimes) {
		this.playTimes = playTimes;
	}

	public String getLogo() {
		return logo;
	}

	public void setLogo(String logo) {
		this.logo = logo;
	}

}