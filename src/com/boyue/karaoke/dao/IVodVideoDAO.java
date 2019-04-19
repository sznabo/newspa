package com.boyue.karaoke.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.spa.domain.Vodvideo;



public interface IVodVideoDAO extends DAO<Vodvideo>{

	List<Vodvideo> query(String hql);

	void delObject(String hql);

	void delById(Class<Vodvideo> class1, int videoID);

	Vodvideo loadById(Class<Vodvideo> class1, int videoID);

	PageBean findPage(int pageNo, int pageSize, Class cls,
			List<Criterion> params, Order asc);

	List<Vodvideo> findByHql(String string);

	int executeSql(String string, Object object);

	List<Vodvideo> findByIds(List<Integer> idsList, Class<Vodvideo> class1,
			String string);

	Vodvideo findByProgramId(Integer vodpartid);

}
