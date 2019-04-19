package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.AppCategory;
import com.boyue.karaoke.model.AppCategoryDetail;
import com.boyue.karaoke.service.AppCategoryDetailService;
import com.boyue.karaoke.service.AppCategoryService;
import com.boyue.karaoke.web.DefaultBaseAction;


@Controller("AppCategoryDetailAction")
@Scope(value = "prototype")
public class AppCategoryDetailAction extends DefaultBaseAction<AppCategoryDetail>{
	@Autowired
	private AppCategoryDetailService appCategoryDetailService;
	
	@Autowired
	private AppCategoryService appCategoryService;
	//页面传过来的id 列表
	private List<Integer> idList;
	
	private AppCategoryDetail model;
	
	private Integer categoryId;
	
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
				model.setContente(model.getContent());
			}else if (getLang() == 2) {
				model.setContent(model.getContente());
			}
			appCategoryDetailService.save(model);
		}
		return SUCCESS;
	}
/**
 * 跳转到修改页面
 * @return
 */
	public String toUpdate(){
		if(model != null && model.getId() != null){
			model = appCategoryDetailService.findById(model.getId());
		}
		
		return SUCCESS;
	}
	
	/**
	 * 修改
	 * @return
	 */
	public String update(){
		AppCategoryDetail old =appCategoryDetailService.findById(model.getId());
		if(model.getPath() != null && !model.getPath().trim().isEmpty()){
			new File(this.getProjectPath() + old.getPath()).delete();
		}else {
			model.setPath(old.getPath());
		}
		if (getLang() == 1) {
			model.setContente(old.getContente());
		}else if (getLang() ==2) {
			model.setContent(old.getContent());
		}
		appCategoryDetailService.update(model);
		return SUCCESS;
	}
	/**
	 * 删除
	 * @return
	 */
	public String deleteIds(){
		if(idList != null && idList.size() > 0){
			appCategoryDetailService.deleteByIdList(idList);
		}
		return SUCCESS;
	}
	
	/**
	 * 分页查询
	 * @return
	 */
	public String findPage() {
		if(model == null){
			model = new AppCategoryDetail();
		}
		if(categoryId != null){
			this.setSessionAttr("categoryId", categoryId);
		}else {
			categoryId = Integer.valueOf(this.getSessionAttr("categoryId").toString());
		}
		
		AppCategory category = appCategoryService.findById(categoryId);
		this.setSessionAttr("usName", category.getName());
		this.pageBean = appCategoryDetailService.findPage(model, pageNo, pageSize);
		return SUCCESS;
	}
	
	public List<Integer> getIdList() {
		return idList;
	}

	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}


	public AppCategoryDetail getModel() {
		return model;
	}


	public void setModel(AppCategoryDetail model) {
		this.model = model;
	}


	public Integer getCategoryId() {
		return categoryId;
	}


	public void setCategoryId(Integer categoryId) {
		this.categoryId = categoryId;
	}


	
	
	
	
	

}
