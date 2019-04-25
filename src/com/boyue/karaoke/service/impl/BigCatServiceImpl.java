package com.boyue.karaoke.service.impl;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.karaoke.dao.BigCatDAO;
import com.boyue.karaoke.model.BigCat;
import com.boyue.karaoke.service.BigCatService;

@Service
public class BigCatServiceImpl implements BigCatService{

	@Autowired
	private BigCatDAO bigcatDao;
	@Override
	public int updateStatus0() {
		return bigcatDao.updateStatus0();
	}

	@Override
	public int updateStatus1() {
		return bigcatDao.updateStatus1();
	}

	@Override
	public int findByStatu() {
		return bigcatDao.findByStatu();
	}

	
	

}
