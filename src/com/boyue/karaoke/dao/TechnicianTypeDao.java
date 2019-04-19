package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.TechnicianType;

public interface TechnicianTypeDao extends DAO<TechnicianType>{

	public List<TechnicianType> findTypes();
}
