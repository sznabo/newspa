package com.boyue.karaoke.dao;
import java.util.List;

import org.hibernate.criterion.Criterion;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.Technician;


public interface TechnicianDao extends DAO<Technician>{
	
	public PageBean<Technician> findPage(Technician model,int pageNo,int pageSize,List<Criterion> params);
	
    public Integer findBianhao();
    
    public boolean findByType(Integer id);
    
    public boolean findByLevel(Integer id);
    
    public List<Technician> findByTypeId(Integer TypeId);
}
