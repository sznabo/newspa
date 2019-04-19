package com.boyue.karaoke.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.AppCategoryDetail;

public interface AppCategoryDetailDao extends DAO<AppCategoryDetail>{
	public PageBean<AppCategoryDetail> findPage(AppCategoryDetail model, int pageNo,
			int pageSize, List<Criterion> params);
	
	public List<AppCategoryDetail> findAll();

}
