package com.boyue.karaoke.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.DishDao;
import com.boyue.karaoke.dao.TechnicianDao;
import com.boyue.karaoke.dao.TechnicianLevelDao;
import com.boyue.karaoke.dao.TechnicianTypeDao;
import com.boyue.karaoke.model.Dish;
import com.boyue.karaoke.model.TechnicianType;
import com.boyue.karaoke.service.DishService;
import com.boyue.karaoke.service.TechnicianTypeService;

@Service
public class DishServiceImpl implements DishService{
	@Autowired 
	private DishDao dishDao;
	@Autowired
	private TechnicianDao technicianDao;
	
	@Override
	public PageBean<Dish> findPage(Dish model,Integer pageNo,Integer pageSize) {
		List<Criterion> params = new ArrayList<Criterion>();
		if(model.getName() != null && !model.getName().trim().equals("")){
			params.add(Restrictions.like("name", model.getName().trim(),MatchMode.ANYWHERE));
		}
		if(model.getNamee() != null && !model.getNamee().trim().equals("")){
			params.add(Restrictions.like("namee", model.getNamee().trim(),MatchMode.ANYWHERE));
		}
		if(model.getStyleId() != null){
			params.add(Restrictions.eq("styleId", model.getStyleId()));
		}
		
		return dishDao.findPage(model, pageNo, pageSize,params);
	}

	@Override
	public void deleteIds(List<Integer> ids) {
		for(Integer id:ids){
			if(technicianDao.findByType(id)){
				new File(findById(id).getImg()).delete();
				dishDao.deleteById(id);
			}
			
		}
	}

	@Override
	public boolean saveType(Dish model) {
		boolean status = false;
		try{
			dishDao.save(model);
			status = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}

	@Override
	public boolean updateType(Dish model) {
		boolean status = false;
		try{
			dishDao.update(model);
			status = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}

	@Override
	public Dish findById(Integer id) {
		
		return dishDao.findById(id);
	}

	@Override
	public List<Dish> findTypes(Integer styleId) {
		
		return dishDao.findByStyle(styleId);
	}


	
	
	
	
}
