package com.boyue.karaoke.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.LiveCategoryDao;
import com.boyue.karaoke.dao.PlayDAO;
import com.boyue.karaoke.model.LiveCategory;
import com.boyue.karaoke.model.Play;
import com.boyue.karaoke.service.LiveCategoryService;
import com.boyue.karaoke.service.PlayService;

@Service
public class PlayServiceImpl implements PlayService{

	@Autowired
	private PlayDAO playDao;
	
	

	@Override
	public PageBean<Play> findPage(Play model, int pageNo,
			int pageSize) {
		return playDao.findPage(model, pageNo, pageSize);
	}

	@Override
	public void update(Play model) {
		if (model.getStatu_play() == 1) {
			playDao.updateStatus(model.getId());
		}
		try{
			playDao.update(model);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public Play findById(Integer id) {
	
		return playDao.findById(id);
	}

	@Override
	public List<Play> findAll() {
		// TODO Auto-generated method stub
		return playDao.findAll();
	}
	
	

}
