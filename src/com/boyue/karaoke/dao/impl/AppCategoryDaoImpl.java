package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.AppCategoryDao;
import com.boyue.karaoke.model.AppCategory;

@Repository
public class AppCategoryDaoImpl extends BaseDAOImpl<AppCategory> implements AppCategoryDao{

	@Override
	public PageBean<AppCategory> findPage(AppCategory model, int pageNo,
			int pageSize, List<Criterion> params) {
		
		return super.findPage(pageNo, pageSize, AppCategory.class, params, Order.asc("position"));
	}

	
	
}
