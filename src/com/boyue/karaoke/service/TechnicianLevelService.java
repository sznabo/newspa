package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.TechnicianLevel;

public interface TechnicianLevelService {
	
	public PageBean<TechnicianLevel> findPage(TechnicianLevel model,Integer pageNo,Integer pageSize);
	
	public boolean saveT(TechnicianLevel model);
	
	public boolean updateT(TechnicianLevel model);
	
	public void deleteByIdList(List<Integer> idList);
	
	public TechnicianLevel findById(Integer id);
	
	public List<TechnicianLevel> findLevel();

}
