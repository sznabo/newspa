package com.boyue.karaoke.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.WakeupCallDao;
import com.boyue.karaoke.model.WakeupCall;
import com.boyue.karaoke.service.WakeupCallService;

@Service
public class WakeupCallServiceImpl implements WakeupCallService{

	@Autowired
	private WakeupCallDao wakeupCallDao;
	
	
	/**
	 * 分页查找
	 */
	@Override
	public PageBean<WakeupCall> findPage(WakeupCall model, int pageNo,
			int pageSize) {
		return wakeupCallDao.findPage(model, pageNo, pageSize);
	}

	/**
	 * 未返回叫醒服务
	 */
	@Override
	public Integer findUnresult() {
		return wakeupCallDao.findUnresult();
	}

	
	@Override
	public WakeupCall findById(Integer id) {
		return wakeupCallDao.findById(id);
	}

	@Override
	public boolean updateWakeUp(WakeupCall model) {
		boolean status = false;
		try{
			wakeupCallDao.update(model);
			status = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public boolean saveWakeUp(WakeupCall model) {
		boolean status = false;
		try{
			model.setManageIf(0);
			model.setBackIf(0);
			model.setCreatetime(new Date());
			wakeupCallDao.save(model);
			status = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	
	
	
	
}
