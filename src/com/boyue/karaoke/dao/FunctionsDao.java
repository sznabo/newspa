package com.boyue.karaoke.dao;


import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.Functions;

public interface FunctionsDao extends DAO<Functions>{
	
	List<Functions> findAll();
	

}
