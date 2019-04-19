package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.TechnicianType;

public interface TechnicianTypeService {
	
	public PageBean<TechnicianType> findPage(TechnicianType model,Integer pageNo,Integer pageSize);
	
	public boolean saveType(TechnicianType model);
	
	public boolean updateType(TechnicianType model);
	
	public void deleteIds(List<Integer> ids);
	
	public TechnicianType findById(Integer id);
	
	public List<TechnicianType> findTypes();
}
