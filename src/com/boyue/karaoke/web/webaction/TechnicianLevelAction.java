package com.boyue.karaoke.web.webaction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.TechnicianLevel;
import com.boyue.karaoke.model.TechnicianType;
import com.boyue.karaoke.service.TechnicianLevelService;
import com.boyue.karaoke.web.DefaultBaseAction;

@SuppressWarnings("serial")
@Controller("TechnicianLevelAction")
@Scope(value = "prototype")
public class TechnicianLevelAction extends DefaultBaseAction<TechnicianLevel>{

@Autowired
private TechnicianLevelService technicianLevelService;

private TechnicianLevel model;

private List<Integer> idList;

/**
 * 分页展示
 * @return
 */
public String home() {
	if(model == null){
		model = new TechnicianLevel();
	}
	this.pageBean = technicianLevelService.findPage(model, pageNo, pageSize);
	
	return "success";
}


/**
 * 跳转到添加页面
 * @return
 */
public String toadd(){
	
	return "success";
}


/**
 * 添加
 * 
 * @return
 */
public String add(){
	if(model != null){
		if (getLang() == 1) {
			model.setNamee(model.getName());
		}else if (getLang() == 2) {
			model.setName(model.getNamee());
		}
		technicianLevelService.saveT(model);
	}
	return "success";
}

/**
 * 跳转到更新页面
 * @return
 */
public String toUpdate(){
	if(model.getId() != null){
		model = technicianLevelService.findById(model.getId());
	}
	return "success";
}

/**
 * 更新
 * @return
 */
public String update(){
	TechnicianLevel level = technicianLevelService.findById(model.getId());
	if(model!= null){
	  if (getLang() == 1) {
		model.setNamee(level.getNamee());
	}else if (getLang() == 2) {
		model.setName(level.getName());
	}
	  technicianLevelService.updateT(model);
	}
	return "success";
}


/**
 * 删除
 * @return
 */
public String delete(){
	if(idList!= null && idList.size() > 0){
	  technicianLevelService.deleteByIdList(idList);
	}
	return "success";
}


public TechnicianLevel getModel() {
	return model;
}

public void setModel(TechnicianLevel model) {
	this.model = model;
}

public List<Integer> getIdList() {
	return idList;
}

public void setIdList(List<Integer> idList) {
	this.idList = idList;
}







}
