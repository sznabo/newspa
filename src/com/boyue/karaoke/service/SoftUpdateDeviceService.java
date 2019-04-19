package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.SoftUpdateDevice;

/**
 *  
 *  
 *
 */
public interface SoftUpdateDeviceService {

	void save(SoftUpdateDevice softUpdateDevice);
	
	void update(SoftUpdateDevice softUpdateDevice);
	
	SoftUpdateDevice findById(int id);
	
	void deleteById(int id);
	
	/**
	 * 根据多个ID删除多条记录
	 * @param idList
	 */
	void deleteByIdList(List<Integer> idList);
	
	
	/**
	 * 根据模型里面的条件分页查询
	 * @param t
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	PageBean<SoftUpdateDevice> findPage(SoftUpdateDevice softUpdateDevice, int pageNumber, int pageSize);
	
	/**
	 * 根据多个ID一次查询出多条记录
	 * @param idList
	 * @return
	 */
	public List<SoftUpdateDevice> findByIdList(List<Integer> idList);

	public List<SoftUpdateDevice> findByTask(Integer id);
	
	public void deleteByTask(int  id);
	
	public void deleteByDevice(int deviceId);

	public List<SoftUpdateDevice> findbyDevice(int deviceid);


	
}
