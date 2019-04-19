package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.LiveCategory;
import com.boyue.karaoke.service.LiveCategoryService;
import com.boyue.karaoke.web.DefaultBaseAction;

@Controller("LiveCategoryAction")
@Scope(value = "prototype")
public class LiveCategoryAction extends DefaultBaseAction<LiveCategory>{
	
	@Autowired
	private LiveCategoryService liveCategoryService;
	private LiveCategory model;
    private List<LiveCategory> lives;
	private LiveCategory selectLive;
	/**
	 * 展示
	 * @return
	 */
	public String findPage() {
		if(model == null){
			model = new LiveCategory();
		}
		this.pageBean = liveCategoryService.findPage(model, pageNo, pageSize);
		return SUCCESS;
	}
	/**
	 * 跳转到修改页面
	 * @return
	 */
	
	public String toUpdate(){
		if(model != null && model.getId() != null){
			this.model = liveCategoryService.findById(model.getId());
		}
		return SUCCESS;
	}
	
	public String update(){
		LiveCategory old = liveCategoryService.findById(model.getId());
		if(model.getPath() != null && !model.getPath().trim().isEmpty()){
			new File(this.getProjectPath()+old.getPath()).delete();
		}else {
			model.setPath(old.getPath());
		}
		liveCategoryService.update(model);
		return SUCCESS;
	}
	
	public String toSelect(){
		lives = liveCategoryService.findAll();
		for (LiveCategory live : lives) {
			if (live.getStatusConfig() == 1) {
				selectLive = live;
			}
		}
		return SUCCESS;
	}
	
	public String select(){
		LiveCategory liveCategory = liveCategoryService.findById(model.getId());
		liveCategory.setStatusConfig(1);
		liveCategoryService.update(liveCategory);
		return SUCCESS;
	}
	
	public LiveCategory getModel() {
		return model;
	}
	public void setModel(LiveCategory model) {
		this.model = model;
	}
	public List<LiveCategory> getLives() {
		return lives;
	}
	public void setLives(List<LiveCategory> lives) {
		this.lives = lives;
	}
	public LiveCategory getSelectLive() {
		return selectLive;
	}
	public void setSelectLive(LiveCategory selectLive) {
		this.selectLive = selectLive;
	}
}
