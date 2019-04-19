package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.AppCategoryDetailDao;
import com.boyue.karaoke.model.AppCategoryDetail;

@Repository
public class AppCategoryDetailDaoImpl extends BaseDAOImpl<AppCategoryDetail> implements AppCategoryDetailDao{

	@Override
	public PageBean<AppCategoryDetail> findPage(AppCategoryDetail model, int pageNo,
			int pageSize, List<Criterion> params) {
		
		return super.findPage(pageNo, pageSize, AppCategoryDetail.class, params, Order.asc("position"));
	}


	
	
	
}
