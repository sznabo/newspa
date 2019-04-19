package com.boyue.karaoke.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.SingelLive;

public interface SingelLiveDao extends DAO<SingelLive>{
	
	
	public PageBean findPages(int pageNo, int pageSize, Class cls,
			List<Criterion> params, Order... order);
	
	
	
	public List<SingelLive> findLiveListOrderByPosition();
	
	
	//修改其他直播的位置
	public void updateOtherPostion(int position);
	
	
	/**
	 * 获取位置
	 * @return
	 */
	public int obtainPosition();
	
	
	
	public List loadByHql(String hql);
	
	
	public List loadManagementByHql(String hql);
	
	
	public void delObject(String sql);

}
