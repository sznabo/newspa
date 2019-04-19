package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.AppInfo;

/**
 *
 * @author ben
 * @date   2014-6-27 下午5:15:01
 *
 */
public interface AppInfoService {

	/**
	 * @param appInfo
	 */
	void save(AppInfo appInfo);

	/**
	 * @param id
	 * @return
	 */
	AppInfo findById(int id);

	/**
	 * @param old
	 */
	void update(AppInfo old);

	/**
	 * @param idList
	 */
	void deleteByIdList(List<Integer> idList);

	/**
	 * @param appInfo
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PageBean<AppInfo> findPage(AppInfo appInfo, int pageNo, int pageSize);

	/**
	 * @return
	 */
	List<AppInfo> findAll();

}
