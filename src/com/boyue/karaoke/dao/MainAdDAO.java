package com.boyue.karaoke.dao;

import java.util.List;

import org.hibernate.criterion.Order;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.MainAd;

public interface MainAdDAO extends DAO<MainAd>{
	
	List<MainAd> findAllByPosition();
	
	PageBean<MainAd> findPage(MainAd ad, int pageNo, int pageSize, Order asc);

	
}
