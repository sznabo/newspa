package com.boyue.karaoke.dao.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.ICallingDAO;
import com.boyue.karaoke.model.Calling;
@Repository
public class CallingDAOImpl extends BaseDAOImpl<Calling> implements ICallingDAO {

	/**
	 * @Name: findPage
	 * @Description: 分页查询呼叫信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-22（创建日期）
	 * @Parameters: Calling calling 分页中用到的对象
	 * 				int pageNo 分页中的当前页
	 * 				int pageSize 分页中的页数
	 * @Return: PageBean<Calling> 呼叫对象的pageBean
	 */
	@Override
	public PageBean<Calling> findPage(Calling calling, int pageNo,
			int pageSize) {
		// TODO Auto-generated method stub
		return  findPage(calling, pageNo, pageSize, Order.asc("status"), Order.desc("time"));
	}
	/**
	 * @Name: findUnReadMsgByStatus
	 * @Description: 查询呼叫信息中未读信息的个数
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-22（创建日期）
	 * @Parameters: Calling calling 分页中用到的对象
	 * @Return: Integer 呼叫信息中未读信息的个数
	 */
	@Override
	public Integer findUnReadMsgByStatus(Calling model) {
		// TODO Auto-generated method stub
		List list = findBySql("SELECT COUNT(*) FROM calling WHERE status = 1", null);
		if (list == null || list.isEmpty()) {
			return 0;
		}
		return Integer.valueOf(list.get(0).toString());
	}
	/**
	 * @Name: updateCallingStatus
	 * @Description: 改变呼叫中的状态，即把未读信息改成已读信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-22（创建日期）
	 * @Parameters: 无
	 * @Return: 无
	 */
	@Override
	public void updateCallingStatus() {
		// TODO Auto-generated method stub
		super.executeSql("UPDATE calling SET status = 2 WHERE status = 1");
	}
	@Override
	public Calling getUnread(Integer deviceId) {
		List<Calling> list = findByHql("FROM Calling WHERE status = 1 and userid="+deviceId +" order by time desc");
		return list != null && list.size() > 0?list.get(0):null;
	}
	
	
}
