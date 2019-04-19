package com.boyue.karaoke.dao;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.SoftUpdateDevice;

/**
 *  
 *  
 *
 */
public interface SoftUpdateDeviceDAO extends DAO<SoftUpdateDevice>  {

	/**
	 * @param id
	 */
	void deleteByTask(int taskId);

	/**
	 * @param deviceId
	 */
	void deleteByDevice(int deviceId);
	
}
