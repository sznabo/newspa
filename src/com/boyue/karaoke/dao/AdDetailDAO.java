package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.AdDetail;

/**
 *
 * @author ben
 * @date   2014-7-1 下午3:58:51
 *
 */
public interface AdDetailDAO extends DAO<AdDetail>{
	
	public List<AdDetail> findByAd(int adId);
	
	public AdDetail findByAdId(Integer id);
}
