package com.boyue.karaoke.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.AdDetailDAO;
import com.boyue.karaoke.model.AdDetail;
import com.boyue.karaoke.service.AdDetailService;

/**
 *
 * @author ben
 * @date   2014-7-1 下午4:00:23
 *
 */
@Service
public class AdDetailServiceImpl implements AdDetailService{
	@Autowired
	private AdDetailDAO adDetailDAO;
	
	@Override
	public void update(AdDetail adDetail) {
		adDetailDAO.update(adDetail);
	}

	@Override
	public void save(AdDetail adDetail) {
		adDetailDAO.save(adDetail);
	}

	@Override
	public AdDetail findById(Integer id) {
		return adDetailDAO.findById(id);
	}

	@Override
	public void deleteByIdList(List<Integer> idList) {
		adDetailDAO.deleteByIdList(idList);
	}
	
	public List<AdDetail> findByIdList(List<Integer> idList) {
		return adDetailDAO.findByIdList(idList);
	}

	@Override
	public PageBean<AdDetail> findPage(AdDetail adDetail, int pageNo,
			int pageSize) {
		return adDetailDAO.findPage(adDetail, pageNo, pageSize);
	}

	@Override
	public List<AdDetail> findByAd(int adId) {
		return adDetailDAO.findByAd(adId);
	}

	@Override
	public AdDetail findByAdId(Integer id) {
		// TODO Auto-generated method stub
		return adDetailDAO.findByAdId(id);
	}

}
