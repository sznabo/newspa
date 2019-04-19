package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.SoftUpdateTask;

/**
 *  
 *  
 *
 */
public interface SoftUpdateTaskDAO extends DAO<SoftUpdateTask>  {
	
	public List<SoftUpdateTask> findBySoft(int softId);
	
	
}
