package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.LiveCategory;

public interface LiveCategoryDao extends DAO<LiveCategory>{
	
	public List<LiveCategory> findAll();
	public boolean updateStatus(Integer id);

}
