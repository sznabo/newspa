package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.Message;

/**
 *  
 *  
 *
 */
public interface MessageService {

	void save(Message message,List<Integer> idList);
	
	void update(Message message,List<Integer> idlist);
	
	Message findById(int id);
	
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
	PageBean<Message> findPage(Message message, int pageNumber, int pageSize);
	
	/**
	 * 根据多个ID一次查询出多条记录
	 * @param idList
	 * @return
	 */
	public List<Message> findByIdList(List<Integer> idList);

	public List<Message> findDeviceMessage(int deviceId);
	
}
