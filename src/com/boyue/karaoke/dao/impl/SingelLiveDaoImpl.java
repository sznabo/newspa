package com.boyue.karaoke.dao.impl;

import java.sql.Connection;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.SingelLiveDao;
import com.boyue.karaoke.model.SingelLive;


@Repository
public class SingelLiveDaoImpl extends BaseDAOImpl<SingelLive> implements SingelLiveDao{

	@Override
	public PageBean findPages(int pageNo, int pageSize, Class cls,
			List<Criterion> params, Order... order) {
		return this.findPage(pageNo, pageSize,cls, params ,order);
	}

	@Override
	public List<SingelLive> findLiveListOrderByPosition() {
		return this.findByHql("FROM SingelLive order by position asc");
	}

	@Override
	public void updateOtherPostion(int position) {
		this.executeSql("update SingelLive set position=position+1 where position>=" + position);
	}

	
	/**
	 * 获取位置
	 */
	@Override
	public int obtainPosition() {
		List list = this.findByHql("select max(position) FROM SingelLive ");
		if (list == null || list.isEmpty()||list.get(0) == null) {//如果没有记录，从1开始
			return 1;
		} else {
			return Integer.valueOf(list.get(0).toString()) + 1;
		}
		
	}

	@Override
	public List<SingelLive> loadByHql(String hql) {
		return this.findByHql(hql);
	}

	
	@Override
	public List loadManagementByHql(String hql) {
		// TODO Auto-generated method stub
		return this.findByHql(hql);
	}

	@Override
	public void delObject(String sql) {
		Transaction ts = this.getSessionFactory().openSession()
		.getTransaction();
        try {
	      ts.begin();
//	      this.getConnection().createStatement().executeUpdate(sql);
	      this.executeHql(sql);
	       ts.commit();
             } catch (Exception e) {
	                ts.rollback();
	                e.printStackTrace();
                 } finally {
	           if (ts != null & ts.isActive()) {
		   this.getSessionFactory().openSession().close();
	         }

                }
		
	}
	
	
	
	
	private Connection getConnection() {
		return this.getSessionFactory().getCurrentSession()
				.disconnect();
	}
	
	

}
