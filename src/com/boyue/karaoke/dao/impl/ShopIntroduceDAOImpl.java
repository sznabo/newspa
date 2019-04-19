package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.IShopIntroduceDAO;
import com.boyue.karaoke.model.ShopIntroduce;
@Repository
public class ShopIntroduceDAOImpl extends BaseDAOImpl<ShopIntroduce> implements
		IShopIntroduceDAO {
	/**
	 * @Name: findPage
	 * @Description: 分页查询本店介绍信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-01（创建日期）
	 * @Parameters: Class<ShopIntroduce> cls 分页中用到的对象
	 * 				int pageNo 分页中的当前页
	 * 				int pageSize 分页中的页数
	 * 				List<Criterion> params 分页中的参数
	 * @Return: PageBean<ShopIntroduce> 返回分页后的pageBean
	 */
	@Override
	public PageBean<ShopIntroduce> findPage(Class<ShopIntroduce> cls,
			int pageNo, int pageSize, List<Criterion> params) {
		return super.findPage(pageNo, pageSize, cls, params, Order.asc("position"));
	}
	/**
	 * @Name: findIntroAdId
	 * @Description: 根据广告外键ID查询本店介绍
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-15（创建日期）
	 * @Parameters: Integer id 广告外键ID
	 * @Return: List<ShopIntroduce> 本店介绍集合
	 */
	@Override
	public List<ShopIntroduce> findIntroAdId(Integer id) {
		// TODO Auto-generated method stub
		return super.findByHql("FROM ShopIntroduce WHERE adid = " + id);
	}
	/**
	 * @Name: findAllShopIntroduceByLv
	 * @Description: 根据Lv为2查询本店介绍第二层对象
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-31（创建日期）
	 * @Parameters: ShopIntroduce si 本店介绍对象
	 * @Return: List<ShopIntroduce> 本店介绍集合
	 */
	@Override
	public List<ShopIntroduce> findAllShopIntroduceByLv(ShopIntroduce si) {
		// TODO Auto-generated method stub
		return super.findByHql("FROM ShopIntroduce WHERE lv = " + 2);
	}
	/**
	 * @Name: executeSql
	 * @Description: 根据sql语句更新对象数据
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-11-10（创建日期）
	 * @Parameters: String sql sql语句 
	 * 				Object object 传入的参数
	 * @Return: int 
	 */
	@Override
	public int executeSql(String sql, Object object) {
		// TODO Auto-generated method stub
		return super.executeSql(sql);
	}
	/**
	 * @Name: findAllShopIntroduce
	 * @Description: 查询本店介绍的所有对象，并且按位置排序
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-11-10（创建日期）
	 * @Parameters: 无
	 * @Return: List<ShopIntroduce> 本店介绍集合
	 */
	@Override
	public List<ShopIntroduce> findAllShopIntroduce() {
		// TODO Auto-generated method stub
		return super.findByExample(new ShopIntroduce(), Order.asc("position"));
	}

}
