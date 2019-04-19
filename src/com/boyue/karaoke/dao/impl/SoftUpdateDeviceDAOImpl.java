package com.boyue.karaoke.dao.impl;

import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.SoftUpdateDeviceDAO;
import com.boyue.karaoke.model.SoftUpdateDevice;

/**
 *  
 *  
 *
 */
@Repository
public class SoftUpdateDeviceDAOImpl extends BaseDAOImpl<SoftUpdateDevice> implements SoftUpdateDeviceDAO {

	@Override
	public void deleteByTask(int taskId) {
		this.executeSql("delete from soft_update_device where soft_update_task_id=" + taskId);
	}

	@Override
	public void deleteByDevice(int deviceId) {
		this.executeSql("delete from soft_update_device where device_id=" + deviceId);
	}

}
