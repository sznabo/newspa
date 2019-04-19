package com.boyue.karaoke.dao.impl;

import java.io.Serializable;
import java.util.List;

import org.hibernate.Criteria;
import org.hibernate.Session;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Projections;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.IVodVideoDAO;
import com.boyue.spa.domain.Vodvideo;

@Repository
public class VodVideoDAOImpl extends BaseDAOImpl<Vodvideo> implements IVodVideoDAO {
	/**
	 * @Name: save
	 * @Description: 保存Vodvideo对象剧集信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: Vodvideo model 节目续集对象
	 * @Return: Serializable
	 */
	@Override
	public Serializable save(Vodvideo o) {
		return super.save(o);
	}
	/**
	 * @Name: delete
	 * @Description: 删除节目续集信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: iVodvideo o 节目续集对象
	 * @Return: 无
	 */
	@Override
	public void delete(Vodvideo o) {
		super.delete(o);
	}

	@Override
	public void deleteById(Serializable id) {
		super.deleteById(id);
	}

	@Override
	public void update(Vodvideo o) {
		super.update(o);
	}
	/**
	 * @Name: saveOrUpdate
	 * @Description: 保存或更新Vodvideo对象剧集信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: Vodvideo o Vodvideo对象剧集
	 * @Return: 无
	 */
	@Override
	public void saveOrUpdate(Vodvideo o) {
		super.saveOrUpdate(o);
	}
	@Override
	public void deleteByIdList(List idList) {
		super.deleteByIdList(idList);
	}

	@Override
	public List<Vodvideo> findByIdList(List idList) {
		return super.findByIdList(idList);
	}

	@Override
	public PageBean<Vodvideo> findPage(Vodvideo t, int pageNo, int pageSize) {
		return super.findPage(t, pageNo, pageSize);
	}

	@Override
	public List<Vodvideo> findByExample(Vodvideo t) {
		return super.findByExample(t);
	}

	@Override
	public List<Vodvideo> query(String hql) {
		return super.findByHql(hql);
	}

	@Override
	public void delObject(String hql) {
		
	}
	/**
	 * @Name: delVodvideoByID
	 * @Description: 根据ID删除节目续集信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: Class<Vodvideo> class1 删除的对象
	 * 								int videoID 节目续集ID
	 * @Return: 无
	 */
	@Override
	public void delById(Class<Vodvideo> class1, int videoID) {
		super.deleteById(videoID);
	}
	/**
	 * @Name: loadById
	 * @Description: 根据Vodvideo对象剧集ID查询对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: Class<Vodvideo> class1 要查询的对象
	 * 				int videoID 节目续集 对象ID
	 * @Return: Vodvideo 节目续集 对象
	 */
	@Override
	public Vodvideo loadById(Class<Vodvideo> class1, int videoID) {
		return super.findById(videoID);
	}
	/**
	 * @Name: findPage
	 * @Description: 分页查询节目续集信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: int pageNo 分页中的当前页
	 * 				int pageSize 分页中的页数
	 * 				Class cls 分页中用到的对象
					List<Criterion> params 分页中的参数
					Order asc 分页中的排序
	 * @Return: PageBean<Vodvideo> 分页后节目续集对象集合
	 */
	@Override
	public PageBean<Vodvideo> findPage(int pageNo, int pageSize, Class cls,
			List<Criterion> params, Order asc) {
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
		if (asc != null) {
			criteria.addOrder(asc);
		}
		List data = criteria.list();
		
		criteriaCount.setProjection(Projections.projectionList().add(Projections.rowCount()));   
                //获得满足条件的总记录数   
        int total = Integer.valueOf(criteriaCount.uniqueResult().toString());   
		return new PageBean(pageNo,total,pageSize,data);
	}
	private int getStartIndex(int pageNo, int pageSize) {
		if (pageNo == 0) {
			return 0;
		}
		return (pageNo - 1) * pageSize;
	}
	/**
	 * @Name: findByHql
	 * @Description: 根据HQL查询节目续集信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: String hql 要的查询HQL
	 * @Return: List<Vodvideo> 节目续集对象集合
	 */
	@Override
	public List<Vodvideo> findByHql(String hql) {
		return super.findByHql(hql);
	}

	@Override
	public int executeSql(String string, Object object) {
		return super.executeSql(string);
	}

	@Override
	public List<Vodvideo> findByIds(List<Integer> idsList,
			Class<Vodvideo> class1, String string) {
		return null;
	}
	@Override
	public Vodvideo findByProgramId(Integer id) {
		// TODO Auto-generated method stub
		List<Vodvideo> vodVideoList =  super.findByHql("FROM Vodvideo WHERE vodprogramid = " + id);
		if(vodVideoList != null && !vodVideoList.isEmpty() && vodVideoList.size() == 1){
			return vodVideoList.get(0);
		}
		return null;
	}
}
