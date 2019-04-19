package com.boyue.karaoke.vo;

import java.io.Serializable;
import java.util.List;

import com.boyue.karaoke.model.LiveManagement;
import com.boyue.karaoke.model.SingelLive;

public class LiveVo implements Serializable{

	private List<LiveManagement> lives;   //单模
	private List<SingelLive> singelLives;   //双模
	
	
	
	
	public List<LiveManagement> getLives() {
		return lives;
	}
	public void setLives(List<LiveManagement> lives) {
		this.lives = lives;
	}
	public List<SingelLive> getSingelLives() {
		return singelLives;
	}
	public void setSingelLives(List<SingelLive> singelLives) {
		this.singelLives = singelLives;
	}
	
	
	
	
}
