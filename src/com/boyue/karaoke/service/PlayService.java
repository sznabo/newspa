package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.AppCategory;
import com.boyue.karaoke.model.LiveCategory;
import com.boyue.karaoke.model.Play;

public interface PlayService {

	/**
	 * @param old
	 */
	void update(Play model);
	
	PageBean<Play> findPage(Play model, int pageNo, int pageSize);
	List<Play> findAll();
	Play findById(Integer id);
}
