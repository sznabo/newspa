package com.boyue.karaoke.dao;

import java.util.Date;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.Syslog;

/**
 *
 * @author ben
 * @date   2014-7-2 上午11:00:17
 *
 */
public interface SyslogDAO extends DAO<Syslog> {

	int getTotal();

	/**
	 * @param day
	 */
	void deleteByDate(Date day);
}
