package com.boyue.karaoke.dao.impl;

import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.TerminalMenuDao;
import com.boyue.karaoke.model.TerminalMenu;
@Repository
public class TerminalMenuDaoImpl extends BaseDAOImpl<TerminalMenu> implements TerminalMenuDao {

	@Override
	public void updateStatu(Integer id) {
		TerminalMenu terminalMenu = findById(id);
		int statu;
		if (terminalMenu.getStatu() == 0) {
			statu = 1;
		}else {
			statu = 0;
		}
		executeSql("update terminal_menu set statu=" + statu + " where id=" + id);
		
	}
	
	
}
