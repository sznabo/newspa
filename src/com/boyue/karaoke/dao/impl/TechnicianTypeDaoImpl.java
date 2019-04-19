package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.TechnicianTypeDao;
import com.boyue.karaoke.model.TechnicianType;

@Repository
public class TechnicianTypeDaoImpl extends BaseDAOImpl<TechnicianType> implements TechnicianTypeDao{

	@Override
	public List<TechnicianType> findTypes() {
		
		return super.findByHql("from TechnicianType");
	}

	
}
