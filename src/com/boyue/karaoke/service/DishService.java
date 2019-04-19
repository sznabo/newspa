package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.Dish;

public interface DishService {
	
	public PageBean<Dish> findPage(Dish model,Integer pageNo,Integer pageSize);
	
	public boolean saveType(Dish model);
	
	public boolean updateType(Dish model);
	
	public void deleteIds(List<Integer> ids);
	
	public Dish findById(Integer id);
	
	public List<Dish> findTypes(Integer styleId);
}
