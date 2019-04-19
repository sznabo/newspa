package com.boyue.framework.dao;

import java.io.Serializable;
import java.lang.reflect.ParameterizedType;
import java.lang.reflect.Type;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.Criteria;
import org.hibernate.Query;
import org.hibernate.SQLQuery;
import org.hibernate.Session;
import org.hibernate.SessionFactory;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Example;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.hibernate.type.StandardBasicTypes;
import org.springframework.beans.factory.annotation.Autowired;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.util.MyNullEmptyPropertySelector;
import com.boyue.framework.util.CollectionUtils;
  
  
public abstract class BaseDAOImpl<T> implements DAO<T> {  
  
	@Autowired  
    private SessionFactory sessionFactory;  
  
	private Class entityClass;
	
	public BaseDAOImpl() {
		//获取泛型T的类型
		Type t = this.getClass().getGenericSuperclass();
        if(t!=null && t instanceof ParameterizedType) {
            Type[] args = ((ParameterizedType) t).getActualTypeArguments();
            if(args!=null && args.length>0) {
            	entityClass= (Class<T>) args[0];
            }
        }
	}

	/**
	 * id字段的名称(属性名)
	 * 默认叫id,如有不同，子类重写此方法
	 * @return
	 */
	protected String getIdName() {
		return "id";
	}
	
    public SessionFactory getSessionFactory() {  
        return sessionFactory;  
    }  
  
    public void setSessionFactory(SessionFactory sessionFactory) {  
        this.sessionFactory = sessionFactory;  
    }  
  
    protected Session getCurrentSession() {  
        return sessionFactory.getCurrentSession();  
    }  
    /**
	 * @Name: save
	 * @Description: 保存对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-11（创建日期）
	 * @Parameters: T o 泛型对象
	 * @Return: Serializable
	 */
    public Serializable save(T o) {  
        return this.getCurrentSession().save(o);  
    }  
    /**
	 * @Name: delete
	 * @Description: 根据对象删除信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: T o 对象
	 * @Return: 无
	 */
    public void delete(T o) {  
        this.getCurrentSession().delete(o);  
    }  
    /**
	 * @Name: update
	 * @Description: 更新对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: T o 对象
	 * @Return: 无
	 */
    public void update(T o) {  
        this.getCurrentSession().update(o);  
    }  
    /**
	 * @Name: saveOrUpdate
	 * @Description: 保存或更新对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: T o 对象
	 * @Return: 无
	 */
    public void saveOrUpdate(T o) {  
        this.getCurrentSession().saveOrUpdate(o);  
    }  
    
    public List<T> findAll() {
    	return findByHql("FROM " + this.entityClass.getName());
    }
    /**
	 * @Name: findByHql
	 * @Description: 根据HQL查询对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: String hql HQL语句
	 * @Return: List<T> 对象集合
	 */
    public List<T> findByHql(String hql) {  
        return this.getCurrentSession().createQuery(hql).list();  
    }  
  
    public List findBySql(String sql, Object[] param) {  
        Query q = this.getCurrentSession().createSQLQuery(sql);  
        if (param != null && param.length > 0) {  
            for (int i = 0; i < param.length; i++) {  
                q.setParameter(i, param[i]);  
            }  
        }  
        return q.list();  
    }  
    
    public List<T> findByHql(String hql, Object[] param) {  
        Query q = this.getCurrentSession().createQuery(hql);  
        if (param != null && param.length > 0) {  
            for (int i = 0; i < param.length; i++) {  
                q.setParameter(i, param[i]);  
            }  
        }  
        return q.list();  
    }  
  
    public List<T> findByHql(String hql, List<Object> param) {  
        Query q = this.getCurrentSession().createQuery(hql);  
        if (param != null && param.size() > 0) {  
            for (int i = 0; i < param.size(); i++) {  
                q.setParameter(i, param.get(i));  
            }  
        }  
        return q.list();  
    }  
  
    public List<T> findList(String hql, Object[] param, Integer page, Integer rows) {  
        if (page == null || page < 1) {  
            page = 1;  
        }  
        if (rows == null || rows < 1) {  
            rows = 10;  
        }  
        Query q = this.getCurrentSession().createQuery(hql);  
        if (param != null && param.length > 0) {  
            for (int i = 0; i < param.length; i++) {  
                q.setParameter(i, param[i]);  
            }  
        }  
        return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list(); 
    }  
  
    public List<T> findList(String hql, List<Object> param, Integer page, Integer rows) {  
        if (page == null || page < 1) {  
            page = 1;  
        }  
        if (rows == null || rows < 1) {  
            rows = 10;  
        }  
        Query q = this.getCurrentSession().createQuery(hql);  
        if (param != null && param.size() > 0) {  
            for (int i = 0; i < param.size(); i++) {  
                q.setParameter(i, param.get(i));  
            }  
        }  
        return q.setFirstResult((page - 1) * rows).setMaxResults(rows).list();  
    }  
    /**
	 * @Name: findById
	 * @Description: 根据ID查询对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: Serializable id 对象id
	 * @Return: T 对象
	 */
    @SuppressWarnings("unchecked")
	public T findById(Serializable id) {  
        return (T) this.getCurrentSession().get(this.entityClass, id);  
    }  
  
