package com.boyue.karaoke.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.TerminalSubMenuDao;
import com.boyue.karaoke.model.TerminalSubMenu;
import com.boyue.karaoke.service.TerminalSubMenuService;

@Service
public class TerminalSubMenuServiceImpl implements TerminalSubMenuService{

	@Autowired
	TerminalSubMenuDao terminalMenuDao;
	
	@Override
	public TerminalSubMenu findById(Integer id) {
		
		return terminalMenuDao.findById(id);
	}



	@Override
	public void updateStatu(Integer id) {
		
		terminalMenuDao.updateStatu(id);
	}

	@Override
	public PageBean<TerminalSubMenu> findPage(TerminalSubMenu menu, int pageNo,
			int pageSize) {
		
		return terminalMenuDao.findPage(menu, pageNo, pageSize);
	}
	
	@Override
	public List<TerminalSubMenu> findByMenuId(Integer menuId) {
		
		return terminalMenuDao.findByMenuId(menuId);
	}



	@Override
	public List<TerminalSubMenu> findAll() {
		
		return terminalMenuDao.findAll();
	}



}
