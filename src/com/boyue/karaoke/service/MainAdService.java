package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.MainAd;

public interface MainAdService {

	void update(MainAd ad);
	
	void save(MainAd ad);
	
	MainAd findById(Integer id);
	
	PageBean<MainAd> findPage(MainAd ad, int pageNo, int pageSize);
	
	List<MainAd> findAll();
	
	void delByIDs(List<Integer> idList);
}
