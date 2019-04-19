package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.AppInfo;

/**
 *
 * @author ben
 * @date   2014-6-27 下午5:13:57
 *
 */
public interface AppInfoDAO extends DAO<AppInfo> {

	/**
	 * @return
	 */
	List<AppInfo> findAll();
	
	public boolean findByCategoryId(Integer id);
	
	public List<AppInfo> findByCategoryIds(Integer id);

}