    public T get(String hql, Object[] param) {  
        List<T> l = this.findByHql(hql, param);  
        if (l != null && l.size() > 0) {  
            return l.get(0);  
        } else {  
            return null;  
        }  
    }  
  
    public T get(String hql, List<Object> param) {  
        List<T> l = this.findByHql(hql, param);  
        if (l != null && l.size() > 0) {  
            return l.get(0);  
        } else {  
            return null;  
        }  
    } 
    public T getStatu(String hql) {  
        List<T> l = this.findByHql(hql);  
        if (l != null && l.size() > 0) {  
            return l.get(0);  
        } else {  
            return null;  
        }  
    }
  
    public int count(String hql) {  
        return Integer.valueOf(this.getCurrentSession().createQuery(hql).uniqueResult().toString());  
    }  
  
    public int count(String hql, Object[] param) {  
        Query q = this.getCurrentSession().createQuery(hql);  
        if (param != null && param.length > 0) {  
            for (int i = 0; i < param.length; i++) {  
                q.setParameter(i, param[i]);  
            }  
        }  
        return Integer.valueOf(q.uniqueResult().toString());  
    }  
  
    public int count(String hql, List<Object> param) {  
        Query q = this.getCurrentSession().createQuery(hql);  
        if (param != null && param.size() > 0) {  
            for (int i = 0; i < param.size(); i++) {  
                q.setParameter(i, param.get(i));  
            }  
        }  
        return Integer.valueOf(q.uniqueResult().toString());  
    }  
  
    public int executeHql(String hql) {  
        return this.getCurrentSession().createQuery(hql).executeUpdate();  
    }  
    
    public int executeSql(String sql) {
    	return this.getCurrentSession().createSQLQuery(sql).executeUpdate();
    }
    
    public int executeSql(String sql, Object[] param) {  
        Query q = this.getCurrentSession().createSQLQuery(sql);  
        if (param != null && param.length > 0) {  
            for (int i = 0; i < param.length; i++) {  
                q.setParameter(i, param[i]);  
            }  
        }  
        return q.executeUpdate();  
    }
    
    public int executeSql(String sql, List<Object> param) {  
        return executeSql(sql, param.toArray());
    }
    
    
    public int executeHql(String hql, Object[] param) {  
        Query q = this.getCurrentSession().createQuery(hql);  
        if (param != null && param.length > 0) {  
            for (int i = 0; i < param.length; i++) {
            		q.setParameter(i, param[i]);
            }  
        }  
        return q.executeUpdate();  
    }  
  
    public int executeHql(String hql, List<Object> param) {  
    	return executeHql(hql, param.toArray());
    }
    /**
	 * @Name: deleteById
	 * @Description: 根据ID删除对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: Serializable id 对象id
	 * @Return: 无
	 */
	@Override
	public void deleteById(Serializable id) {
		T o = this.findById(id);
		if (o != null) {
			this.delete(o);
		}
	}
	/**
	 * @Name: deleteByIdList
	 * @Description: 根据ID集合删除对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-31（创建日期）
	 * @Parameters: List idList 对象id集合
	 * @Return: 无
	 */
	@Override
	public void deleteByIdList(List idList) {
		if (idList == null || idList.isEmpty()) {
			return;
		}
		List<List> splitList = CollectionUtils.splitList(idList, 500);
		for (List list : splitList) {
			this.executeHql("delete " + this.entityClass.getName() + " where "+ getIdName() + " in (" + StringUtils.join(list, ",") + ")");
		}
	}  
	
	public List<T> findByIdList(List idList) {
		if (idList == null || idList.isEmpty()) {
			return Collections.EMPTY_LIST;
		}
		List<List> splitList = CollectionUtils.splitList(idList, 500);
		List<T> all = new ArrayList<T>();
		for (List list : splitList) {
			all.addAll(this.findByHql("FROM " + this.entityClass.getName()  + " where " + getIdName() + " in (" + StringUtils.join(list, ",") + ")"));
		}
		return all;
	}
	/**
	 * @Name: findPage
	 * @Description: 分页查询对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: T t 分页中用到对象
	 * 				final int pageNo 分页中的当前页
	 * 				final int pageSize 分页中的页数
	 * @Return: PageBean<T> 返回分页后的pageBean
	 */
	public PageBean<T> findPage(T t,final int pageNo, final int pageSize) {
		return findPage(t, pageNo, pageSize, null);
	}
	
