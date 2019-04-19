package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.DishStyle;
import com.boyue.karaoke.model.TechnicianType;

public interface DishStyleDao extends DAO<DishStyle>{

	public List<DishStyle> findTypes();
}
