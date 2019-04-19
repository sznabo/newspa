package com.boyue.karaoke.service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.WakeupCall;

public interface WakeupCallService {
	
	PageBean<WakeupCall> findPage(WakeupCall model,int pageNo, int pageSize);
	
	
	Integer findUnresult();
	
	WakeupCall findById(Integer id);
	
	boolean updateWakeUp(WakeupCall model);
	
	boolean saveWakeUp(WakeupCall model);

}
