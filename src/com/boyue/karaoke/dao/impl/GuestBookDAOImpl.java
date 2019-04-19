package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.IGuestBookDAO;
import com.boyue.karaoke.model.GuestBook;
@Repository
public class GuestBookDAOImpl extends BaseDAOImpl<GuestBook> implements
		IGuestBookDAO {

	/**
	 * @Name: findPage
	 * @Description: 分页查询留言管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-30（创建日期）
	 * @Parameters: Class<GuestBook> model 分页中用到的对象
	 * 				int pageNo 分页中的当前页
	 *				int pageSize 分页中的页数
	 *				Order order 分页中的排序
	 * @Return: PageBean<GuestBook> 分页后的pageBean
	 */
	@Override
	public PageBean<GuestBook> findPage(int pageNo, int pageSize,
			Class<GuestBook> cls, List<Criterion> params, Order order) {
		return super.findPage(pageNo, pageSize, cls, params, order);
	}
	/**
	 * @Name: findGuestBookByID
	 * @Description: 根据ID查询留言管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-30（创建日期）
	 * @Parameters: Integer id 留言管理对象ID
	 * @Return: GuestBook 留言管理对象
	 */
	@Override
	public GuestBook findGuestBookByID(Integer id) {
		return super.findById(id);
	}
}
