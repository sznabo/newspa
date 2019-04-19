package com.boyue.karaoke.model;

import java.io.Serializable;

public class Play implements Serializable{
	private int id;
	private String play_name;
	private int statu_play;
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getPlay_name() {
		return play_name;
	}
	public void setPlay_name(String play_name) {
		this.play_name = play_name;
	}
	public int getStatu_play() {
		return statu_play;
	}
	public void setStatu_play(int statu_play) {
		this.statu_play = statu_play;
	}

	
}
