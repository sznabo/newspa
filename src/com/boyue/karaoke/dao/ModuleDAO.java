package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.Module;

/**
 *
 * @author ben
 * @date   2014-6-25 下午4:40:48
 *
 */
public interface ModuleDAO extends DAO<Module> {

	/**
	 * @return
	 */
	List<Module> findAll();

}
