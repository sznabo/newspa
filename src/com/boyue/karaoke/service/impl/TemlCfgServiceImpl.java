package com.boyue.karaoke.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.karaoke.dao.TemlCfgDAO;
import com.boyue.karaoke.model.TemlCfg;
import com.boyue.karaoke.service.TemlCfgService;
@Service
public class TemlCfgServiceImpl implements TemlCfgService {

	@Autowired
	private TemlCfgDAO temlCfgDAO;
	
	@Override
	public TemlCfg findByKey(String key) {
		
		return temlCfgDAO.findById(key);
	}

	@Override
	public List<TemlCfg> findAll() {
		
		return temlCfgDAO.findAll();
	}

	@SuppressWarnings("null")
	@Override
	public boolean update(TemlCfg temlCfg) {
		if (temlCfg == null && temlCfg.getKey() == null) {
			return false;
		}
		TemlCfg model = temlCfgDAO.findById(temlCfg.getKey());
		if (model == null) {
			temlCfgDAO.save(temlCfg);
		}else {
			if (temlCfg.getDesc() != null) {
				model.setDesc(temlCfg.getDesc());
			}
			if (temlCfg.getKey() != null) {
				model.setKey(temlCfg.getKey());
			}
			if (temlCfg.getValue() != null) {
				model.setValue(temlCfg.getValue());
			}
			temlCfgDAO.update(model);
		}
		return true;
	}

}
