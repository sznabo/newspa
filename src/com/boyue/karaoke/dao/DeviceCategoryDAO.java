package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.DeviceCategory;

/**
 *  
 *  
 *
 */
public interface DeviceCategoryDAO extends DAO<DeviceCategory>  {

	public void deleteNoExistDeviceCategory();
	
}
