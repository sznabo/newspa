package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.dao.TechnicianLevelDao;
import com.boyue.karaoke.model.TechnicianLevel;

@Repository
public class TechnicianLevelDaoImpl extends BaseDAOImpl<TechnicianLevel> implements TechnicianLevelDao{

	@Override
	public List<TechnicianLevel> findLevel() {
		
		return super.findByHql("from TechnicianLevel");
	}

	
}
