package com.boyue.karaoke.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.apache.struts2.views.jsp.IfTag;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.TechnicianDao;
import com.boyue.karaoke.dao.TechnicianLevelDao;
import com.boyue.karaoke.dao.TechnicianTypeDao;
import com.boyue.karaoke.model.Technician;
import com.boyue.karaoke.service.TechnicianService;

@Service
public class TechnicianServiceImpl implements TechnicianService{
 @Autowired
 private TechnicianDao technicianDao;
 @Autowired
 private TechnicianLevelDao technicianLevelDao;
 @Autowired
 private TechnicianTypeDao technicianTypeDao;

@Override
public void deleteIds(List<Integer> ids) {
	for(Integer id:ids){
		Technician t = findById(id);
		new File(t.getImg()).delete();
		technicianDao.deleteById(id);
	}
	
}

@Override
public PageBean<Technician> findPage(Technician model, int pageNo,
		int pageSize) {
	List<Criterion> params = new ArrayList<Criterion>();
	if(model.getName() != null && !model.getName().trim().equals("")){
		params.add(Restrictions.like("name", model.getName().trim(),MatchMode.ANYWHERE));
	}
	if(model.getTypeId() != null){
		params.add(Restrictions.eq("typeId", model.getTypeId()));
	}
	if(model.getLevelId() != null){
		params.add(Restrictions.eq("levelId", model.getLevelId()));
	}
	if(model.getOnDuty() != null){
		params.add(Restrictions.eq("onDuty", model.getOnDuty()));
	}
	if(model.getStatus() != null){
		params.add(Restrictions.eq("status", model.getStatus()));
	}
	return technicianDao.findPage(model, pageNo, pageSize, params);
}

@Override
public boolean savemodel(Technician model) {
	boolean status = false;
	try{
		if(model.getOnDuty() == null){
			model.setOnDuty(1);
		}
		if (model.getStatus() == null) {
			model.setStatus(0);
		}
		model.setNumber(technicianDao.findBianhao());
		technicianDao.save(model);
		status = true;
	}catch (Exception e) {
		e.printStackTrace();
	}
	return status;
}

@Override
public boolean updatemodel(Technician model) {
	boolean status = false;
	try{
		technicianDao.update(model);
		status = true;
	}catch (Exception e) {
		e.printStackTrace();
	}
	return status;
}

@Override
public Technician findById(Integer id) {
	Technician model = technicianDao.findById(id);
	return model;
}

@Override
public List<Technician> findByType(Integer typeId) {
	List<Technician> lists  = technicianDao.findByTypeId(typeId);
	if(lists != null && lists.size() > 0){
		for(Technician t:lists){
			if(t != null){
			  if(t.getLevelId() != null){
			    t.setLevel(technicianLevelDao.findById(t.getLevelId()));
			  }
			   if(t.getTypeId() != null){
				   t.setType(technicianTypeDao.findById(t.getTypeId()));
			   }
			}
		}
	}
	return lists;
}


 
 

	
}
