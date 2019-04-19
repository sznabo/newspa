package com.boyue.karaoke.dao;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.WakeupCall;

public interface WakeupCallDao extends DAO<WakeupCall>{
	
	//分页查找
	public PageBean<WakeupCall> findPage(WakeupCall model, int pageNo,
			int pageSize);
	
	
	Integer findUnresult();

}
