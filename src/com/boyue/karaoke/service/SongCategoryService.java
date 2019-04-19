package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.SongCategory;

/**
 *
 * @author ben
 * @date   2014-6-24 上午10:10:03
 *
 */
public interface SongCategoryService {

	/**
	 * @param songCategory
	 */
	void save(SongCategory songCategory);

	/**
	 * @param songCategory
	 */
	void update(SongCategory songCategory);

	/**
	 * @param id
	 * @return
	 */
	SongCategory findById(int id);

	/**
	 * @param idList
	 */
	void deleteByIdList(List<Integer> idList);

	/**
	 * @param songCategory
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PageBean<SongCategory> findPage(SongCategory songCategory, int pageNo,
			int pageSize);
	PageBean<SongCategory> findPage(SongCategory songCategory,
			int pageNo, int pageSize,String nameSort);
	/**
	 * @return
	 */
	List<SongCategory> findAll();

	
}
