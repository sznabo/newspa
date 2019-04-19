package com.boyue.karaoke.service.impl;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.TechnicianDao;
import com.boyue.karaoke.dao.TechnicianLevelDao;
import com.boyue.karaoke.model.TechnicianLevel;
import com.boyue.karaoke.service.TechnicianLevelService;

@Service
public class TechnicianLevelServiceImpl implements TechnicianLevelService{
	@Autowired
	private TechnicianLevelDao technicianLevelDao;
	@Autowired
	private TechnicianDao technicianDao;
	
	
	@Override
	public PageBean<TechnicianLevel> findPage(TechnicianLevel model,
			Integer pageNo, Integer pageSize) {
		if(model == null){
			model = new TechnicianLevel();
		}
		return technicianLevelDao.findPage(model, pageNo, pageSize);
	}



	@Override
	public boolean saveT(TechnicianLevel model) {
		boolean status = false;
		try{
			technicianLevelDao.save(model);
			status = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}



	@Override
	public boolean updateT(TechnicianLevel model) {
		boolean status = false;
		try{
			technicianLevelDao.update(model);
			status = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}



	@Override
	public void deleteByIdList(List<Integer> idList) {
		for(Integer id:idList){
			if(technicianDao.findByLevel(id)){
				technicianLevelDao.deleteById(id);
			}
			
		}
		
	}



	@Override
	public TechnicianLevel findById(Integer id) {
		
		return technicianLevelDao.findById(id);
	}



	@Override
	public List<TechnicianLevel> findLevel() {
		
		return technicianLevelDao.findLevel();
	}

	
	
	
	
}
