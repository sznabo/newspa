package com.boyue.karaoke.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.LiveCategoryDao;
import com.boyue.karaoke.model.LiveCategory;
import com.boyue.karaoke.service.LiveCategoryService;

@Service
public class LiveCategoryServiceImpl implements LiveCategoryService{

	@Autowired
	private LiveCategoryDao liveCategoryDao;
	
	

	@Override
	public PageBean<LiveCategory> findPage(LiveCategory model, int pageNo,
			int pageSize) {
		return liveCategoryDao.findPage(model, pageNo, pageSize);
	}

	@Override
	public void update(LiveCategory model) {
		if (model.getStatusConfig() == 1) {
			liveCategoryDao.updateStatus(model.getId());
		}
		try{
			liveCategoryDao.update(model);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public LiveCategory findById(Integer id) {
	
		return liveCategoryDao.findById(id);
	}

	@Override
	public List<LiveCategory> findAll() {
		// TODO Auto-generated method stub
		return liveCategoryDao.findAll();
	}
	
	

}
