package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.AppCategory;
import com.boyue.karaoke.model.LiveCategory;

public interface LiveCategoryService {

	/**
	 * @param old
	 */
	void update(LiveCategory model);
	
	PageBean<LiveCategory> findPage(LiveCategory model, int pageNo, int pageSize);
	List<LiveCategory> findAll();
	LiveCategory findById(Integer id);
}
