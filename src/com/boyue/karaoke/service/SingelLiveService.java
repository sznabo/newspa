package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.SingelLive;
import com.boyue.karaoke.service.querycondition.LiveQueryCondition;

public interface SingelLiveService {
	/** 浏览直播管理 */
	public List<SingelLive> browseSingelLiveService();	
	/** 装载指定的直播管理 */	
	public SingelLive  loadSingelLiveService(Integer id);	
	/** 删除指定的直播管理 */	
	public boolean delSingelLiveService(Integer id);	
	/** 新增或修改直播管理 */
	public boolean saveOrUpdateSingelLiveService(SingelLive SingelLive);	
	/** 新增直播管理 */
	public boolean saveSingelLiveService(SingelLive SingelLive);
	/**通过hql执行批删除*/
	public boolean delLiveMore(String hql);
	/**加载满足条件的持久化对象*/
	public List<SingelLive> query(String hql);
	/**更新直播频道信息*/
	public boolean updateLive(SingelLive SingelLive);
	
	public PageBean<SingelLive> findLivePage(LiveQueryCondition condition);
	
	public List<SingelLive> findLiveListOrderByPosition();
	
	public List<SingelLive> findClientLives();
	
}
