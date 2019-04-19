package com.boyue.karaoke.dao;

import java.util.List;

import org.hibernate.criterion.Order;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.Ad;
import com.boyue.karaoke.model.TemlCfg;

/**
 *
 * @author ben
 * @date   2014-7-1 上午9:50:41
 *
 */
public interface TemlCfgDAO extends DAO<TemlCfg> {

	/**
	 * @return
	 */
	List<TemlCfg> findAll();
	

}
