package com.boyue.karaoke.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.hibernate.sql.DecodeCaseFragment;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.IGuestBookDAO;
import com.boyue.karaoke.model.GuestBook;
import com.boyue.karaoke.model.LiveManagement;
import com.boyue.karaoke.service.IGuestBookService;
@Service
public class GuestBookServiceImpl implements IGuestBookService {

	@Autowired
	private IGuestBookDAO guestBookDAO;
	
	/**
	 * @Name: findGuestBookList
	 * @Description: 查询留言管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-30（创建日期）
	 * @Parameters: GuestBook model 留言管理对象
	 * @Return: PageBean
	 */
	@Override
	public PageBean findLiveManagementList(GuestBook model, int pageNo,
			int pageSize,Date startTime,Date endTime) {
		List<Criterion> params = new ArrayList<Criterion>();
		if(model != null && !model.equals("")){
			if(model.getUser_name() != null && !model.getUser_name().trim().equals("")){
				params.add(Restrictions.like("user_name", model.getUser_name().trim(), MatchMode.ANYWHERE));
			}
			if(model.getTel() != null && !model.getTel().trim().equals("")){
				params.add(Restrictions.like("tel", model.getTel().trim(), MatchMode.ANYWHERE));
			}
			if((model.getMsg() != null && !model.getMsg().trim().equals(""))){
				params.add(Restrictions.like("msg", model.getMsg().trim(), MatchMode.ANYWHERE));
			}
			if(startTime != null && endTime != null){
				params.add(Restrictions.ge("create_time", startTime));
				params.add(Restrictions.le("create_time", endTime));
			}else if(startTime != null){
				params.add(Restrictions.ge("create_time", startTime));
			}else if(endTime != null){
				params.add(Restrictions.le("create_time", endTime));
			}
		}
		PageBean<GuestBook> guestBook = guestBookDAO.findPage(pageNo,pageSize,GuestBook.class,params,Order.desc("create_time"));
		return guestBook;
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
		// TODO Auto-generated method stub
		return guestBookDAO.findGuestBookByID(id);
	}
	/**
	 * @Name: deleteGuestBookByID
	 * @Description: 根据ID或ID集合删除留言管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-31（创建日期）
	 * @Parameters: List<Integer> idList 留言管理对象ID(集合)
	 * @Return: 无
	 */
	@Override
	public void deleteGuestBookByID(List<Integer> idList) {
		guestBookDAO.deleteByIdList(idList);
	}
	/**
	 * @Name: saveGuestBook
	 * @Description:保存留言管理的所有信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-14（创建日期）
	 * @Parameters: GuestBook guestBook 留言管理对象
	 * @Return: 无
	 */
	@Override
	public void saveGuestBook(GuestBook guestBook) {
		// TODO Auto-generated method stub
		GuestBook gb = new GuestBook();
		gb.setCreate_time(new Date());
		gb.setMsg(guestBook.getMsg());
		gb.setTel(guestBook.getTel());
		gb.setUser_name(guestBook.getUser_name());
		guestBookDAO.save(gb);
	}
}
