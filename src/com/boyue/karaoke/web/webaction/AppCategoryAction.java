package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.AppCategory;
import com.boyue.karaoke.service.AppCategoryService;
import com.boyue.karaoke.web.DefaultBaseAction;


@Controller("AppCategoryAction")
@Scope(value = "prototype")
public class AppCategoryAction extends DefaultBaseAction<AppCategory>{
	@Autowired
	private AppCategoryService appCategoryService;
	
	//页面传过来的id 列表
	private List<Integer> idList;
	
	private AppCategory model;
	
	
	
	/**
	 * 进入增加页面
	 * @return
	 */
	public String toAdd() {
		return SUCCESS;
	}
	
	
	/**
	 * 增加
	 * @return
	 * @throws IOException 
	 */
	public String save() {
		if(model != null){
			if (getLang() == 1) {
				model.setNamee(model.getName());
			}else if (getLang() == 2) {
				model.setName(model.getNamee());
			}
			appCategoryService.save(model);
		}
		return SUCCESS;
	}
/**
 * 跳转到修改页面
 * @return
 */
	public String toUpdate(){
		if(model != null && model.getId() != null){
			model = appCategoryService.findById(model.getId());
		}
		
		return SUCCESS;
	}
	
	/**
	 * 修改
	 * @return
	 */
	public String update(){
		AppCategory old =appCategoryService.findById(model.getId());
		if(model.getPath() != null && !model.getPath().trim().isEmpty()){
			new File(this.getProjectPath() + old.getPath()).delete();
		}else {
			model.setPath(old.getPath());
		}
		if(getLang() == 1){
			model.setNamee(old.getNamee());
		}else if (getLang() == 2) {
			model.setName(old.getName());
		}
		appCategoryService.update(model);
		return SUCCESS;
	}
	/**
	 * 删除
	 * @return
	 */
	public String deleteIds(){
		if(idList != null && idList.size() > 0){
			appCategoryService.deleteByIdList(idList);
		}
		return SUCCESS;
	}
	
	/**
	 * 分页查询
	 * @return
	 */
	public String findPage() {
		if(model == null){
			model = new AppCategory();
		}
		this.pageBean = appCategoryService.findPage(model, pageNo, 4);
		return SUCCESS;
	}
	
	public List<Integer> getIdList() {
		return idList;
	}

	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}

	public AppCategory getModel() {
		return model;
	}

	public void setModel(AppCategory model) {
		this.model = model;
	}
	
	
	
	
	

}
