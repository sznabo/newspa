package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.MainAdDAO;
import com.boyue.karaoke.model.MainAd;

@Repository
public class MainAdDAOImpl extends BaseDAOImpl<MainAd> implements MainAdDAO{

	
	@Override
	public List<MainAd> findAllByPosition() {
		
		return findByHql("from MainAd order by position");
	}

	@Override
	public PageBean<MainAd> findPage(MainAd ad, int pageNo, int pageSize, Order asc) {
		return super.findPage(ad, pageNo, pageSize, Order.asc("position"));
	}

}
