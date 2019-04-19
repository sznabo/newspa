package com.boyue.karaoke.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.karaoke.dao.ModuleDAO;
import com.boyue.karaoke.model.Module;
import com.boyue.karaoke.service.ModuleService;

/**
 *
 * @author ben
 * @date   2014-6-25 下午4:39:43
 *
 */
@Service
public class ModuleServiceImpl implements ModuleService {

	@Autowired
	private ModuleDAO moduleDAO;
	
	@Override
	public List<Module> findAll() {
		return moduleDAO.findAll();
	}

}