	public PageBean<T> findPageByOrder(T t,final int pageNo, final int pageSize,Order... order){
		return findPage(t, pageNo, pageSize, order);
	}
	/**
	 * @Name: findPage
	 * @Description: 分页查询对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: T t 分页中用到对象
	 * 				final int pageNo 分页中的当前页
	 * 				final int pageSize 分页中的页数
	 * 				final Order order 分页中排序
	 * @Return: PageBean<T> 返回分页后的pageBean
	 */
	public PageBean<T> findPage(T t,final int pageNo, final int pageSize, final Order... orders ) {
		Session session = this.getCurrentSession();
		Example example = null;
		if (t != null) {
			example = Example.create(t)   
			  .ignoreCase()         //忽略大小写   
			  .enableLike();		//启用模糊查询
			example.setPropertySelector(MyNullEmptyPropertySelector.INSTANCE);
		}
		Criteria c = session.createCriteria(this.entityClass);
		
		if (example != null) {
			c.add(example);
		}
		Integer total= Integer.valueOf(c.setProjection(Projections.rowCount()).uniqueResult().toString()); 
		
		c.setProjection(null); 
		c.setMaxResults(pageSize); 
		c.setFirstResult(getStartIndex(pageNo, pageSize));
		
		if (orders != null) {
			for (Order or : orders) {
				c.addOrder(or);
			}
		}
		
		List data = c.list();
		return new PageBean<T>(pageNo, total, pageSize, data);
	}
	 
	public List findList(Class cls,final Criterion[] params, final Order... order) {
		Session session = this.getCurrentSession();
		Criteria criteria = session.createCriteria(cls);
		if (params != null) {
			for (Criterion criterion : params) {
				criteria.add(criterion);
			}
		}
		//排序
		if (order != null) {
			for (Order o : order) {
				criteria.addOrder(o);
			}
		}
		List data = criteria.list();
		return data;
	}
	/**
	 * @Name: findPage
	 * @Description: 分页查询对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: final int pageNo 分页中的当前页
	 * 				final int pageSize 分页中的页数
	 * 				Class cls 分页中用到的对象,
	 *				final List<Criterion> params 分页用到的参数
	 *				final Order asc 分页中的排序
	 * @Return: PageBean<T> 对象分页后的PageBean
	 */
	public PageBean<T> findPage(final int pageNo, final int pageSize, Class cls, final List<Criterion> params, final Order... order) {
			Session session = this.getCurrentSession();
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
				for (Order o : order) {
					criteria.addOrder(o);
				}
			}
			
			criteriaCount.setProjection(Projections.projectionList().add(Projections.rowCount()));   
	                //获得满足条件的总记录数   
	        int total = Integer.valueOf(criteriaCount.uniqueResult().toString());   
	        List data = criteria.list();
			return new PageBean(pageNo,total,pageSize,data);
	}
	
	public PageBean findPageBySql(final String sql, final int pageNo,
			final int pageSize, final Class cls, final List params) {
			Session session = this.getCurrentSession();
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
			return new PageBean(pageNo, total, pageSize, data);
	}

	public List<T> findByExample(T t, Order... orders) {
		Session session = this.getCurrentSession();
		Example example = null;
		if (t != null) {
			example = Example.create(t)   
					  .ignoreCase()         //忽略大小写   
					  .enableLike();         //启用模糊查询  
			example.setPropertySelector(MyNullEmptyPropertySelector.INSTANCE);
		}
		
		Criteria c = session.createCriteria(this.entityClass);
		if (example != null) {
			c.add(example);
		}
		if (orders != null) {
			for (Order o : orders) {
				c.addOrder(o);
			}
		}
		return c.list();
	}
	/**
	 * @Name: findByExample
	 * @Description: 根据对象查询对象所有信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-21（创建日期）
	 * @Parameters: 无
	 * @Return: List<T> 对象所有信息集合
	 */
	public List<T> findByExample(T t ) {
		Session session = this.getCurrentSession();
		Example example = null;
		if (t != null) {
			example = Example.create(t)   
					  .ignoreCase()         //忽略大小写   
					  .enableLike();         //启用模糊查询  
			example.setPropertySelector(MyNullEmptyPropertySelector.INSTANCE);
		}
		
		Criteria c = session.createCriteria(this.entityClass);
		if (example != null) {
			c.add(example);
		}
		return c.list();
	}
	
	public List<T> findByExample(T t, final int pageNo, final int pageSize, Order order) {
		Session session = this.getCurrentSession();
		Example example = null;
		if (t != null) {
			example = Example.create(t)   
					  .ignoreCase()         //忽略大小写   
					  .enableLike();         //启用模糊查询  
			example.setPropertySelector(MyNullEmptyPropertySelector.INSTANCE);
		}
		Criteria c = session.createCriteria(this.entityClass);
		c.setMaxResults(pageSize); 
		c.setFirstResult(getStartIndex(pageNo, pageSize));
		if (order != null) {
			c.addOrder(order);
		}
		if (example != null) {
			c.add(example);
		}
		return c.list();
	}
	
	
	private int getCount(final String sql , final List params, final Language language) {
		Session session = this.getCurrentSession();
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
			return (Integer) query.addScalar("cnt", StandardBasicTypes.INTEGER).uniqueResult();
		}
	}
	
	private int getStartIndex(int pageNo, int pageSize) {
		if (pageNo == 0) {
			return 0;
		}
		return (pageNo - 1) * pageSize;
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
}  
