package com.boyue.karaoke.service.impl;

import java.util.List;

import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.SongCategoryDAO;
import com.boyue.karaoke.model.SongCategory;
import com.boyue.karaoke.service.SongCategoryService;

/**
 *
 * @author ben
 * @date   2014-6-24 上午10:10:12
 *
 */

@Service
public class SongCategoryServiceImpl implements SongCategoryService {

	@Autowired
	private SongCategoryDAO songCategoryDAO;
	 
	@Override
	public void save(SongCategory songCategory) {
		songCategoryDAO.save(songCategory);
	}

	
	@Override
	public void update(SongCategory songCategory) {
		songCategoryDAO.update(songCategory);
	}

	
	@Override
	public SongCategory findById(int id) {
		return this.songCategoryDAO.findById(id);
	}

	
	@Override
	public void deleteByIdList(List<Integer> idList) {
		songCategoryDAO.deleteByIdList(idList);
	}

	
	@Override
	public PageBean<SongCategory> findPage(SongCategory songCategory,
			int pageNo, int pageSize) {
		return this.songCategoryDAO.findPage(songCategory, pageNo, pageSize );
	}
	
	@Override
	public PageBean<SongCategory> findPage(SongCategory songCategory,int pageNo, int pageSize,String nameSort) {
		return this.songCategoryDAO.findPageByOrder(songCategory, pageNo, pageSize, Order.desc(nameSort) );
	}


	@Override
	public List<SongCategory> findAll() {
		return songCategoryDAO.findAll();
	}

}
