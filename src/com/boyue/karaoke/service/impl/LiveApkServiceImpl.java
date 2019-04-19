package com.boyue.karaoke.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.karaoke.dao.LiveApkDAO;
import com.boyue.karaoke.model.LiveApk;
import com.boyue.karaoke.service.LiveApkService;
@Service
public class LiveApkServiceImpl implements LiveApkService {
	@Autowired
	LiveApkDAO liveApkDAO;
	@Override
	public LiveApk findApk() {
		List<LiveApk> apks = liveApkDAO.findAll();
		if (apks.isEmpty()) {
			return null;
		}
		return apks.get(0);
	}

	@Override
	public boolean updateApk(LiveApk model) {
		if (liveApkDAO.findAll().isEmpty()) {
			if (model.getPath() == null || model.getPackName() == null) {
				return false;
			}
			model.setId(1);
			liveApkDAO.save(model);
		}else {
			LiveApk liveApk = liveApkDAO.findAll().get(0);
			liveApk.setName(model.getName());
			
			if (model.getPackName() != null) {
				liveApk.setPackName(model.getPackName());
			}
			if (model.getPath() != null) {
				liveApk.setPath(model.getPath());
			}
			liveApkDAO.update(liveApk);
		}
		return true;
	}

}
