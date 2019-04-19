package com.boyue.karaoke.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.SongStatDAO;
import com.boyue.karaoke.model.SongStat;

/**
 *
 * @author ben
 * @date   2014-7-3 上午10:31:07
 *
 */
@Repository
public class SongStatDAOImpl extends BaseDAOImpl<SongStat> implements SongStatDAO {

	@SuppressWarnings("unchecked")
	public PageBean<SongStat> findPage(SongStat s, int pageNo, int pageSize) {
		List params = new ArrayList();
		if (s != null) {
			if (StringUtils.isNotBlank(s.getMac())) {
				params.add(Restrictions.eq("mac", s.getMac()));
			}
			if (StringUtils.isNotBlank(s.getUserName())) {
				params.add(Restrictions.eq("userName", s.getUserName()));
			}
			if (StringUtils.isNotBlank(s.getSongName())) {
				params.add(Restrictions.eq("songName", s.getSongName()));
			}
			if (s.getStartTime() != null) {
				params.add(Restrictions.ge("time", s.getStartTime()));
			}
			if (s.getEndTime() != null) {
				params.add(Restrictions.le("time", s.getEndTime()));
			}
		}
		return this.findPage(pageNo, pageSize, SongStat.class, params, Order.desc("time"));
	}
	
}
