package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.Device;
import com.boyue.karaoke.model.DeviceCategory;

/**
 *  
 *  
 *
 */
public interface DeviceCategoryService {

	void save(DeviceCategory deviceCategory);
	
	void save(DeviceCategory deviceCategory,Device device);
	
	void update(DeviceCategory deviceCategory);
	
	DeviceCategory findById(int id);
	
	void deleteById(int id);
	
	/**
	 * 根据多个ID删除多条记录
	 * @param idList
	 */
	void deleteByIdList(List<Integer> idList);
	
	void deleteUselessDeviceCategory();
	
	/**
	 * 根据模型里面的条件分页查询
	 * @param t
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	PageBean<DeviceCategory> findPage(DeviceCategory deviceCategory, int pageNumber, int pageSize);
	
	/**
	 * 根据多个ID一次查询出多条记录
	 * @param idList
	 * @return
	 */
	public List<DeviceCategory> findByIdList(List<Integer> idList);

	public List<DeviceCategory> findAll();
	
	/**
	 *查询所有
	 * 
	 * */
	public List<DeviceCategory> findAllCategorys(DeviceCategory deviceCategory);

	public DeviceCategory findByName(String categoryName);
	
	
}
