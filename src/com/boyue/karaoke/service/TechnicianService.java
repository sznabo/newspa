package com.boyue.karaoke.service;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.Technician;

public interface TechnicianService {

	public PageBean<Technician> findPage(Technician model,int pageNo,int pageSize);
	
    public boolean savemodel(Technician model);
	
	public boolean updatemodel(Technician model);
	
	public void deleteIds(List<Integer> ids);
	
	public Technician findById(Integer id);
	
	public List<Technician> findByType(Integer typeId);
}
