package com.boyue.karaoke.model;

import java.util.List;

/**
 * SongCategory entity. @author MyEclipse Persistence Tools
 */

public class SongCategory implements java.io.Serializable {

	// Fields

	private Integer id;
	private String name;
	private String namee;
	private String name_jap;
	private String name_kor;
	private String icon;
	
	private List<Song> songs;
	// Constructors

	/** default constructor */
	public SongCategory() {
	}

	/** full constructor */
	public SongCategory(String name) {
		this.name = name;
	}

	// Property accessors

	
	
	public Integer getId() {
		return this.id;
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

	public void setId(Integer id) {
		this.id = id;
	}

	public String getName() {
		return this.name;
	}

	public void setName(String name) {
		this.name = name;
	}

	
	public String getNamee() {
		return namee;
	}

	public void setNamee(String namee) {
		this.namee = namee;
	}

	public String getIcon() {
		return icon;
	}

	public void setIcon(String icon) {
		this.icon = icon;
	}

	public List<Song> getSongs() {
		return songs;
	}

	public void setSongs(List<Song> songs) {
		this.songs = songs;
	}

}