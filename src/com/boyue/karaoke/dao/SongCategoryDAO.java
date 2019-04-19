package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.SongCategory;

/**
 *
 * @author ben
 * @date   2014-6-24 上午10:07:34
 *
 */
public interface SongCategoryDAO  extends DAO<SongCategory> {

	/**
	 * @return
	 */
	List<SongCategory> findAll();

}
