package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.IServerMsgDetailDAO;
import com.boyue.karaoke.model.ServerMsgDetail;
@Repository
public class ServerMsgDetailDAOImpl extends BaseDAOImpl<ServerMsgDetail>
		implements IServerMsgDetailDAO {
	/**
	 * @Name: delServerMsgDetailByMsgId
	 * @Description: 根据ID或ID集合删除相关的推动设备
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-18（创建日期）
	 * @Parameters: List<Integer> idListsave 相关的推动设备ID或ID集合
	 * @Return: 无
	 */
	@Override
	public void delServerMsgDetailByMsgId(List<Integer> list) {
		// TODO Auto-generated method stub
		this.executeSql("DELETE FROM server_msg_detail WHERE msgid in (" + StringUtils.join(list, ",") + ")");
	}
	/**
	 * @Name: findByMsgId
	 * @Description: 根据留言信息明细外键ID查询留言信息明细信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-18（创建日期）
	 * @Parameters: Integer id 留言信息明细外键ID
	 * @Return: List<ServerMsgDetail> 留言信息明细集合
	 */
	@Override
	public List<ServerMsgDetail> findByMsgId(Integer id) {
		// TODO Auto-generated method stub
		return this.findByHql("FROM ServerMsgDetail WHERE msgid=" + id);
	}
	/**
	 * @Name: findServerMsgDetailByUserid
	 * @Description: 利用设备主键ID做为留言明细的外键ID查询留言明细信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-19（创建日期）
	 * @Parameters: Integer id 留言信息明细外键ID
	 * @Return: List<ServerMsgDetail> 留言信息明细集合
	 */
	@Override
	public List<ServerMsgDetail> findServerMsgDetailByUserid(Integer id) {
		// TODO Auto-generated method stub
		return this.findByHql("FROM ServerMsgDetail WHERE userid=" + id);
	}
	/**
	 * @Name: deleteByUserIdList
	 * @Description: 根据设备外键ID集合删除留言明细
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-20（创建日期）
	 * @Parameters: Integer id 留言信息明细外键ID
	 * @Return: List<ServerMsgDetail> 留言信息明细集合
	 */
	@Override
	public void deleteByUserIdList(List<Integer> idList) {
		// TODO Auto-generated method stub
		if(idList != null && !idList.isEmpty()){
			this.executeSql("DELETE FROM server_msg_detail WHERE userid IN (" + StringUtils.join(idList, ",") + ")");
		}
	}
}
