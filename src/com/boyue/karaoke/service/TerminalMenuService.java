package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.TerminalMenu;
/**
 *
 * @author ben
 * @date   2014-7-1 上午9:52:58
 *
 */
public interface TerminalMenuService {

	/**
	 * @param id
	 * @return
	 */
	TerminalMenu findById(Integer id);

	/**
	 * @param old
	 */
	void update(TerminalMenu menu);

	
	void updateStatu(Integer id);
	/**
	 * @param ad
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PageBean<TerminalMenu> findPage(TerminalMenu menu, int pageNo, int pageSize);
	
	List<TerminalMenu> findAll();

}
