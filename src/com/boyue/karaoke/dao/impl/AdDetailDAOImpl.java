package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.AdDetailDAO;
import com.boyue.karaoke.model.AdDetail;

/**
 *
 * @author ben
 * @date   2014-7-1 下午3:59:10
 *
 */

@Repository
public class AdDetailDAOImpl  extends BaseDAOImpl<AdDetail> implements AdDetailDAO {

	@Override
	public PageBean<AdDetail> findPage(AdDetail t, int pageNo, int pageSize) {
		return super.findPage(t, pageNo, pageSize, Order.asc("position"));
	}
	
	public List<AdDetail> findByAd(int adId) {
		AdDetail t = new AdDetail();
		t.setAdid(adId);
		return this.findByExample(t, Order.asc("position"));
	}
	
	
	@Override
	public AdDetail findByAdId(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}
}
