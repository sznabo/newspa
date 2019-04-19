package com.boyue.framework.BaseDao;

import java.io.Serializable;
import java.sql.Connection;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;

import com.boyue.framework.common.Page;


/** 统一数据访问接口 */
public interface BaseDAO {
	/** 加载指定ID的持久化对象 */
	public Object loadById(Class clazz,Serializable id);
	
	/** 加载满足条件的持久化对象 */
	public Object loadObject(String hql);
	
	/** 删除指定ID的持久化对象 */
	public void delById(Class clazz,Serializable id);
	
	/** jdbc删除的持久化对象 */
	public void delObject(String sql);
	
	/** 保存或更新指定的持久化对象 */
	public void saveOrUpdate(Object obj);
	
	/** 装载指定类的所有持久化对象 */
	public List listAll(String clazz);
	
	/** 分页装载指定类的所有持久化对象 */
	public List listAll(String clazz,int pageNo,int pageSize);
	
	/** 统计指定类的所有持久化对象 */
	public int countAll(String clazz);
	
	/** 查询指定类的满足条件的持久化对象 */
	public List query(String hql);
	
	/** 分页查询指定类的满足条件的持久化对象 */
	public List query(String hql,int pageNo,int pageSize);
	
	/** 统计指定类的查询结果 */
	public int countQuery(String hql);
	
	/**保存新数据*/
	public void save(Object object);
	
	/** 条件更新数据 */
	public int update(String hql);
	
	/** 从连接池中取得一个JDBC连接 */
	public Connection getConnection();
	/**查询自定义对象*/
	public List selectObject(final String sql);
	
	public void update(Object obj);
	
	/** 分页查询 */
	public Page findPage(final int pageNo, final int pageSize, final Class cls, final List<Criterion> params);
	
	public Page findPage(final int pageNo, final int pageSize, final Class cls, final List<Criterion> params, final Order order);
	
	public Page findPageBySql(final String sql, final int pageNo, final int pageSize, final Class cls, final List params);
	
	public List findBySqlWithNoPersistPO(final String sql, final List params, final Class cls);
	
	public void deleteByIdList(List<? extends Serializable> idList, Class cls);
	
	public List findByHql(String hql, List params);
	
	public List findByHql(String hql, Object ...params);
	
	public List findByHql(String hql);
	
	public int executeSql(final String sql, final List params);
	
	public List findBySql(String sql, List params);
	
	public List findByIds(List<Integer> ids, Class cls, String idName);
	
	public void deleteById(Class cls, Serializable id);
	
	public List findAll(Class cls);
	
	public List findBySql(final String sql);
	
	public Page findPageByHql(final String hql, final int pageNo, final int pageSize, final List params);
	
	public List findByExample(Object o);
}

