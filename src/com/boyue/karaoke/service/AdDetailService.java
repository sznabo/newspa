package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.AdDetail;

/**
 *
 * @author ben
 * @date   2014-7-1 下午4:00:10
 *
 */
public interface AdDetailService {

	/**
	 * @param adDetail
	 */
	void update(AdDetail adDetail);

	/**
	 * @param adDetail
	 */
	void save(AdDetail adDetail);

	/**
	 * @param id
	 * @return
	 */
	AdDetail findById(Integer id);

	/**
	 * @param idList
	 */
	void deleteByIdList(List<Integer> idList);

	/**
	 * @param adDetail
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PageBean<AdDetail> findPage(AdDetail adDetail, int pageNo, int pageSize);
	
	public List<AdDetail> findByIdList(List<Integer> idList);

	/**
	 * @param id
	 * @return
	 */
	List<AdDetail> findByAd(int adId);

	AdDetail findByAdId(Integer id);

}
