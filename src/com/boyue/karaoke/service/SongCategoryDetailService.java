package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.SongCategoryDetail;

/**
 *
 * @author ben
 * @date   2014-6-24 下午1:27:19
 *
 */
public interface SongCategoryDetailService {

	List<SongCategoryDetail> findByCategory(int categoryId);


	/**
	 * @param songCategoryId
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PageBean<SongCategoryDetail> findPage(int songCategoryId, int pageNo,
			int pageSize);
	
	void save(int categoryId, List<Integer> songIdList);


	/**
	 * @param idList
	 */
	void delete(List<Integer> idList);


	/**
	 * @param songIdList
	 */
	void deleteBySong(List<Integer> songIdList);


	/**
	 * @param curCategory
	 * @param songIdList
	 */
	void deleteCategorySong(int curCategory, List<Integer> songIdList);
	
	boolean findIfGet(Integer categoryId,Integer songId);
}
