package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.LiveManagement;

public interface ILiveManagementService {

	PageBean<LiveManagement> findLiveManagementList(LiveManagement model, int pageNo,
			int pageSize);

	void saveLiveManagement(LiveManagement model);

	LiveManagement findLiveManagement(Integer id);

	void updateLiveManagement(LiveManagement model);

	void deleteLiveManagement(List<Integer> idList);

	List<LiveManagement> findLiveManagementList(LiveManagement model);

	List<LiveManagement> findAllLiveManagement();

}
