package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.TechnicianType;
import com.boyue.karaoke.service.TechnicianTypeService;
import com.boyue.karaoke.web.DefaultBaseAction;


@SuppressWarnings("serial")
@Controller("TechnicianTypeAction")
@Scope(value = "prototype")
public class TechnicianTypeAction extends DefaultBaseAction<TechnicianType>{
	
@Autowired
private TechnicianTypeService technicianTypeService;
private TechnicianType model;
private List<Integer> idList;


/**
 * 分页展示
 * @return
 */
public String home() {
	if(model == null){
		model = new TechnicianType();
	}
	this.pageBean = technicianTypeService.findPage(model, pageNo, 6);
	LOG.info("page======={}", this.pageBean.toString());
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
		technicianTypeService.saveType(model);
	}
	return "success";
}

/**
 * 跳转到更新页面
 * @return
 */
public String toUpdate(){
	if(model.getId() != null){
		model = technicianTypeService.findById(model.getId());
	}
	return "success";
}

/**
 * 更新
 * @return
 */
public String update(){
	
	if(model!= null){
	  TechnicianType old = technicianTypeService.findById(model.getId());
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
	  technicianTypeService.updateType(model);
	}
	return "success";
}


/**
 * 删除
 * @return
 */
public String delete(){
	if(idList!= null && idList.size() > 0){
	  technicianTypeService.deleteIds(idList);
	}
	return "success";
}


public TechnicianType getModel() {
	return model;
}
public void setModel(TechnicianType model) {
	this.model = model;
}
public List<Integer> getIdList() {
	return idList;
}
public void setIdList(List<Integer> idList) {
	this.idList = idList;
}







}
