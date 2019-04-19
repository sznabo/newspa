package com.boyue.karaoke.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.AppCategory;

public interface AppCategoryDao extends DAO<AppCategory>{
	public PageBean<AppCategory> findPage(AppCategory model, int pageNo,
			int pageSize, List<Criterion> params);
	
	public List<AppCategory> findAll();

}
