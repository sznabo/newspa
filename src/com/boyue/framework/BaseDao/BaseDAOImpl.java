package com.boyue.framework.BaseDao;


import java.io.Serializable;
import java.sql.Connection;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Hibernate;
import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.Transaction;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.transform.Transformers;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.SessionFactoryUtils;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.boyue.framework.common.Page;

/** 统一数据访问接口实现 */

public class BaseDAOImpl extends HibernateDaoSupport implements BaseDAO {

	/** 统计指定类的所有持久化对象 */
	public int countAll(String clazz) {
		final String hql = "select count(*) from " + clazz + " as a";
		Long count = (Long) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException {
						Query query = session.createQuery(hql);
						query.setMaxResults(1);
						return query.uniqueResult();
					}
				});
		return count.intValue();
	}

	/** 统计指定类的查询结果 */
	public int countQuery(String hql) {
		final String counthql = hql;
		Long count = (Long) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException {
						Query query = session.createQuery(counthql);
						query.setMaxResults(1);
						return query.uniqueResult();
					}
				});
		return count.intValue();
	}

	/** 删除指定ID的持久化对象 */
	public void delById(Class clazz, Serializable id) {
		getHibernateTemplate().delete(getHibernateTemplate().load(clazz, id));
	}

	/** 装载指定类的所有持久化对象 */
	public List listAll(String clazz) {
		return getHibernateTemplate().find(
				"from " + clazz + " as a order by a.id desc");
	}

	/** 分页装载指定类的所有持久化对象 */
	public List listAll(String clazz, int pageNo, int pageSize) {
		final int pNo = pageNo;
		final int pSize = pageSize;
		final String hql = "from " + clazz + " as a order by a.id desc";
		List list = getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Query query = session.createQuery(hql);
				query.setMaxResults(pSize);
				query.setFirstResult((pNo - 1) * pSize);
				List result = query.list();
				if (!Hibernate.isInitialized(result))
					Hibernate.initialize(result);
				return result;
			}
		});
		return list;
	}

	/** 加载指定ID的持久化对象 */
	public Object loadById(Class clazz, Serializable id) {
		return getHibernateTemplate().get(clazz, id);
	}

	/** 加载满足条件的持久化对象 */
	public Object loadObject(String hql) {
		final String hql1 = hql;
		System.out.println(hql1);
		Object obj = null;
		List list = getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Query query = session.createQuery(hql1);
				return query.list();
			}
		});
		if (list.size() > 0)
			obj = list.get(0);

		return obj;
	}

	/** 查询指定类的满足条件的持久化对象 */
	public List query(String hql) {
		final String hql1 = hql;
		return getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Query query = session.createQuery(hql1);
				return query.list();
			}
		});
	}

	/** 分页查询指定类的满足条件的持久化对象 */
	public List query(String hql, int pageNo, int pageSize) {
		final int pNo = pageNo;
		final int pSize = pageSize;
		final String hql1 = hql;
		return getHibernateTemplate().executeFind(new HibernateCallback() {
			public Object doInHibernate(Session session)
					throws HibernateException {
				Query query = session.createQuery(hql1);
				query.setMaxResults(pSize);
				query.setFirstResult((pNo - 1) * pSize);
				List result = query.list();
				if (!Hibernate.isInitialized(result))
					Hibernate.initialize(result);
				return result;
			}
		});
	}

	/** 保存或更新指定的持久化对象 */
	public void saveOrUpdate(Object obj) {
		getHibernateTemplate().saveOrUpdate(obj);
	}

	/** 保存新数据 */
	public void save(Object object) {
		getHibernateTemplate().save(object);
	}

	/** 条件更新数据 */
	public int update(String hql) {
		final String hql1 = hql;
		return ((Integer) getHibernateTemplate().execute(
				new HibernateCallback() {
					public Object doInHibernate(Session session)
							throws HibernateException {
						Query query = session.createQuery(hql1);
						return query.executeUpdate();
					}
				})).intValue();
	}

	/** 从连接池中取得一个JDBC连接 */
	@SuppressWarnings("deprecation")
	public Connection getConnection() {
		return getHibernateTemplate().getSessionFactory().getCurrentSession()
				.disconnect();
	}

	/** jdbc删除的持久化对象 */
	public void delObject(String sql) {
		Transaction ts = this.getSessionFactory().openSession()
				.getTransaction();
		try {
			ts.begin();
			this.getConnection().createStatement().executeUpdate(sql);
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

	/**
	 * 查询自定义对象
	 */
	public List selectObject(String sql) {
		java.sql.Connection c = null;
		java.sql.PreparedStatement ps = null;
		java.sql.ResultSet rs = null;
		List ret = new ArrayList();
		try {
			c = SessionFactoryUtils.getDataSource(getSessionFactory()).getConnection();
			ps = c.prepareStatement(sql);
			rs = ps.executeQuery();
		} catch (Exception e) {
			e.printStackTrace();
		}
		return ret;
	}
	
	public Page findPage(final int pageNo, final int pageSize, final Class cls, final List<Criterion> params) {
		return findPage(pageNo, pageSize, cls, params, null);
	}
	
	public Page findPage(final int pageNo, final int pageSize, final Class cls, final List<Criterion> params, final Order order) {
		return (Page) this.getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				
				Criteria criteria = session.createCriteria(cls);
				Criteria criteriaCount = session.createCriteria(cls);
				if (params != null) {
					for (Criterion criterion : params) {
						criteria.add(criterion);
						criteriaCount.add(criterion);
					}
				}
				criteria.setFirstResult(getStartIndex(pageNo, pageSize));
				criteria.setMaxResults(pageSize);
				
				//排序
				if (order != null) {
					criteria.addOrder(order);
				}
				List data = criteria.list();
				
				criteriaCount.setProjection(Projections.projectionList().add(Projections.rowCount()));   
		                //获得满足条件的总记录数   
		        int total = Integer.valueOf(criteriaCount.uniqueResult().toString());   
				return new Page(pageNo, pageSize, data, total);
			}
		});
	}
	
	
	public Page findPageBySql(final String sql, final int pageNo,
			final int pageSize, final Class cls, final List params) {
		return (Page) this.getHibernateTemplate().execute(
				new HibernateCallback() {

					@Override
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						SQLQuery query = session.createSQLQuery(sql);
						if (cls != null) {
							query.addEntity(cls);
						}
						if (params != null) {
							for (int i = 0; i < params.size(); i++) {
								query.setParameter(i, params.get(i));
							}
						}
						query.setFirstResult(getStartIndex(pageNo, pageSize));
						query.setMaxResults(pageSize);
						List data = query.list();
						
						int total = getCount(sql, params,Language.SQL);
						return new Page(pageNo, pageSize, data, total);
					}
				});
	}
	
	public List findBySqlWithNoPersistPO(final String sql, final List params, final Class cls) {
		return this.getHibernateTemplate().executeFind(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = session.createSQLQuery(sql).setResultTransformer(Transformers.aliasToBean(cls));
				if (params != null) {
					for (int i = 0; i < params.size(); i++) {
						query.setParameter(i, params.get(0));
					}
				}
				return query.list();
			}
		});
	}
	
	private int getCount(final String sql , final List params, final Language language) {
		return (Integer) this.getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				if (language.equals(Language.HQL)) {
					int from = sql.toLowerCase().indexOf("from");
					int order = sql.toLowerCase().indexOf("order");
					String countSql = "select count(*) " +  sql.substring(from, order);
					Query query = session.createQuery(countSql);
					if (params != null) {
						for (int i = 0; i < params.size(); i++) {
							query.setParameter(i, params.get(i));
						}
					}
					return Integer.valueOf(query.uniqueResult().toString());
				} else {
					String countSql = "select count(*) cnt from (" +  sql + ") tt";
					SQLQuery query = session.createSQLQuery(countSql);
					if (params != null) {
						for (int i = 0; i < params.size(); i++) {
							query.setParameter(i, params.get(i));
						}
					}
					return query.addScalar("cnt").uniqueResult();
				}
				
			}
		});
	}
	
	
	private int getStartIndex(int pageNo, int pageSize) {
		if (pageNo == 0) {
			return 0;
		}
		return (pageNo - 1) * pageSize;
	}

	@Override
	public void deleteByIdList(List<? extends Serializable> idList, Class cls) {
		if (idList != null) {
			for (Serializable id : idList) {
				Object o = this.getHibernateTemplate().get(cls, id);
				this.getHibernateTemplate().delete(o);
			}
		}
	}

	@Override
	public List findByHql(final String hql, final List params) {
		List newList = new ArrayList();
		List list  = (List) this.getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				Query query = session.createQuery(hql);
				if (params != null) {
					for (int i = 0; i < params.size(); i++) {
						query.setParameter(i, params.get(i));
					}
				}
				return query.list();
			}
		});
		if (list != null) {
			
			for (Object o : list) {
				if (o != null) {
					newList.add(o);
				}
			}
			return newList;
		}
		return new ArrayList(0);
	}
	
	public int executeSql(final String sql, final List params) {
		return (Integer) this.getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				SQLQuery query = session.createSQLQuery(sql);
				if (params != null) {
					for (int i = 0; i < params.size(); i++) {
						query.setParameter(i, params.get(i));
					}
				}
				return query.executeUpdate();
			}
		});
	}

	public List findByHql(final String hql, final Object ...params) {
		if (params == null || params.length == 0) {
			return findByHql(hql);
		}
		return findByHql(hql, Arrays.asList(params));
	}
	
	public List findByHql(String hql) {
		return findByHql(hql, Collections.EMPTY_LIST);
	}

	@Override
	public List findBySql(final String sql,final List params) {
		return (List) this.getHibernateTemplate().execute(new HibernateCallback() {
			
			@Override
			public Object doInHibernate(Session session) throws HibernateException,
					SQLException {
				SQLQuery query = session.createSQLQuery(sql);
				if (params != null) {
					for (int i = 0; i < params.size(); i++) {
						query.setParameter(i, params.get(i));
					}
				}
				return query.list();
			}
		});
	}
	
	@Override
	public List findBySql(final String sql) {
		return findBySql(sql, null);
	}

	@Override
	public List findByIds(List<Integer> ids, Class cls, String idName) {
		if (ids == null || ids.isEmpty()) {
			return new ArrayList();
		}
//		List<List<Integer>> splitList = CollectionUtil.splitList(ids, 1000);
		List all = new ArrayList();
//		for (List<Integer> list : splitList) {
//			List<Vodprogram> subList = findByHql("FROM " + cls.getName() + " where " + idName + " in(" + StringUtils.join(ids.iterator(), ",") + ")");
//			all.addAll(subList);
//		}
		return all;
	}

	@Override
	public void deleteById(Class cls, Serializable id) {
		Object o = this.getHibernateTemplate().get(cls, id);
		if (o != null) {
			this.getHibernateTemplate().delete(o);
		}
		
	}
	
	public List findAll(Class cls) {
		return this.getHibernateTemplate().find("FROM " + cls.getName());
	}

	@Override
	public Page findPageByHql(final String hql, final int pageNo, final int pageSize, final List params) {
		return (Page) this.getHibernateTemplate().execute(
				new HibernateCallback() {

					@Override
					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						if (params != null) {
							for (int i = 0; i < params.size(); i++) {
								query.setParameter(i, params.get(0));
							}
						}
						query.setFirstResult(getStartIndex(pageNo, pageSize));
						query.setMaxResults(pageSize);
						List data = query.list();
						
						int total =  getCount(hql, params, Language.HQL);
						return new Page(pageNo, pageSize, data, total);
					}
				});
	}
	
	enum Language {
		SQL("SQL", 1), HQL("HQL",2);
		
		private String name;
		private int val;
		private Language(String name, int val) {
			this.name = name;
			this.val = val;
		}
	}

	/* (non-Javadoc)
	 * @see com.boyue.BaseDao.BaseDAO#update(java.lang.Object)
	 */
	@Override
	public void update(Object obj) {
		getHibernateTemplate().update(obj);
	}

	@Override
	public List findByExample(Object o) {
		return getHibernateTemplate().findByExample(o);
	}
}

