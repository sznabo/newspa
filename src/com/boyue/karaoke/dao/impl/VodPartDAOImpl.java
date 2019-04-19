package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.IVodPartDAO;
import com.boyue.spa.domain.Vodpart;

@Repository
public class VodPartDAOImpl extends BaseDAOImpl<Vodpart> implements IVodPartDAO {
	/**
	 * @Name: findPage
	 * @Description: 分页查询栏目信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: Vodpart t 分页中用到对象 int pageNo 分页中的当前页 int pageSize 分页中的页数
	 * @Return: PageBean<Vodpart> 返回分页后的pageBean
	 */
	@Override
	public PageBean<Vodpart> findPage(Vodpart t, int pageNo, int pageSize) {
		Vodpart t2 = new Vodpart();
		BeanUtils.copyProperties(t, t2);
		if (t.getVodpartname() != null && !t.getVodpartname().trim().equals("")) {
			t2.setVodpartname("%" + t2.getVodpartname().trim() + "%");
		}
		return super.findPage(t2, pageNo, pageSize);
	}

	@Override
	public List<Vodpart> findIsName(Vodpart v) {
		// TODO Auto-generated method stub
		return super.findByHql("FROM Vodpart WHERE vodpartname = " + v.getVodpartname());
	}

}
