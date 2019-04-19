package com.boyue.karaoke.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.util.CollectionUtils;
import com.boyue.karaoke.dao.SongCategoryDetailDAO;
import com.boyue.karaoke.model.Song;
import com.boyue.karaoke.model.SongCategory;
import com.boyue.karaoke.model.SongCategoryDetail;
import com.boyue.karaoke.service.SongCategoryDetailService;

/**
 *
 * @author ben
 * @date   2014-6-24 下午1:28:09
 *
 */
@Service
public class SongCategoryDetailServiceImpl implements SongCategoryDetailService {
	
	@Autowired
	private SongCategoryDetailDAO songCategoryDetailDAO;
	

	@Override
	public List<SongCategoryDetail> findByCategory(int categoryId) {
		return songCategoryDetailDAO.findByCategory(categoryId);
	}

	@Override
	public PageBean<SongCategoryDetail> findPage(int songCategoryId,
			int pageNo, int pageSize) {
		SongCategoryDetail c = new SongCategoryDetail();
		SongCategory category= new SongCategory();
		category.setId(songCategoryId);
		c.setCategory(category);
		return songCategoryDetailDAO.findPage(c, pageNo, pageSize);
	}

	@Override
	public void save(int categoryId, List<Integer> songIdList) {
		SongCategory c = new SongCategory();
		c.setId(categoryId);
		for (Integer songId : songIdList) {
			if(findIfGet(categoryId, songId)){
			SongCategoryDetail scd = new SongCategoryDetail();
			scd.setCategory(c);
			Song song = new Song();
			song.setId(songId);
			scd.setSong(song );
			songCategoryDetailDAO.save(scd);
			
			}
		}
	}

	@Override
	public void delete(List<Integer> idList) {
		songCategoryDetailDAO.deleteByIdList(idList);
	}

	@Override
	public void deleteBySong(List<Integer> songIdList) {
		if (CollectionUtils.isNotEmpty(songIdList)) {
			songCategoryDetailDAO.deleteBySongIdList(songIdList);
		}
	}

	@Override
	public void deleteCategorySong(int curCategory, List<Integer> songIdList) {
		if (CollectionUtils.isNotEmpty(songIdList)) {
			songCategoryDetailDAO.deleteCategorySong(curCategory, songIdList);
		}
	}
	
	@Override
	public boolean findIfGet(Integer categoryId, Integer songId) {
		
		return songCategoryDetailDAO.findIfGet(categoryId, songId);
	}

}
	
	
