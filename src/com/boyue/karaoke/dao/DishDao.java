package com.boyue.karaoke.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.Dish;
import com.boyue.karaoke.model.Technician;

public interface DishDao extends DAO<Dish>{

	public List<Dish> findByStyle(Integer styleId);
	
	public PageBean<Dish> findPage(Dish model, int pageNo,
			int pageSize, List<Criterion> params);
}
