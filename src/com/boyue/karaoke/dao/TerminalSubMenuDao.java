package com.boyue.karaoke.dao;
import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.TerminalMenu;
import com.boyue.karaoke.model.TerminalSubMenu;

public interface TerminalSubMenuDao extends DAO<TerminalSubMenu>{
	public void updateStatu(Integer id);
	public List<TerminalSubMenu> findByMenuId(Integer id);
	public List<TerminalSubMenu> findAll();
	
}
