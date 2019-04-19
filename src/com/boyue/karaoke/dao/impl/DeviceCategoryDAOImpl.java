package com.boyue.karaoke.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.DeviceCategoryDAO;
import com.boyue.karaoke.model.DeviceCategory;

/**
 *  
 *  
 *
 */
@Repository
public class DeviceCategoryDAOImpl extends BaseDAOImpl<DeviceCategory> implements DeviceCategoryDAO {

	@Override
	public void deleteNoExistDeviceCategory() {
		this.executeSql("DELETE FROM device_category WHERE NOT EXISTS (SELECT * FROM device WHERE device.category_id = device_category.id)");
	}
	
	@Override
	public void deleteByIdList(List idList) {
		this.executeSql("DELETE FROM device_category WHERE NOT EXISTS (SELECT * FROM device WHERE device.category_id = device_category.id) and id in(" 
				+ StringUtils.join(idList, ",") + ")");
	}
	
	@Override
	public void deleteById(Serializable id) {
		this.executeSql("DELETE FROM device_category WHERE NOT EXISTS (SELECT * FROM device WHERE device.category_id = device_category.id) and id=" + id);
	}
}
