package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.Calling;
import com.boyue.karaoke.model.Device;

/**
 *  
 *  
 *
 */
public abstract interface DeviceService {

	void save(Device device);
	
	void update(Device device);
	
	Device findById(int id);
	
	void deleteById(int id);
	
	/**
	 * 根据多个ID删除多条记录
	 * @param idList
	 */
	void deleteByIdList(List<Integer> idList);
	
	void updateDeviceStatusByIdList(List<Integer> idList);
	
	/**
	 * 根据模型里面的条件分页查询
	 * @param t
	 * @param pageNumber
	 * @param pageSize
	 * @return
	 */
	PageBean<Device> findPage(Device device, int pageNumber, int pageSize);
	
	/**
	 * 根据多个ID一次查询出多条记录
	 * @param idList
	 * @return
	 */
	public List<Device> findByIdList(List<Integer> idList);

	public List<Device> findAll();
	
	public List<Device> findByTerm(Device device);
	
	public List<Device> findByCategory(int categoryId);
	
	public Device findByMac(String mac);

	public void offline(String mac);
	
	public List<Device> findByProduct(int productId);
	
	/**
	 * 把所有设备初始化为离线
	 */
	public void initAllDeviceOffline();

	PageBean<Device> findDevicePage(List<Calling> callingList, int pageNo,
			int pageSize);

	 public abstract Integer findByMaxCount();
}
