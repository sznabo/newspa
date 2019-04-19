package com.boyue.karaoke.web.webaction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.Functions;
import com.boyue.karaoke.service.FunctionsService;
import com.boyue.karaoke.web.DefaultBaseAction;

@SuppressWarnings("serial")
@Controller("FunctionsAction")
@Scope(value = "prototype")
public class FunctionsAction extends DefaultBaseAction<Functions>{
	@Autowired
	private FunctionsService functionsService;
	
	private Functions model;

	private List<Functions> lists ;
	
	public String findList(){
		
		lists = functionsService.findAll();
		
		return SUCCESS;
	}
	
	public String toUpdate(){
		
		model = functionsService.findById(model.getId());
		
		return SUCCESS;
	}
	
	public String update(){
		if (model != null) {
			functionsService.updateFcuntion(model);
		}
		
		return SUCCESS;
	}
	public Functions getModel() {
		return model;
	}

	public void setModel(Functions model) {
		this.model = model;
	}

	public List<Functions> getLists() {
		return lists;
	}

	public void setLists(List<Functions> lists) {
		this.lists = lists;
	}
	
	

}
