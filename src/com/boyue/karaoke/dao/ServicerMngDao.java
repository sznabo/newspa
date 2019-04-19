package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.Service1;

public interface ServicerMngDao extends DAO<Service1>{
	
	public List<Service1> loadServicerByType(String servisType);
	
	public List<Service1> loadServiceByHql(String hql);

}
