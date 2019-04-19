package com.boyue.karaoke.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.GuestBook;

public interface IGuestBookDAO extends DAO<GuestBook>{

	PageBean<GuestBook> findPage(int pageNo, int pageSize,
			Class<GuestBook> class1, List<Criterion> params, Order desc);

	GuestBook findGuestBookByID(Integer id);

}
