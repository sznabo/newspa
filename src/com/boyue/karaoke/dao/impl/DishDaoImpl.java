package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.DishDao;
import com.boyue.karaoke.dao.TechnicianTypeDao;
import com.boyue.karaoke.model.Dish;
import com.boyue.karaoke.model.Technician;
import com.boyue.karaoke.model.TechnicianType;

@Repository
public class DishDaoImpl extends BaseDAOImpl<Dish> implements DishDao{

	@Override
	public List<Dish> findByStyle(Integer styleId) {
		return super.findByHql("from Dish where styleId ="+styleId);
	}

	@Override
	public PageBean<Dish> findPage(Dish model, int pageNo, int pageSize,
			List<Criterion> params) {
		return super.findPage(pageNo, pageSize, Dish.class, params, null);
	}

	
	
}
