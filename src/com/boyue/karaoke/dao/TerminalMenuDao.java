package com.boyue.karaoke.dao;
import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.TerminalMenu;

public interface TerminalMenuDao extends DAO<TerminalMenu>{
	public void updateStatu(Integer id);
	public List<TerminalMenu> findAll();
	
}
