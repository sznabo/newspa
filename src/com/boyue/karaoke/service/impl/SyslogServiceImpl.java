package com.boyue.karaoke.service.impl;

import java.util.Date;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.util.DateUtil;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.dao.SyslogDAO;
import com.boyue.karaoke.model.Syslog;
import com.boyue.karaoke.service.SyslogService;

/**
 *
 * @author ben
 * @date   2014-7-2 上午11:01:35
 *
 */
@Service
public class SyslogServiceImpl implements SyslogService {

	@Autowired
	private SyslogDAO syslogDAO;
	
	@Override
	public void save(Syslog log) {
		syslogDAO.save(log);
		int logMax = SystemConfig.getLogMax();
		int total = syslogDAO.getTotal();
		if (total> logMax) {
			deleteOldLog();
		}
	}

	@Override
	public PageBean<Syslog> findPage(Syslog syslog, int pageNo, int pageSize) {
		return syslogDAO.findPage(syslog, pageNo, pageSize);
	}

	
	private void deleteOldLog() {
		Date day = DateUtil.addDay(new Date(), -30);
		syslogDAO.deleteByDate(day);
	}
	
}
