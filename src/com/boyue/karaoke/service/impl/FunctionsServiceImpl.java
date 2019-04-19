package com.boyue.karaoke.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.karaoke.dao.FunctionsDao;
import com.boyue.karaoke.model.Functions;
import com.boyue.karaoke.service.FunctionsService;

@Service
public class FunctionsServiceImpl implements FunctionsService{

	@Autowired FunctionsDao functionsDao;
	@Override
	public List<Functions> findAll() {
		
		return functionsDao.findAll();
	}

	@Override
	public Functions findById(Integer id) {
		
		return functionsDao.findById(id);
	}

	@Override
	public void updateFcuntion(Functions functions) {
		try {
			functionsDao.update(functions);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}

}
