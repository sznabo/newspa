package com.boyue.karaoke.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.ShopIntroduce;

public interface IShopIntroduceDAO extends DAO<ShopIntroduce> {

	PageBean<ShopIntroduce> findPage(Class<ShopIntroduce> class1, int pageNo,
			int pageSize, List<Criterion> params);

	List<ShopIntroduce> findIntroAdId(Integer id);

	List<ShopIntroduce> findAllShopIntroduceByLv(ShopIntroduce si);

	int executeSql(String string, Object object);

	List findByHql(String string);

	List<ShopIntroduce> findAllShopIntroduce();

}
