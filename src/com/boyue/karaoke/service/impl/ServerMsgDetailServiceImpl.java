package com.boyue.karaoke.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.karaoke.dao.IServerMsgDetailDAO;
import com.boyue.karaoke.model.ServerMsgDetail;
import com.boyue.karaoke.service.IServerMsgDetailService;
@Service
public class ServerMsgDetailServiceImpl implements IServerMsgDetailService {

	@Autowired
	private IServerMsgDetailDAO serverMsgDetailDAO;
	/**
	 * @Name: findByMsgId
	 * @Description: 根据留言管理ID查询留言信息明细对象集合
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-18（创建日期）
	 * @Parameters: Integer id 留言信息对象ID
	 * @Return: List<ServerMsgDetail> 留言信息明细对象集合
	 */
	@Override
	public List<ServerMsgDetail> findByMsgId(Integer id) {
		// TODO Auto-generated method stub
		return serverMsgDetailDAO.findByMsgId(id);
	}
	/**
	 * @Name: findServerMsgDetailByUserid
	 * @Description: 利用设备主键ID做为留言明细的外键ID查询留言明细信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-19（创建日期）
	 * @Parameters: Integer id 设备对象ID，作为留言明细外键ID
	 * @Return: List<ServerMsgDetail> 留言信息明细对象集合
	 */
	@Override
	public List<ServerMsgDetail> findServerMsgDetailByUserid(Integer id) {
		// TODO Auto-generated method stub
		return serverMsgDetailDAO.findServerMsgDetailByUserid(id);
	}
	/**
	 * @Name: delServerMsgDetailList
	 * @Description: 根据设备外键ID集合删除明细
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-20（创建日期）
	 * @Parameters: List<ServerMsgDetail> smdList 设备外键ID集合 
	 * @Return: 无
	 */
	@Override
	public void delServerMsgDetailList(List<ServerMsgDetail> smdList) {
		// TODO Auto-generated method stub
		List<Integer> idList = new ArrayList<Integer>();
		if(smdList != null && smdList.size() > 0){
			for(ServerMsgDetail smd:smdList){
				idList.add(smd.getUserid());
			}
			serverMsgDetailDAO.deleteByUserIdList(idList);
		}
	}
}
