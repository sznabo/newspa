package com.boyue.karaoke.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.DishDao;
import com.boyue.karaoke.dao.DishStyleDao;
import com.boyue.karaoke.dao.TechnicianDao;
import com.boyue.karaoke.model.DishStyle;
import com.boyue.karaoke.service.DishStyleService;

@Service
public class DishStyleServiceImpl implements DishStyleService{
	@Autowired 
	private DishStyleDao dishStyleDao;
	@Autowired
	private DishDao dishDao;
	
	@Override
	public PageBean<DishStyle> findPage(DishStyle model,Integer pageNo,Integer pageSize) {
		
		return dishStyleDao.findPage(model, pageNo, pageSize);
	}

	@Override
	public void deleteIds(List<Integer> ids) {
		for(Integer id:ids){
			if(dishDao.findByStyle(id) != null && dishDao.findByStyle(id).size() > 0){
				
			}else {
				new File(findById(id).getImg()).delete();
				dishStyleDao.deleteById(id);
			}
			
		}
	}

	@Override
	public boolean saveType(DishStyle model) {
		boolean status = false;
		try{
			dishStyleDao.save(model);
			status = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}

	@Override
	public boolean updateType(DishStyle model) {
		boolean status = false;
		try{
			dishStyleDao.update(model);
			status = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}

	@Override
	public DishStyle findById(Integer id) {
		
		return dishStyleDao.findById(id);
	}

	@Override
	public List<DishStyle> findTypes() {
		
		return dishStyleDao.findTypes();
	}


	
	
	
	
}
