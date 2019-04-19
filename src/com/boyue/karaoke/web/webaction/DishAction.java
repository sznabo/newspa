package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.Dish;
import com.boyue.karaoke.model.DishStyle;
import com.boyue.karaoke.service.DishService;
import com.boyue.karaoke.service.DishStyleService;
import com.boyue.karaoke.web.DefaultBaseAction;

@SuppressWarnings("serial")
@Controller("DishAction")
@Scope(value = "prototype")
public class DishAction extends DefaultBaseAction<Dish>{
	@Autowired
	private DishService dishService;
	@Autowired
	private DishStyleService dishStyleService;
	
	private Dish model;
	
	private List<Integer> idList;
	
	private List<DishStyle> styles;
	
	
	/**
	 * 分页查找
	 * @return
	 */
	
	public String home(){
		if(model == null){
			model = new Dish();
		}
		this.styles = dishStyleService.findTypes();
		this.pageBean = dishService.findPage(model, pageNo, 6);
		if(this.pageBean.getElements() != null && this.pageBean.getElements().size() > 0){
			for(Dish d:this.pageBean.getElements()){
				DishStyle style = dishStyleService.findById(d.getStyleId());
				d.setStyle(style);
			}
		}
		return "success";
	}
	
	/**
	 * 跳转到添加页面
	 * @return
	 */
	public String toadd(){
		this.styles = dishStyleService.findTypes();
		return "success";
	}
	
	public String add(){
		if (getLang() == 1) {
			model.setNamee(model.getName());
			model.setDescriptione(model.getDescription());
		}else if (getLang() == 2) {
			model.setName(model.getNamee());
			model.setDescription(model.getDescriptione());
		}
		dishService.saveType(model);
		return "success";
	}
	
	public String toUpdate() {
		if(model.getId() != null){
			model = dishService.findById(model.getId());
		}
		this.styles = dishStyleService.findTypes();
		return "success";
	}
	
	public String update() {
		Dish old = dishService.findById(model.getId());
		if (StringUtils.isNotBlank(model.getImg())) {
			new File(old.getImg()).delete();
		}else {
			model.setImg(old.getImg());
		}
		if (getLang() ==1) {
			model.setDescriptione(old.getDescriptione());
			model.setNamee(old.getNamee());
		}else if (getLang() == 2) {
			model.setDescription(old.getDescription());
			model.setName(old.getName());
		}
		dishService.updateType(model);
		return "success";
	}

	public String deleteIds() {
		if(idList != null && idList.size() > 0){
			dishService.deleteIds(idList);
		}
		return "success";
	}

	public Dish getModel() {
		return model;
	}

	public void setModel(Dish model) {
		this.model = model;
	}

	public List<Integer> getIdList() {
		return idList;
	}

	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}

	public List<DishStyle> getStyles() {
		return styles;
	}

	public void setStyles(List<DishStyle> styles) {
		this.styles = styles;
	}


	
	
	
	
	
	

}
