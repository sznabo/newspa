package com.boyue.karaoke.service.impl;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.ICallingDAO;
import com.boyue.karaoke.model.Calling;
import com.boyue.karaoke.model.Device;
import com.boyue.karaoke.service.ICallingService;
@Service
public class CallingServiceImpl implements ICallingService {

	@Autowired
	private ICallingDAO callingDAO;
	/**
	 * @Name: findById
	 * @Description: 根据ID查询设备信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-21（创建日期）
	 * @Parameters: int id 设备ID
	 * @Return: Device 设备对象
	 */
	@Override
	public void saveCalling(Device callingDevive) {
		// TODO Auto-generated method stub
		Calling call = null;
		Calling unread = callingDAO.getUnread(callingDevive.getId());
		if(callingDevive != null && unread == null){
			call = new Calling();
			call.setUserid(callingDevive.getId());
			call.setTime(new Date());
			call.setStatus(1);
			call.setCounts(1);
			callingDAO.save(call);
		}else {
			unread.setCounts(unread.getCounts()+1);
			callingDAO.update(unread);
		}
		
	}
	/**
	 * @Name: findCallingList
	 * @Description: 查询所有呼叫信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-21（创建日期）
	 * @Parameters: 无
	 * @Return: List<Calling> 呼叫信息对象集合
	 */
	@Override
	public List<Calling> findCallingList() {
		// TODO Auto-generated method stub
		return callingDAO.findByExample(new Calling());
	}
	/**
	 * @Name: findPage
	 * @Description: 分页查询呼叫信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-21（创建日期）
	 * @Parameters: Calling calling 分页中用到的对象
	 * 				int pageNo 分页中的当前页
	 * 				int pageSize 分页中的页数
	 * @Return: List<Calling> 呼叫信息对象集合
	 */
	@Override
	public PageBean<Calling> findPage(Calling calling, int pageNo, int pageSize) {
		// TODO Auto-generated method stub
		return callingDAO.findPage(calling, pageNo, pageSize);
	}
	/**
	 * @Name: findUnReadMsgByStatus
	 * @Description: 查询呼叫信息中新增的个数
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-22（创建日期）
	 * @Parameters: Calling model 呼叫信息对象
	 * @Return: Integer 未读信息的个数
	 */
	@Override
	public Integer findUnReadMsgByStatus(Calling model) {
		// TODO Auto-generated method stub
		return callingDAO.findUnReadMsgByStatus(model);
	}
	/**
	 * @Name: updateCallingChangeStatus
	 * @Description: 改变呼叫中的状态，即把未读信息改成已读信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-22（创建日期）
	 * @Parameters: 无
	 * @Return: 无
	 */
	@Override
	public void updateCallingChangeStatus() {
		// TODO Auto-generated method stub
		callingDAO.updateCallingStatus();
	}
	/**
	 * @Name: delCallinggByTimerTask
	 * @Description: 定时删除呼叫信息（设置为1小时删除一次）
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-26（创建日期）
	 * @Parameters: 无
	 * @Return: String 无
	 */
	@Override
	public void delCallingByTimerTask() {
		// TODO Auto-generated method stub
		int readCount = 0;
		int unReadCount = 0;
		List<Calling> callList = callingDAO.findByExample(new Calling());
		Date date = new Date();
		for(Calling call : callList){
			if((date.getTime() > call.getTime().getTime() && call.getStatus() == 2)){
				callingDAO.delete(call);
				readCount++;
			}
			if(call.getStatus() == 1 && (date.getTime() - (24 * 60 * 60 * 1000)) > call.getTime().getTime()){
				callingDAO.delete(call);
				unReadCount++;
			}
		}
	//	System.out.println("已定时删除前1小时呼叫信息中已读条数：" + readCount);
	//	System.out.println("已定时删除超出24小时后呼叫信息中未读条数：" + unReadCount);
	}
}
