package com.boyue.karaoke.web.webaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.CloudsManage;
import com.boyue.karaoke.service.CloudsManageService;
import com.boyue.karaoke.web.DefaultBaseAction;

@SuppressWarnings("serial")
@Controller("CloudsManageAction")
@Scope(value = "prototype")
public class CloudsManageAction extends DefaultBaseAction<CloudsManage>{
	@Autowired 
	private CloudsManageService cloudsManageService;
	private CloudsManage model;
	/**
	 * 分页查找
	 * @return
	 */
	public String list(){
		this.pageBean = cloudsManageService.findPage(model, pageNo, pageSize);
		return SUCCESS;
	}
	
	/**
	 * 跳转到更新页面
	 * @return
	 */
	public String toUpdate() {
		if(model.getId() != null){
			model = cloudsManageService.findById(model.getId());
		}
		
		return SUCCESS;
	}
	
	/**
	 * 更新
	 * @return
	 */
	public String update() {
		if(model != null){
			cloudsManageService.updateClounds(model);
		}

		return SUCCESS;
	}
	
	public CloudsManage getModel() {
		return model;
	}
	public void setModel(CloudsManage model) {
		this.model = model;
	}
	
	
	
	

}
