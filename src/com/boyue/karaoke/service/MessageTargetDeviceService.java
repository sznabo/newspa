package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.MessageTargetDevice;

/**
 *  
 *  
 *
 */
public interface MessageTargetDeviceService {

	void save(MessageTargetDevice messageTargetDevice);
	
	void update(MessageTargetDevice messageTargetDevice);
	
	MessageTargetDevice findById(int id);
	
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
	PageBean<MessageTargetDevice> findPage(MessageTargetDevice messageTargetDevice, int pageNumber, int pageSize);
	
	/**
	 * 根据多个ID一次查询出多条记录
	 * @param idList
	 * @return
	 */
	public List<MessageTargetDevice> findByIdList(List<Integer> idList);
	
	/**
	 * 根据messageId查询消息任务
	 * @param 
	 * @return
	 * */
	public List<MessageTargetDevice> findByMessageId(int messgeId);
	
	void deleteByDevice(int deviceId);
}
