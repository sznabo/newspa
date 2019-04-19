package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;


import com.boyue.karaoke.model.Play;

import com.boyue.karaoke.service.PlayService;
import com.boyue.karaoke.web.DefaultBaseAction;

@Controller("PlayAction")
@Scope(value = "prototype")
public class PlayAction extends DefaultBaseAction<Play>{
	
	@Autowired
	private PlayService playService;
	private Play model;
    private List<Play> play;
	/**
	 * 展示
	 * @return
	 */
	public String findPage() {
		if(model == null){
			model = new Play();
		}
		this.play = playService.findAll();
		return SUCCESS;
	}
	/**
	 * 跳转到修改页面
	 * @return
	 */
	
	public String toUpdate(){
		if(model != null){
			this.model = playService.findById(model.getId());
		}
		return SUCCESS;
	}
	
	public String update(){
		playService.update(model);
		return SUCCESS;
	}
	
	public Play getModel() {
		return model;
	}
	public void setModel(Play model) {
		this.model = model;
	}
	public List<Play> getPlay() {
		return play;
	}
	public void setPlay(List<Play> play) {
		this.play = play;
	}

	
	
}
