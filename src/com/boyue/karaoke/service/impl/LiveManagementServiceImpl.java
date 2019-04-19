package com.boyue.karaoke.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.jf.smali.smaliParser.integer_literal_return;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.ILiveManagementDAO;
import com.boyue.karaoke.model.LiveManagement;
import com.boyue.karaoke.service.ILiveManagementService;


@Service
public class LiveManagementServiceImpl implements ILiveManagementService {

	@Autowired
	private ILiveManagementDAO liveManagementDAO;
	/**
	 * @Name: findLiveManagementList
	 * @Description: 分页查询直播管理信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-28（创建日期）
	 * @Parameters: LiveManagement model 分页中用到的对象
	 * 				int pageNo 分页中的当前页
	 *				int pageSize 分页中的页数
	 * @Return: PageBean<LiveManagement> 分页后的pageBean
	 */
	@Override
	public PageBean<LiveManagement> findLiveManagementList(LiveManagement model,int pageNo,
			int pageSize) {
		List<Criterion> params = new ArrayList<Criterion>();
		if(model.getName() != null && !model.getName().trim().equals("")){
			params.add(Restrictions.like("name", model.getName().trim(),MatchMode.ANYWHERE));
		}
		PageBean<LiveManagement> liveManagement = liveManagementDAO.findPage(pageNo,pageSize,LiveManagement.class,params,Order.asc("position"));
		return liveManagement;
	}
	/**
	 * @Name: saveLiveManagement
	 * @Description: 保存直播管理信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-28（创建日期）
	 * @Parameters: LiveManagement model 保存的对象
	 * @Return: 无
	 */
	@Override
	public void saveLiveManagement(LiveManagement model) {
		if(model.getPosition() == null){
			int position = liveManagementDAO.obtainPosition();
			model.setPosition(position);
			
//			List<LiveManagement>  lmList = this.liveManagementDAO.findAllLiveManagement();
//			for(int i = 0; lmList != null && i < lmList.size(); i++){
//				lmList.get(i).setChannelcode(i);
//			}
		}else{
			liveManagementDAO.updateOtherPostion(model.getPosition());
			
//			List<LiveManagement>  lmList = this.liveManagementDAO.findAllLiveManagement();
//			for(int i = 0; lmList != null && i < lmList.size(); i++){
//				lmList.get(i).setChannelcode(i);
//			}
		}
		//处理频道号问题，每增加一个对象，频道号在最后加1
		Integer channelcodeMax = this.liveManagementDAO.findLiveChannelCodeMax();
		List<LiveManagement> liveList = this.liveManagementDAO.findAllLiveManagement();
		if(liveList != null && !liveList.isEmpty()){
			model.setChannelcode(channelcodeMax + 1);
			
//			List<LiveManagement>  lmList = this.liveManagementDAO.findAllLiveManagement();
//			for(int i = 0; lmList != null && i < lmList.size(); i++){
//				lmList.get(i).setChannelcode(i);
//			}
		}else{
			model.setChannelcode(0);
		}
		//end
		liveManagementDAO.save(model);
		List<LiveManagement>  lmList = this.liveManagementDAO.findAllLiveManagement();
		for(int i = 0; lmList != null && i < lmList.size(); i++){
			lmList.get(i).setChannelcode(i);
		}
	}
	/**
	 * @Name: findLiveManagement
	 * @Description: 根据ID查询直播管理信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-29（创建日期）
	 * @Parameters: Integer id 直播管理对象ID
	 * @Return: LiveManagement 直播管理对象
	 */
	@Override
	public LiveManagement findLiveManagement(Integer id) {
		// TODO Auto-generated method stub
		return liveManagementDAO.findById(id);
	}
	/**
	 * @Name: updateLiveManagement
	 * @Description: 保存更新直播管理信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-29（创建日期）
	 * @Parameters: LiveManagement model 直播管理对象
	 * @Return: 无
	 */
	@Override
	public void updateLiveManagement(LiveManagement model) { 
		Object o = liveManagementDAO.findById(model.getId());
		LiveManagement obj = (LiveManagement)o;
		if (model.getPosition() != null) {//null表示不变
			if (model.getPosition().intValue() == 0) {//0 是变成最后一个
				int position = liveManagementDAO.obtainPosition();
				obj.setPosition(position);
				//
				List<LiveManagement>  lmList = this.liveManagementDAO.findAllLiveManagement();
				for(int i = 0; lmList != null && i < lmList.size(); i++){
					lmList.get(i).setChannelcode(i);
				}
				//
			} else {//指定位置
				obj.setPosition(model.getPosition());
				liveManagementDAO.updateOtherPostion(model.getPosition());
				//
				List<LiveManagement>  lmList = this.liveManagementDAO.findAllLiveManagement();
				for(int i = 0; lmList != null && i < lmList.size(); i++){
					lmList.get(i).setChannelcode(i);
				}
				//
			}
		}
		if(model.getName() != null && !model.getName().trim().equals("")){
			obj.setName(model.getName());
		}
		if(model.getFreq() != null && !model.getFreq().trim().equals("")){
			obj.setFreq(model.getFreq());
		}
		if(model.getZhishi() != null && !model.getZhishi().equals("")){
			obj.setZhishi(model.getZhishi());
		}
		if(model.getRadiozhishi() != null && !model.getRadiozhishi().equals("")){
			obj.setRadiozhishi(model.getRadiozhishi());
		}
//		obj.setChannelcode(model.getChannelcode());
		liveManagementDAO.update(obj);
	}
	/**
	 * @Name: deleteLiveManagement
	 * @Description: 根据ID或集合删除直播管理信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-29（创建日期）
	 * @Parameters: List<Integer> idList 直播管理对象ID集合
	 * @Return: 无
	 */
	@Override
	public void deleteLiveManagement(List<Integer> idList) {
		if(idList == null || idList.isEmpty()){
			return ;
		}
		if(idList != null && !idList.isEmpty()){
			List<LiveManagement> lmList = this.liveManagementDAO.findByIdList(idList);
			if(lmList.size() == 1){
				for(Integer id: idList){
					liveManagementDAO.deleteById(id);
				}
				this.liveManagementDAO.updateOtherChannelCode(lmList.get(0));
			}else{
				for(Integer id: idList){
					liveManagementDAO.deleteById(id);
				}
				List<LiveManagement> lmlmList = this.liveManagementDAO.findAllLiveManagement2();
				if(lmlmList != null && !lmlmList.isEmpty()){
					for(int i = 0; i < lmlmList.size(); i++){
						this.liveManagementDAO.updateLive(i,lmlmList.get(i).getChannelcode());
					}
				}
			}
		}
	}
	/**
	 * @Name: findLiveManagementList
	 * @Description: 查询直播管理信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-29（创建日期）
	 * @Parameters: 无
	 * @Return: List<LiveManagement> 直播管理对象集合
	 */
	@Override
	public List<LiveManagement> findLiveManagementList(LiveManagement model) {
		return liveManagementDAO.findLiveManagementList(model.getId());
	}
	/**
	 * @Name: findAllLiveManagement
	 * @Description: 查询所有直播管理信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-11（创建日期）
	 * @Parameters: 无
	 * @Return: List<LiveManagement> 直播管理对象集合
	 */
	@Override
	public List<LiveManagement> findAllLiveManagement() {
		// TODO Auto-generated method stub
		return liveManagementDAO.findAllLiveManagement2();
	}
}
