package com.boyue.karaoke.service.impl;

import java.util.ArrayList;
import java.util.List;
import org.springframework.stereotype.Service;
import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;

import com.boyue.framework.BaseDao.BaseDAO;
import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.SingelLiveDao;
import com.boyue.karaoke.model.SingelLive;
import com.boyue.karaoke.service.SingelLiveService;
import com.boyue.karaoke.service.querycondition.LiveQueryCondition;

@Service
public class SingelLiveServiceImpl implements SingelLiveService{
	@Autowired
	private BaseDAO dao;
	
	@Autowired
	private SingelLiveDao singelLiveDao;
	
	@SuppressWarnings("unchecked")
	public List<SingelLive> browseSingelLiveService() { 
		
		return dao.listAll("SingelLive");
	}

	@Override
	public SingelLive loadSingelLiveService(Integer id) {
		
		return singelLiveDao.findById(id);
//		return (SingelLive)dao.loadById(SingelLive.class, id);
		
		
	}

	@Override
	public boolean delSingelLiveService(Integer id) {
		boolean status = false;
		try{
			dao.delById(SingelLive.class, id);
			status = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}	
		return status;
	}
	
	@Override
	public boolean delLiveMore(String hql) {
		boolean status = false;
		singelLiveDao.delObject(hql);
//		  dao.delObject(hql);
		status = true;
		return status;
	}	
	

	@Override
	public boolean saveOrUpdateSingelLiveService( SingelLive SingelLive) {
		SingelLive live = singelLiveDao.findById(SingelLive.getId());
//		Object o = dao.loadById(SingelLive.class, SingelLive.getId());
		if (live == null) {
			return false;
		}
//		SingelLive live = (SingelLive) o;
		live.setBegintime(SingelLive.getBegintime());
		live.setCrawladdress(SingelLive.getCrawladdress());
		live.setDescription(SingelLive.getDescription());
		live.setEndtime(SingelLive.getEndtime());
		live.setLivemanagementaddress(SingelLive.getLivemanagementaddress());
		live.setLivemanagementagreement(SingelLive.getLivemanagementagreement());
		live.setLivemanagementgrade(SingelLive.getLivemanagementgrade());
		live.setLivemanagementname(SingelLive.getLivemanagementname());
		live.setLivemanagementnamee(SingelLive.getLivemanagementnamee());
		live.setLivemanagementserver(SingelLive.getLivemanagementserver());
		live.setLivemanagementservername(SingelLive.getLivemanagementservername());
		live.setLivemanagementtype(SingelLive.getLivemanagementtype());
		live.setProgramsavetime(SingelLive.getProgramsavetime());
		live.setRecording(SingelLive.getRecording());
		live.setRecordingtime(SingelLive.getRecordingtime());
		live.setSource(SingelLive.getSource());
		if (SingelLive.getPosition() != null) {
			if (SingelLive.getPosition().intValue() == 0) {//0 是变成最后一个
				int position = obtainPosition();
				live.setPosition(position);
			} else {
				//如果本身排在最前面，且还是排在第二个位置则不变
//				if(){
//					
//				}
				int position = SingelLive.getPosition();
				live.setPosition(position);
				updateOtherPostion(position);
			}
		}
//		dao.saveOrUpdate(live);
		singelLiveDao.saveOrUpdate(live);
		return true;
	}

	@Override
	public boolean saveSingelLiveService(SingelLive SingelLive) {
		//如果没选择位置，则给他定义到最后一个,如果选择了位置，则大于等于该位置的都往后加1
		if (SingelLive.getPosition() == null || SingelLive.getPosition().intValue() == 0) {
//			int position = obtainPosition();
			int position = singelLiveDao.obtainPosition();
			SingelLive.setPosition(position);
		} else {
			int position = SingelLive.getPosition();
			updateOtherPostion(position);
		}
//		dao.save(SingelLive);
		singelLiveDao.save(SingelLive);
		return true;
	}
	
	@Override
	public boolean updateLive(SingelLive SingelLive) {
		boolean bool = false;
		try{
			singelLiveDao.saveOrUpdate(SingelLive);
//			dao.saveOrUpdate(SingelLive);
			bool = true;
		}catch (Exception e) {
			e.printStackTrace();
		}
		return bool;
	}	
	
	@Override
	public List<SingelLive> query(String hql) {
		return singelLiveDao.loadManagementByHql(hql);
	}
	
	
	public BaseDAO getDao() {
		return dao;
	}

	public void setDao(BaseDAO dao) {
		this.dao = dao;
	}

	@Override
	public PageBean<SingelLive> findLivePage(LiveQueryCondition condition) {
		List<Criterion> params = new ArrayList<Criterion>();
		if (StringUtils.isNotBlank(condition.getLiveName())) {
			params.add(Restrictions.like("livemanagementname", condition.getLiveName(), MatchMode.ANYWHERE));
		}
		
//		return SingelLiveDao.findPage(t, pageNo, pageSize);
//		return SingelLiveDao.findPages(condition.getPageNo(), condition.getPageSize(), SingelLive.class, params , new Order[]{Order.desc("position"),Order.desc("id")});
		return singelLiveDao.findPages(condition.getPageNo(), condition.getPageSize(), SingelLive.class, params , new Order[]{Order.asc("position"),Order.desc("id")});
//		return dao.findPage(condition.getPageNo(), condition.getPageSize(), SingelLive.class, params, Order.asc("position") );
	}

	/**
	 * 获取已经发布的直播视频，安装位置升序排序
	 * @return
	 */
	private List<SingelLive> findPublishedLive() {
		return dao.findByHql("FROM SingelLive where ifable='1' order by position asc");
	}
	
	private void updateOtherPostion(int position) {
		singelLiveDao.updateOtherPostion(position);
//		dao.executeSql("update SingelLive set position=position+1 where position>=" + position, null);
	}
	
	/**
	 * 获取位置
	 * @return
	 */
	private int obtainPosition() {
//		List list = dao.findByHql("select max(position) FROM SingelLive");
		List list = singelLiveDao.loadByHql("select max(position) FROM SingelLive");
		if (list == null || list.isEmpty()) {//如果没有记录，从1开始
			return 1;
		} else {
			return Integer.valueOf(list.get(0).toString()) + 1;
		}
	}

	@Override
	public List<SingelLive> findLiveListOrderByPosition() {
		return singelLiveDao.findLiveListOrderByPosition();
	}

	@Override
	public List<SingelLive> findClientLives() {
		List<SingelLive> list = singelLiveDao.loadByHql("FROM SingelLive WHERE ifable=1 order by position asc");
//		Service controlServer = servicerMngSerivce.getControlServer();
		for (SingelLive live : list) {
//			live.setControlServerIp(controlServer.getServiceip());
//			live.setControlServerPort(controlServer.getServiceport());
		}
		return list;
	}
}
