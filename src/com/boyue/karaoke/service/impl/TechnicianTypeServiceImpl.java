package com.boyue.karaoke.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.TechnicianDao;
import com.boyue.karaoke.dao.TechnicianLevelDao;
import com.boyue.karaoke.dao.TechnicianTypeDao;
import com.boyue.karaoke.model.TechnicianType;
import com.boyue.karaoke.service.TechnicianTypeService;

@Service
public class TechnicianTypeServiceImpl implements TechnicianTypeService{
	@Autowired 
	private TechnicianTypeDao technicianTypeDao;
	@Autowired
	private TechnicianDao technicianDao;
	
	@Override
	public PageBean<TechnicianType> findPage(TechnicianType model,Integer pageNo,Integer pageSize) {
		
		return technicianTypeDao.findPage(model, pageNo, pageSize);
	}

	@Override
	public void deleteIds(List<Integer> ids) {
		for(Integer id:ids){
			if(technicianDao.findByType(id)){
				new File(findById(id).getImg()).delete();
				technicianTypeDao.deleteById(id);
			}
			
		}
	}

	@Override
	public boolean saveType(TechnicianType model) {
		boolean status = false;
		try{
			technicianTypeDao.save(model);
			status = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}

	@Override
	public boolean updateType(TechnicianType model) {
		boolean status = false;
		try{
			technicianTypeDao.update(model);
			status = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}

	@Override
	public TechnicianType findById(Integer id) {
		
		return technicianTypeDao.findById(id);
	}

	@Override
	public List<TechnicianType> findTypes() {
		
		return technicianTypeDao.findTypes();
	}


	
	
	
	
}
