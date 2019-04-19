package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.CloudsManage;

public interface CloudsManageDao extends DAO<CloudsManage>{
	
	public CloudsManage findCloudsManage();
	

}
