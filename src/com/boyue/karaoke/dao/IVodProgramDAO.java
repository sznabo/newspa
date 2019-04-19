package com.boyue.karaoke.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.spa.domain.Vodpart;
import com.boyue.spa.domain.Vodprogram;

public interface IVodProgramDAO extends DAO<Vodprogram>{


	List findVodprogramByID(Integer vodid);


	Vodprogram loadById(Class<Vodprogram> class1, int vodprogramID);


	void delById(Class<Vodprogram> class1, Integer id);

	
	List<Vodprogram> findByHql(String string);

	int executeSql(String string, Object object);

	List<Vodprogram> findAll();

	List<String> findBySql(String sql, Object object);

	
	List<Vodprogram> findByIds(List<Integer> idList, Class<Vodprogram> class1,
			String string);
	
	 PageBean<Vodprogram> findPage(int pageNo, int pageSize, Class cls,
				List<Criterion> params, Order asc);


	List<Vodprogram> query(String hql);


	void delObject(String hql);


	List<Vodprogram> findVodProgramByAdid(Integer id);

}
