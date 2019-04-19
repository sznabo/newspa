package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.Admin;

/**
 *  
 *  
 *
 */
public interface AdminService {

	void save(Admin admin);
	
	void update(Admin admin);
	
	Admin findById(int id);
	
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
	PageBean<Admin> findPage(Admin admin, int pageNumber, int pageSize);
	
	/**
	 * 根据多个ID一次查询出多条记录
	 * @param idList
	 * @return
	 */
	public List<Admin> findByIdList(List<Integer> idList);
	
	public Admin findByLoginName(String loginName);

	public List<Admin> findAll();
	
}
