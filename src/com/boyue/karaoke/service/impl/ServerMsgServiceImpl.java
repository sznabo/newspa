package com.boyue.karaoke.service.impl;

import java.util.ArrayList;
import java.util.Collections;
import java.util.Date;
import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.IServerMsgDAO;
import com.boyue.karaoke.dao.IServerMsgDetailDAO;
import com.boyue.karaoke.model.ServerMsg;
import com.boyue.karaoke.model.ServerMsgDetail;
import com.boyue.karaoke.service.IServerMsgService;
@Service
public class ServerMsgServiceImpl implements IServerMsgService {

	@Autowired
	private IServerMsgDAO serverMsgDAO;
	@Autowired
	private IServerMsgDetailDAO serverMsgDetailDAO;
	/**
	 * @Name: findServerMsgList
	 * @Description: 查询留言管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-15（创建日期）
	 * @Parameters: ServerMsg model 分页中用到的对象
	 *  			int pageNo 分页中的当前页
					int pageSize 分页中的页数
	 * @Return: PageBean<ServerMsg> 分页后的pageBean
	 */
	@Override
	public PageBean<ServerMsg> findServerMsgList(ServerMsg model, int pageNo,
			int pageSize) {
		// TODO Auto-generated method stub
//		List<Criterion> params = new ArrayList<Criterion>();
//		if(model.getTitle() != null && !model.getTitle().trim().equals("")){
//			params.add(Restrictions.like("title", model.getTitle().trim(), MatchMode.ANYWHERE));
//		}
		return serverMsgDAO.findPage(model, pageNo, pageSize);
	}
	/**
	 * @Name: findById
	 * @Description: 根据ID查询留言管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-18（创建日期）
	 * @Parameters: Integer id 留言管理对象ID
	 * @Return: ServerMsg 留言管理对象
	 */
	@Override
	public ServerMsg findById(Integer id) {
		// TODO Auto-generated method stub
		return serverMsgDAO.findById(id);
	}
	/**
	 * @Name: saveServerMsg
	 * @Description: 保存留言管理信息，并且根据ID或ID集合保存相关的推动设备
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-18（创建日期）
	 * @Parameters: ServerMsg model 留言管理对象
	 * 				List<Integer> idListsave 相关的推动设备ID或ID集合
	 * @Return: 无
	 */
	@Override
	public void saveServerMsg(ServerMsg model, List<Integer> idListsave) {
		// TODO Auto-generated method stub
		if(!idListsave.isEmpty()){
			model.setTime(new Date());
			model.setContente(model.getContent());
			serverMsgDAO.save(model);
			for(Integer in:idListsave){
				ServerMsgDetail smd = new ServerMsgDetail();
				smd.setMsgid(model.getId());
				smd.setUserid(in.intValue());
				serverMsgDetailDAO.save(smd);
			}
		}
	}
	/**
	 * @Name: updateServerMsg
	 * @Description: 保存更新留言管理信息，并且根据ID或ID集合保存相关的推动设备
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-18（创建日期）
	 * @Parameters: ServerMsg model 留言管理对象
	 * 				List<Integer> idListsave 相关的推动设备ID或ID集合
	 * @Return: 无
	 */
	@Override
	public void updateServerMsg(ServerMsg model, List<Integer> idListsave) {
		// TODO Auto-generated method stub
		ServerMsg sm = serverMsgDAO.findById(model.getId());
		if(model.getTitle() != null && !model.getTitle().trim().equals("")){
			sm.setTitle(model.getTitle());
		}
		if(model.getContent() != null && !model.getContent().trim().equals("")){
			sm.setContent(model.getContent());
		}
		if(model.getContente() != null && !model.getContente().trim().equals("")){
			sm.setContente(model.getContente());
		}
		if(model.getTime() != null){
			sm.setTime(model.getTime());
		}
		serverMsgDAO.update(sm);
		
		//删除以前的任务
		List<Integer> list = new ArrayList<Integer>();
		list.add(model.getId());
		serverMsgDetailDAO.delServerMsgDetailByMsgId(list);
		
		//重新建立任务
		if(idListsave != null && !idListsave.isEmpty() ){
			for(Integer in:idListsave){
				ServerMsgDetail smd = new ServerMsgDetail();
				smd.setMsgid(model.getId());
				smd.setUserid(in.intValue());
				serverMsgDetailDAO.save(smd);
			}
		}
	}
	/**
	 * @Name: delByIDs
	 * @Description: 根据ID或ID集合删除留言信息和相关的推动设备
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-18（创建日期）
	 * @Parameters: List<Integer> idList 留言信息ID或ID集合
	 * @Return: 无
	 */
	@Override
	public void delByIDs(List<Integer> idList) {
		if (idList == null || idList.isEmpty()) {
			return;
		}
		// TODO Auto-generated method stub
		//根据推动设备外键ID删除相关的推动设备
		serverMsgDetailDAO.delServerMsgDetailByMsgId(idList);
		//根据留言对象主键ID删除留言信息
		serverMsgDAO.deleteByIdList(idList);
	}
	/**
	 * @Name: findServerMsgByMsgid
	 * @Description: 根据留言明细外键ID作为留言的主键ID查询留言对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-19（创建日期）
	 * @Parameters: Integer msgid 留言对象ID
	 * @Return: ServerMsg 留言对
	 */
	@Override
	public ServerMsg findServerMsgByMsgid(Integer msgid) {
		// TODO Auto-generated method stub
		return serverMsgDAO.findServerMsgByMsgid(msgid);
	}
	/**
	 * @Name: findServerMsgList
	 * @Description: 根据留言外键ID查询留言信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-19（创建日期）
	 * @Parameters: Integer msgid 留言对象ID
	 * @Return: ServerMsg 留言信息对象
	 */
	@Override
	public List<ServerMsg> findServerMsgList(List<ServerMsgDetail> smdList) {
		// TODO Auto-generated method stub
		List<Integer> idList = new ArrayList<Integer>();
		if(smdList != null && smdList.size() > 0){
			for(ServerMsgDetail smd: smdList){
				idList.add(smd.getMsgid());
			}
		}
		if (idList.isEmpty()) {
			return Collections.EMPTY_LIST;
		}
		return serverMsgDAO.findServerMsgList(idList);
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
		serverMsgDAO.delServerMsgByNoneDetail();
	}
	/* (non-Javadoc)  
	
	 * <p>Title: findMsgCount</p>  
	
	 * <p>Description: </p>  
	
	 * @return  
	
	 * @see com.boyue.karaoke.service.IServerMsgService#findMsgCount()  
	
	 */
	 public Integer findMsgCount()
	   {
	      return this.serverMsgDAO.findMsgcount();
	   }
}
