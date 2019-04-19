package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.SongCategoryDetail;

/**
 *
 * @author ben
 * @date   2014-6-24 下午1:24:07
 *
 */
public interface SongCategoryDetailDAO extends DAO<SongCategoryDetail> {

	/**
	 * @param categoryId
	 * @return
	 */
	List<SongCategoryDetail> findByCategory(int categoryId);

	/**
	 * @param idList
	 */
	void deleteBySongIdList(List<Integer> idList);

	/**
	 * @param curCategory
	 * @param songIdList
	 */
	void deleteCategorySong(int curCategory, List<Integer> songIdList);
	
	boolean findIfGet(Integer categoryId,Integer songId);

}
