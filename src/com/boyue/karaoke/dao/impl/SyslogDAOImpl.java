package com.boyue.karaoke.dao.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.framework.util.DateUtil;
import com.boyue.karaoke.dao.SyslogDAO;
import com.boyue.karaoke.model.Syslog;

/**
 *
 * @author ben
 * @date   2014-7-2 上午11:00:41
 *
 */
@Repository
public class SyslogDAOImpl extends BaseDAOImpl<Syslog> implements SyslogDAO {

	public PageBean<Syslog> findPage(Syslog log, int pageNo, int pageSize) {
		List params = new ArrayList();
		if (log !=null) {
			if (StringUtils.isNotBlank(log.getIp())) {
				params.add(Restrictions.like("ip", log.getIp().trim(),MatchMode.ANYWHERE));
			}
			if (StringUtils.isNotBlank(log.getOperator())) {
				params.add(Restrictions.like("operator", log.getOperator().trim(),MatchMode.ANYWHERE));
			}
			if (StringUtils.isNotBlank(log.getOperate())) {
				params.add(Restrictions.like("operate", log.getOperate().trim(),MatchMode.ANYWHERE));
			}
			if (log.getTime() != null) {
				params.add(Restrictions.ge("time", DateUtil.getDateStart(log.getTime())));
				params.add(Restrictions.le("time", DateUtil.getDateEnd(log.getTime())));
			}
		}
		return this.findPage(pageNo, pageSize, Syslog.class, params, Order.desc("time"));
	}

	/* (non-Javadoc)
	 * @see com.boyue.karaoke.dao.SyslogDAO#getTotal()
	 */
	@Override
	public int getTotal() {
		return this.count("select count(*) from Syslog");
	}

	@Override
	public void deleteByDate(Date day) {
		this.executeSql("delete from syslog where time<?", new Object[]{day});
	}
}
