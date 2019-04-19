package com.boyue.karaoke.model;

/**
 * SongCagegoryDetail entity. @author MyEclipse Persistence Tools
 */

public class SongCategoryDetail implements java.io.Serializable {

	// Fields

	private Integer id;
	private SongCategory category;
	private Song song;
	public Integer getId() {
		return id;
	}
	public void setId(Integer id) {
		this.id = id;
	}
	public Song getSong() {
		return song;
	}
	public void setSong(Song song) {
		this.song = song;
	}
	public SongCategory getCategory() {
		return category;
	}
	public void setCategory(SongCategory category) {
		this.category = category;
	}
	
}