package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.DishStyleDao;
import com.boyue.karaoke.dao.TechnicianTypeDao;
import com.boyue.karaoke.model.DishStyle;
import com.boyue.karaoke.model.TechnicianType;

@Repository
public class DishStyleDaoImpl extends BaseDAOImpl<DishStyle> implements DishStyleDao{

	@Override
	public List<DishStyle> findTypes() {
		return super.findByHql("from DishStyle");
	}

	
	
}
