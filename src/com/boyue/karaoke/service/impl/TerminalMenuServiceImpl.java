package com.boyue.karaoke.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.TerminalMenuDao;
import com.boyue.karaoke.model.TerminalMenu;
import com.boyue.karaoke.service.TerminalMenuService;

@Service
public class TerminalMenuServiceImpl implements TerminalMenuService{

	@Autowired
	TerminalMenuDao terminalMenuDao;
	
	@Override
	public TerminalMenu findById(Integer id) {
		
		return terminalMenuDao.findById(id);
	}

	@Override
	public void update(TerminalMenu menu) {
		terminalMenuDao.update(menu);
		
	}

	@Override
	public void updateStatu(Integer id) {
		
		terminalMenuDao.updateStatu(id);
	}

	@Override
	public PageBean<TerminalMenu> findPage(TerminalMenu menu, int pageNo,
			int pageSize) {
		
		return terminalMenuDao.findPage(menu, pageNo, pageSize);
	}

	@Override
	public List<TerminalMenu> findAll() {
		return terminalMenuDao.findAll();
	}

}
