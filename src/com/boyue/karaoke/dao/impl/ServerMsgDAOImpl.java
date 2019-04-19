package com.boyue.karaoke.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.IServerMsgDAO;
import com.boyue.karaoke.model.ServerMsg;
import com.boyue.karaoke.model.ServerMsgDetail;
@Repository
public class ServerMsgDAOImpl extends BaseDAOImpl<ServerMsg> implements IServerMsgDAO {
	
	/**
	 * @Name: findPage
	 * @Description: 分页查询留言信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-19（创建日期）
	 * @Parameters: ServerMsg t 分页中用到的对象
	 * 				int pageNo 分页中的当前页
	 * 				int pageSize 分页中的页数
	 * @Return: PageBean<ServerMsg> 留言对象分页后的pageBean
	 */
	@Override
	public PageBean<ServerMsg> findPage(ServerMsg t, int pageNo, int pageSize) {
		List<Criterion> params = new ArrayList<Criterion>();
		if(t.getTitle() != null && !t.getTitle().trim().equals("")){
			params.add(Restrictions.like("title", t.getTitle().trim(), MatchMode.ANYWHERE));
		}
		return this.findPage(pageNo, pageSize, ServerMsg.class, params, Order.desc("time"));
	}
	/**
	 * @Name: findServerMsgByMsgid
	 * @Description: 根据留言明细外键ID作为留言的主键ID查询留言对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-19（创建日期）
	 * @Parameters: Integer msgid 留言对象ID
	 * @Return: ServerMsg 留言对象
	 */
	@Override
	public ServerMsg findServerMsgByMsgid(Integer msgid) {
		// TODO Auto-generated method stub
		return super.findById(msgid);
	}
	/**
	 * @Name: findServerMsgList
	 * @Description: 根据ID集合查询留言信息对象集合
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-19（创建日期）
	 * @Parameters: Integer msgid 留言对象ID
	 * @Return: ServerMsg 留言对象
	 */
	@Override
	public List<ServerMsg> findServerMsgList(List<Integer> idList) {
		return this.findByHql("FROM ServerMsg WHERE id IN (" + StringUtils.join(idList, ",") + ") ORDER BY time DESC");
	}
	/**
	 * @Name: delServerMsgByNoneDetail
	 * @Description: 根据留言留言明细为空时删除留言信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-20（创建日期）
	 * @Parameters: 无
	 * @Return: 无
	 */
	@Override
	public void delServerMsgByNoneDetail() {
		this.executeSql("DELETE FROM server_msg  WHERE  NOT EXISTS (SELECT * FROM server_msg_detail smd WHERE msgid = server_msg.id)");
	}
	/* (non-Javadoc)  
	
	 * <p>Title: findMsgcount</p>  
	
	 * <p>Description: </p>  
	
	 * @return  
	
	 * @see com.boyue.karaoke.dao.IServerMsgDAO#findMsgcount()  
	
	 */
	@Override
	public Integer findMsgcount() {
		
		return Integer.valueOf(getSessionFactory().getCurrentSession().createSQLQuery("select count(*) from server_msg").list().get(0).toString());
	}
}
