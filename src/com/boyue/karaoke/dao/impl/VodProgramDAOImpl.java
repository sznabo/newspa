package com.boyue.karaoke.dao.impl;


import java.util.ArrayList;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.IVodProgramDAO;
import com.boyue.spa.domain.Vodprogram;
@Repository
public class VodProgramDAOImpl extends BaseDAOImpl<Vodprogram> implements IVodProgramDAO {
	

	/**
	 * @Name: findVodprogramByID
	 * @Description: 根据ID查询影片
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-11（创建日期）
	 * @Parameters: Integer vodid 栏目ID
	 * @Return: List 返回查询到的栏目ID
	 */
	@Override
	public List findVodprogramByID(Integer vodid) {
		return this.findByHql("FROM Vodprogram where vodpartid = " + vodid);
	}

	@Override
	public List<Vodprogram> query(String hql) {
		return this.findByHql(hql);
	}
	/**
	 * @Name: loadById
	 * @Description: 根据节目ID查询节目对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: Class<Vodprogram> class1 节目对象
	 *  			int vodprogramID 节目对象ID
	 * @Return: Vodprogram 节目对象
	 */
	@Override
	public Vodprogram loadById(Class<Vodprogram> class1, int vodprogramID) {
		return this.findById(vodprogramID);
	}

	@Override
	public void delObject(String hql) {
		this.executeHql(hql);
	}
	/**
	 * @Name: delById
	 * @Description: 删除节目信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: Class<Vodprogram> class1 要删除的对象
	 * 								  Integer id 节目ID
	 * @Return: 无
	 */
	@Override
	public void delById(Class<Vodprogram> class1, Integer id) {
		super.deleteById(id);
	}

	@Override
	public int executeSql(String sql, Object object) {
		return super.executeSql(sql);
	}
	/**
	 * @Name: findBySql
	 * @Description: 根据SQL查询对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: String sql 查询的SQL语句
	 * 				Object object 查询用到的对象
	 * @Return: List<String> 对象String类型集合
	 */  
	@Override
	public List<String> findBySql(String sql, Object object) {
		Session session = this.getCurrentSession();
		SQLQuery query = session.createSQLQuery(sql);
		List list = query.list();
		 return list;
	}

	@Override
	public List<Vodprogram> findByIds(List<Integer> idList,
			Class<Vodprogram> class1, String string) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * @Name: findPage
	 * @Description: 分页查询Vodprogram对象
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: int pageNo 分页中的当前页
	 * 				int pageSize 分页中的页数
	 * 				Class cls 分页中用到的对象,
	 *				List<Criterion> params 分页用到的参数
	 *				Order asc 分页中的排序
	 * @Return: PageBean<Vodprogram> 对象分页后的PageBean
	 */
	@Override
	public PageBean<Vodprogram> findPage(int pageNo, int pageSize, Class cls,
			List<Criterion> params, Order asc) {
		return super.findPage(pageNo, pageSize, cls, params, asc);
	}
	private int getStartIndex(int pageNo, int pageSize) {
		if (pageNo == 0) {
			return 0;
		}
		return (pageNo - 1) * pageSize;
	}
	/**
	 * @Name: findVodProgramByAdid
	 * @Description: 根据广告外键ID在广告对象中查询为点播广告的信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-16（创建日期）
	 * @Parameters: Integer id 广告外键ID
	 * @Return: List<Vodprogram> 节目对象集合
	 */
	@Override
	public List<Vodprogram> findVodProgramByAdid(Integer id) {
		// TODO Auto-generated method stub
		return super.findByHql("FROM Vodprogram WHERE adid = " + id);
	}

}
