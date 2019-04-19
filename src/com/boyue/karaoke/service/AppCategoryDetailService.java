package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.AppCategoryDetail;


public interface AppCategoryDetailService {
	
	/**
	 * 
	 * @param model
	 */
	void save(AppCategoryDetail model);
	
	/**
	 * @param id
	 * @return
	 */
	AppCategoryDetail findById(int id);

	/**
	 * @param old
	 */
	void update(AppCategoryDetail model);

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
	PageBean<AppCategoryDetail> findPage(AppCategoryDetail appInfo, int pageNo, int pageSize);
	
	
//	List<AppCategoryDetail> findall();
	

}
