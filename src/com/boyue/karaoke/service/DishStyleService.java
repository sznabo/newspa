package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.Dish;
import com.boyue.karaoke.model.DishStyle;

public interface DishStyleService {
	
	public PageBean<DishStyle> findPage(DishStyle model,Integer pageNo,Integer pageSize);
	
	public boolean saveType(DishStyle model);
	
	public boolean updateType(DishStyle model);
	
	public void deleteIds(List<Integer> ids);
	
	public DishStyle findById(Integer id);
	
	public List<DishStyle> findTypes();
}
