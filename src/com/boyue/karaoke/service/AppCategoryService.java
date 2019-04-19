package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.AppCategory;


public interface AppCategoryService {
	
	/**
	 * 
	 * @param model
	 */
	void save(AppCategory model);
	
	/**
	 * @param id
	 * @return
	 */
	AppCategory findById(int id);

	/**
	 * @param old
	 */
	void update(AppCategory model);

	/**
	 * @param idList
	 */
	void deleteByIdList(List<Integer> idList);

	/**
	 * @param appInfo
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PageBean<AppCategory> findPage(AppCategory appInfo, int pageNo, int pageSize);
	
	
	List<AppCategory> findall();
	

}
