package com.boyue.karaoke.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.dao.AppCategoryDetailDao;
import com.boyue.karaoke.model.AppCategoryDetail;
import com.boyue.karaoke.service.AppCategoryDetailService;


@Service
public class AppCategoryDetailServiceImpl implements AppCategoryDetailService{

	@Autowired
	private AppCategoryDetailDao appCategoryDetailDao;
	
	
	@Override
	public void deleteByIdList(List<Integer> idList) {
		if(idList != null && idList.size() > 0){
			for(Integer id:idList){
					new File(SystemConfig.getProjectPath()+findById(id).getPath()).delete();
					appCategoryDetailDao.deleteById(id);
				
				
			}
		}
		
	}

	@Override
	public AppCategoryDetail findById(int id) {
		
		return appCategoryDetailDao.findById(id);
	}

	@Override
	public PageBean<AppCategoryDetail> findPage(AppCategoryDetail model, int pageNo, int pageSize) {
		List<Criterion> params = new ArrayList<Criterion>();
		if(model.getName() != null && !model.getName().trim().equals("")){
			params.add(Restrictions.like("name", model.getName().trim(),MatchMode.ANYWHERE));
		}
		return appCategoryDetailDao.findPage(model, pageNo, pageSize,params);
	}

	@Override
	public void save(AppCategoryDetail model) {
		try{
			appCategoryDetailDao.save(model);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void update(AppCategoryDetail model) {
		try{
			appCategoryDetailDao.update(model);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

//	@Override
//	public List<AppCategoryDetail> findall() {
//		List<AppCategoryDetail> lists = appCategoryDetailDao.findAll();
//		if(lists != null && lists.size() > 0){
//			for(AppCategory a:lists){
//				a.setPath(SystemConfig.getProjectWebBasePath()+a.getPath());
//				List<AppInfo> infos = appInfoDao.findByCategoryIds(a.getId());
//				a.setInfos(infos);
//			}
//		}
//		return lists;
//	}
	
	
	
	


}
