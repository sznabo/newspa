package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.TerminalSubMenuDao;
import com.boyue.karaoke.model.TerminalSubMenu;
@Repository
public class TerminalSubMenuDaoImpl extends BaseDAOImpl<TerminalSubMenu> implements TerminalSubMenuDao {

	@Override
	public void updateStatu(Integer id) {
		TerminalSubMenu menu = findById(id);
		int statu;
		if (menu.getStatu() == 0) {
			statu = 1;
		}else {
			statu = 0;
		}
		executeSql("update terminal_submenu set statu=" + statu + " where id=" + id);
		
	}

	@Override
	public List<TerminalSubMenu> findByMenuId(Integer id) {
		TerminalSubMenu menu = new TerminalSubMenu();
		menu.setMenuId(id);
		return findByExample(menu);
	}
	
	
}
