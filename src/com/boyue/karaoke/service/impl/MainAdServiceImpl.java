package com.boyue.karaoke.service.impl;

import java.io.File;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.dao.MainAdDAO;
import com.boyue.karaoke.model.MainAd;
import com.boyue.karaoke.service.MainAdService;

@Service
public class MainAdServiceImpl implements MainAdService{

	@Autowired
	private MainAdDAO mainAdDAO;
	
	@Override
	public void update(MainAd ad) {
		mainAdDAO.update(ad);
	}

	@Override
	public void save(MainAd ad) {
		mainAdDAO.save(ad);
	}

	@Override
	public MainAd findById(Integer id) {
		
		return mainAdDAO.findById(id);
	}

	@Override
	public PageBean<MainAd> findPage(MainAd ad, int pageNo, int pageSize) {
		
		return mainAdDAO.findPage(ad, pageNo, pageSize);
	}

	@Override
	public List<MainAd> findAll() {
		
		return mainAdDAO.findAllByPosition();
	}

	@Override
	public void delByIDs(List<Integer> idList) {
		if(idList != null && !idList.isEmpty()){
			for(Integer i:idList){
				MainAd ad = findById(i);
				new File(SystemConfig.getProjectBasePath()+ad.getFilePath()).delete();
				if (ad.getMusicPath() != null) {
					new File(SystemConfig.getProjectBasePath()+ad.getMusicPath()).delete();
				}
				mainAdDAO.delete(ad);
			}
		}
	}

}
