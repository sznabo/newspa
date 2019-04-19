package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.TerminalMenu;
import com.boyue.karaoke.model.TerminalSubMenu;
/**
 *
 * @author ben
 * @date   2014-7-1 上午9:52:58
 *
 */
public interface TerminalSubMenuService {

	/**
	 * @param id
	 * @return
	 */
	TerminalSubMenu findById(Integer id);

	List<TerminalSubMenu> findByMenuId(Integer menuId);
	/**
	 * @param old
	 */
	void updateStatu(Integer id);
	/**
	 * @param ad
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PageBean<TerminalSubMenu> findPage(TerminalSubMenu menu, int pageNo, int pageSize);
	
	List<TerminalSubMenu> findAll();

}
