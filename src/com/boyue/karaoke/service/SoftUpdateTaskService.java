package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.SoftUpdateTask;

/**
 *  
 *  
 *
 */
public interface SoftUpdateTaskService {

	void save(SoftUpdateTask softUpdateTask);
	
	void update(SoftUpdateTask softUpdateTask);
	
	SoftUpdateTask findById(int id);
	
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
	PageBean<SoftUpdateTask> findPage(SoftUpdateTask softUpdateTask, int pageNumber, int pageSize);
	
	/**
	 * 根据多个ID一次查询出多条记录
	 * @param idList
	 * @return
	 */
	public List<SoftUpdateTask> findByIdList(List<Integer> idList);

	public List<SoftUpdateTask> findBySoft(int versionId);

	public SoftUpdateTask findByDevice(int deviceid, String softVersion);
	
}
