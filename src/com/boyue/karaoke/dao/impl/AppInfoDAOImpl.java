package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.dao.AppInfoDAO;
import com.boyue.karaoke.model.AppInfo;

/**
 *
 * @author ben
 * @date   2014-6-27 下午5:14:18
 *
 */

@Repository
public class AppInfoDAOImpl  extends BaseDAOImpl<AppInfo> implements AppInfoDAO {

	public PageBean<AppInfo> findPage(AppInfo appInfo, int pageNo, int pageSize) {
		return this.findPage(appInfo, pageNo, pageSize, Order.asc("position"));
	}
	
	
	public boolean findByCategoryId(Integer id){
		boolean status = true;
		String hql = "from AppInfo where category ="+id;
		List<AppInfo> lists = this.findByHql(hql);
		if(lists != null && lists.size() > 0){
			status = false;
		}
		return status;
	}


	@Override
	public List<AppInfo> findByCategoryIds(Integer id) {
		String hql = "from AppInfo where category ="+id;
		List<AppInfo> lists = this.findByHql(hql);
		if(lists != null && lists.size() > 0){
			for(AppInfo a:lists){
				a.setIcon(SystemConfig.getProjectWebBasePath()+ a.getIcon());
				a.setPath(SystemConfig.getProjectWebBasePath()+a.getPath());
			}
		}
		return lists;
	}
	
	

}
