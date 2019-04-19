package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.DishStyle;
import com.boyue.karaoke.service.DishStyleService;
import com.boyue.karaoke.web.DefaultBaseAction;


@SuppressWarnings("serial")
@Controller("DishStyleAction")
@Scope(value = "prototype")
public class DishStyleAction extends DefaultBaseAction<DishStyle>{
	
@Autowired
private DishStyleService dishStyleService;
private DishStyle model;
private List<Integer> idList;


/**
 * 分页展示
 * @return
 */
public String home() {
	if(model == null){
		model = new DishStyle();
	}
	this.pageBean = dishStyleService.findPage(model, pageNo, 6);
	
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
		dishStyleService.saveType(model);
	}
	return "success";
}

/**
 * 跳转到更新页面
 * @return
 */
public String toUpdate(){
	if(model.getId() != null){
		model = dishStyleService.findById(model.getId());
	}
	return "success";
}

/**
 * 更新
 * @return
 */
public String update(){
	
	if(model!= null){
	  DishStyle old = dishStyleService.findById(model.getId());
	  if(StringUtils.isNotBlank(model.getImg())){
		  new File(old.getImg()).delete();
	  }else {
		  model.setImg(old.getImg());
	}
	  if (getLang() == 1) {
		model.setNamee(old.getNamee());
	}else if (getLang() == 2) {
		model.setName(old.getName());
	}
	  dishStyleService.updateType(model);
	}
	return "success";
}


/**
 * 删除
 * @return
 */
public String delete(){
	if(idList!= null && idList.size() > 0){
	  dishStyleService.deleteIds(idList);
	}
	return "success";
}


public DishStyle getModel() {
	return model;
}


public void setModel(DishStyle model) {
	this.model = model;
}


public List<Integer> getIdList() {
	return idList;
}
public void setIdList(List<Integer> idList) {
	this.idList = idList;
}







}
