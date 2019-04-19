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
import com.boyue.karaoke.dao.AppCategoryDao;
import com.boyue.karaoke.dao.AppCategoryDetailDao;
import com.boyue.karaoke.dao.AppInfoDAO;
import com.boyue.karaoke.model.AppCategory;
import com.boyue.karaoke.model.AppCategoryDetail;
import com.boyue.karaoke.model.AppInfo;
import com.boyue.karaoke.service.AppCategoryService;


@Service
public class AppCategoryServiceImpl implements AppCategoryService{

	@Autowired
	private AppCategoryDao appCategoryDao;
	
	@Autowired
	private AppInfoDAO appInfoDao;
	
	@Autowired
	private AppCategoryDetailDao appCategoryDetailDao;
	
	@Override
	public void deleteByIdList(List<Integer> idList) {
		if(idList != null && idList.size() > 0){
			for(Integer id:idList){
				if(appInfoDao.findByCategoryId(id)){
					new File(SystemConfig.getProjectPath()+findById(id).getPath()).delete();
					appCategoryDao.deleteById(id);
				}
				
			}
		}
		
	}

	@Override
	public AppCategory findById(int id) {
		
		return appCategoryDao.findById(id);
	}

	@Override
	public PageBean<AppCategory> findPage(AppCategory model, int pageNo, int pageSize) {
		List<Criterion> params = new ArrayList<Criterion>();
		if(model.getName() != null && !model.getName().trim().equals("")){
			params.add(Restrictions.like("name", model.getName().trim(),MatchMode.ANYWHERE));
		}
		if(model.getNamee() != null && !model.getNamee().trim().equals("")){
			params.add(Restrictions.like("namee", model.getNamee().trim(),MatchMode.ANYWHERE));
		}
		return appCategoryDao.findPage(model, pageNo, pageSize,params);
	}

	@Override
	public void save(AppCategory model) {
		try{
			appCategoryDao.save(model);
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public void update(AppCategory model) {
		try{
			appCategoryDao.update(model);
		}catch (Exception e) {
			e.printStackTrace();
		}
		
	}

	@Override
	public List<AppCategory> findall() {
		List<AppCategory> lists = appCategoryDao.findAll();
		if(lists != null && lists.size() > 0){
			for(AppCategory a:lists){
				//产品介绍
				if(a.getId().equals(4)){
					a.setDetails(changePath(appCategoryDetailDao.findAll()));
				}
				a.setPath(SystemConfig.getProjectWebBasePath()+a.getPath());
				List<AppInfo> infos = appInfoDao.findByCategoryIds(a.getId());
				a.setInfos(infos);
			}
		}
		return lists;
	}
	
	
	private List<AppCategoryDetail> changePath(List<AppCategoryDetail> lists){
		if(lists != null && lists.size() > 0){
			for(AppCategoryDetail d:lists){
				d.setPath(SystemConfig.getProjectWebBasePath()+d.getPath());
			}
		}
		
		return lists;
		
	}
	


}
