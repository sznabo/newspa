package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.WakeupCallDao;
import com.boyue.karaoke.model.WakeupCall;
@Repository
public class WakeupCallDaoImpl extends BaseDAOImpl<WakeupCall> implements WakeupCallDao{
	//分页查找
	@Override
	public PageBean<WakeupCall> findPage(WakeupCall model, int pageNo,
			int pageSize){
		
		return findPage(model, pageNo, pageSize,Order.asc("backIf"),Order.desc("createtime"));
	}

	@Override
	public Integer findUnresult() {
		List list = findBySql("SELECT COUNT(*) FROM wakeup_call WHERE back_if = 0", null);
		if (list == null || list.isEmpty()) {
			return 0;
		}
		return Integer.valueOf(list.get(0).toString());
	}
	
	
	
	

}
