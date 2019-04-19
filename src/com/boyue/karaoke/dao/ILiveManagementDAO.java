package com.boyue.karaoke.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.LiveManagement;

public interface ILiveManagementDAO extends DAO<LiveManagement>{

	PageBean<LiveManagement> findPage(int pageNo, int pageSize,
			Class model, List<Criterion> params, Order order);

	int obtainPosition();

	void updateOtherPostion(Integer position);

	List<LiveManagement> findLiveManagementList(Integer id);

	List<LiveManagement> findAllLiveManagement();

	Integer findLiveChannelCodeMax();

	void updateOtherChannelCode(LiveManagement liveManagement);

	void updateLive(int i, Integer integer);

	List<LiveManagement> findAllLiveManagement2();

}
