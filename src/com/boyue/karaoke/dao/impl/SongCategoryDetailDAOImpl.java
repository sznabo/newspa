package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.SongCategoryDetailDAO;
import com.boyue.karaoke.model.SongCategoryDetail;

/**
 *
 * @author ben
 * @date   2014-6-24 下午1:24:18
 *
 */
@Repository
public class SongCategoryDetailDAOImpl extends BaseDAOImpl<SongCategoryDetail> implements SongCategoryDetailDAO {

	@Override
	public List<SongCategoryDetail> findByCategory(int categoryId) {
		return this.findByHql("FROM SongCategoryDetail WHERE category.id=" + categoryId);
	}

	@Override
	public void deleteBySongIdList(List<Integer> songIdList) {
		this.executeSql("delete from song_category_detail where song_id in (" + StringUtils.join(songIdList, ",") +")");
	}

	@Override
	public void deleteCategorySong(int curCategory, List<Integer> songIdList) {
		this.executeSql("delete from song_category_detail where song_id in (" + StringUtils.join(songIdList, ",") +") and category_id=" + curCategory);
	}

	@Override
	public boolean findIfGet(Integer categoryId, Integer songId) {
		List<SongCategoryDetail> lists = this.findByHql("from SongCategoryDetail where category.id ="+categoryId +" and song.id ="+songId);
		if(lists != null && lists.size() > 0){
			return false;
		}else {
			return true;
		}
		
	}
	
	

}
