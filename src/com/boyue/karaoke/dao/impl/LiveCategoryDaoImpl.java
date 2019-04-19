package com.boyue.karaoke.dao.impl;

import org.springframework.stereotype.Repository;

import com.boyue.karaoke.dao.LiveCategoryDao;
import com.boyue.karaoke.model.LiveCategory;
import com.boyue.framework.dao.BaseDAOImpl;

@Repository
public class LiveCategoryDaoImpl extends BaseDAOImpl<LiveCategory> implements LiveCategoryDao{

	@Override
	public boolean updateStatus(Integer id) {
		return executeSql("update live_category set status_config=0 where id<>" + id)>0;
	}

}
