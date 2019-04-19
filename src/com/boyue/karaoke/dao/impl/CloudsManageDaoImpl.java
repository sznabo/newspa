package com.boyue.karaoke.dao.impl;


import java.util.List;

import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.CloudsManageDao;
import com.boyue.karaoke.model.CloudsManage;

@Repository
public class CloudsManageDaoImpl extends BaseDAOImpl<CloudsManage> implements CloudsManageDao{

	@Override
	public CloudsManage findCloudsManage() {
	    List<CloudsManage> lists =  super.findAll();
		if(lists != null && lists.size() > 0){
			return lists.get(0);
		}else {
			return null;
		}
	}

	

}
