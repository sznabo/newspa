package com.boyue.karaoke.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.dao.AppInfoDAO;
import com.boyue.karaoke.model.AppInfo;
import com.boyue.karaoke.service.AppInfoService;

/**
 *
 * @author ben
 * @date   2014-6-27 下午5:15:12
 *
 */
@Service
public class AppInfoServiceImpl implements AppInfoService {

	@Autowired
	private AppInfoDAO appInfoDAO;

	@Override
	public void save(AppInfo appInfo) {
		appInfoDAO.save(appInfo);
	}

	@Override
	public AppInfo findById(int id) {
		return appInfoDAO.findById(id);
	}

	@Override
	public void update(AppInfo old) {
		appInfoDAO.update(old);
	}

	@Override
	public void deleteByIdList(List<Integer> idList) {
		List<AppInfo> list = appInfoDAO.findByIdList(idList);
		appInfoDAO.deleteByIdList(idList);
		String basePath = SystemConfig.getProjectBasePath();
		for (AppInfo ap : list) {
			new File(basePath + ap.getIcon()).delete();
			new File(basePath + ap.getPath()).delete();
		}
	}

	@Override
	public PageBean<AppInfo> findPage(AppInfo appInfo, int pageNo, int pageSize) {
		return this.appInfoDAO.findPage(appInfo, pageNo, pageSize);
	}

	@Override
	public List<AppInfo> findAll() {
		return appInfoDAO.findAll();
	}

}
