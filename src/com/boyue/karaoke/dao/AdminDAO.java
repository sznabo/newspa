package com.boyue.karaoke.dao;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.Admin;

/**
 *  
 *  
 *
 */
public interface AdminDAO extends DAO<Admin>  {
	
	public Admin findByLoginName(String name);
}
