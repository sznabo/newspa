package com.boyue.karaoke.dao.impl;

import org.springframework.stereotype.Repository;

import com.boyue.karaoke.dao.BigCatDAO;
import com.boyue.karaoke.model.BigCat;
import com.boyue.framework.dao.BaseDAOImpl;

@Repository
public class BigCatDaoImpl extends BaseDAOImpl<BigCat> implements BigCatDAO{

	@Override
	public int updateStatus0() {
		
		return executeSql("update bigcat set state_x=0");
	}

	
	@Override
	public int findByStatu() {
		return executeSql1("select count(*) from BigCat where state_x = 1");
	}


	@Override
	public int updateStatus1() {
		return executeSql("update bigcat set state_x=1");
	}

	

}
