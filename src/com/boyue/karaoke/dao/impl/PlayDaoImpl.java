package com.boyue.karaoke.dao.impl;

import org.springframework.stereotype.Repository;

import com.boyue.karaoke.dao.LiveCategoryDao;
import com.boyue.karaoke.dao.PlayDAO;
import com.boyue.karaoke.model.LiveCategory;
import com.boyue.karaoke.model.Play;
import com.boyue.framework.dao.BaseDAOImpl;

@Repository
public class PlayDaoImpl extends BaseDAOImpl<Play> implements PlayDAO{

	@Override
	public boolean updateStatus(Integer id) {
		return executeSql("update play set statu_play=0 where id<>" + id)>0;
	}

	@Override
	public Play findByStatu() {
		// TODO Auto-generated method stub
		return null;
	}

}
