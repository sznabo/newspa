package com.boyue.karaoke.service;


import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.CloudsManage;

public interface CloudsManageService {
	
	public PageBean<CloudsManage> findPage(CloudsManage model,int pageNo,int pageSize);
	
	public boolean updateClounds(CloudsManage model);
	
	public CloudsManage findById(Integer id);
	
	public void changeOnline();
	
	public CloudsManage findClouds();

}
