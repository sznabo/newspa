package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.jf.smali.smaliParser.super_spec_return;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.ILiveManagementDAO;
import com.boyue.karaoke.model.LiveManagement;
@Repository
public class LiveManagementDAOImpl extends BaseDAOImpl<LiveManagement> implements ILiveManagementDAO {

	/**
	 * @Name: findPage
	 * @Description: 分页查询直播管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-28（创建日期）
	 * @Parameters: Class model 分页中用到的对象
	 * 				int pageNo 分页中的当前页
	 *				int pageSize 分页中的页数
	 *				List<Criterion> params 分页中用到的参数
	 *				Order order 分页中的排序
	 * @Return: PageBean<LiveManagement> 分页后的pageBean
	 */
	@Override
	public PageBean<LiveManagement> findPage(int pageNo, int pageSize,Class model, List<Criterion> params, Order order) {
		return super.findPage(pageNo, pageSize, LiveManagement.class, params, Order.asc("position"));
	}
	/**
	 * @Name: obtainPosition
	 * @Description: 查询直播管理中位置最大的信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-29（创建日期）
	 * @Parameters: 无
	 * @Return: int 返回最大位置加1，即表示放入最后位置
	 */
	@Override
	public int obtainPosition() {
		List list = super.findByHql("SELECT MAX(position) FROM LiveManagement ORDER BY position ASC");
		if(list == null || list.isEmpty() ||list.get(0) == null){//如果为空即没有记录从1开始
			return 1;
		}else{//如果不为空，即有记录，则最大位置加1，即放入到最后一个位置
			return Integer.parseInt(list.get(0).toString()) + 1;
		}
	}
	/**
	 * @Name: updateOtherPostion
	 * @Description: 更新直播管理中置于其它位置之前时，需要修改大于等于它位置的信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-29（创建日期）
	 * @Parameters: Integer position 直播管理中的位置
	 * @Return: 无
	 */
	@Override
	public void updateOtherPostion(Integer position) {
		super.executeSql("UPDATE live SET position = position + 1 WHERE position >= " + position);
	}
	/**
	 * @Name: findLiveManagementList
	 * @Description: 查询直播管理集合信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-29（创建日期）
	 * @Parameters: 无
	 * @Return: List<LiveManagement> 直播管理对象集合
	 */
	@Override
	public List<LiveManagement> findLiveManagementList(Integer id) {
		List<LiveManagement> list = null;
		if(id != null && !id.equals("")){//如果不为空，则查询后进入修改页面
			list = super.findByHql("FROM LiveManagement WHERE id IS NOT ( " + id + ") ORDER BY position");
		}else{//如果为空，则查询后进入增加页面
			list = super.findByHql("FROM LiveManagement ORDER BY position");
		}
		return list;
	}
	/**
	 * @Name: findLiveManagemt
	 * @Description: 查询所有直播管理集合信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-11（创建日期）
	 * @Parameters: 无
	 * @Return: List<LiveManagement> 直播管理对象集合
	 */
	@Override
	public List<LiveManagement> findAllLiveManagement() {
		// TODO Auto-generated method stub
		return super.findByExample(new LiveManagement(), Order.asc("position"));
	}
	public List<LiveManagement> findAllLiveManagement2() {
		// TODO Auto-generated method stub
		return super.findByExample(new LiveManagement(), Order.asc("channelcode"));
	}
	/**
	 * @Name: findLiveChannelCodeMax
	 * @Description: 查询所有直播管理中最大频道号信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-11-25（创建日期）
	 * @Parameters: 无
	 * @Return: Integer 直播管理对象中最大的频道号
	 */
	@Override
	public Integer findLiveChannelCodeMax() {
		// TODO Auto-generated method stub
		List<LiveManagement> lmList = super.findByExample(new LiveManagement());
		Integer max = 0;
		if(lmList != null && !lmList.isEmpty()){
			for(LiveManagement lm : lmList){
				if(lm.getChannelcode() > max){
					max = lm.getChannelcode();
				}
			}
		}
		return max;
	}
	@Override
	public void updateOtherChannelCode(LiveManagement liveManagement) {
		// TODO Auto-generated method stub
		super.executeSql("UPDATE live SET channelcode = channelcode - 1 WHERE channelcode >= " + liveManagement.getChannelcode());
	}
	@Override
	public void updateLive(int i,Integer chInteger) {
		// TODO Auto-generated method stub
		super.executeSql("UPDATE live SET channelcode = " + i + " WHERE channelcode = " + chInteger);
	}
 
}
