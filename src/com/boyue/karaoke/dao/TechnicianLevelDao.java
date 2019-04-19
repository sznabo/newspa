package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.TechnicianLevel;

public interface TechnicianLevelDao extends DAO<TechnicianLevel>{
	
	public List<TechnicianLevel> findLevel();
	

}
