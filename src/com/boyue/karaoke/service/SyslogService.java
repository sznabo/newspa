package com.boyue.karaoke.service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.Syslog;

/**
 *
 * @author ben
 * @date   2014-7-2 上午11:01:27
 *
 */
public interface SyslogService {

	void save(Syslog log);

	/**
	 * @param syslog
	 * @param pageNo
	 * @param pageSize
	 * @return
	 */
	PageBean<Syslog> findPage(Syslog syslog, int pageNo, int pageSize);

}
