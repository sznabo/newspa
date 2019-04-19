package com.boyue.karaoke.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.SoftUpdateTaskDAO;
import com.boyue.karaoke.model.SoftUpdateDevice;
import com.boyue.karaoke.model.SoftUpdateTask;
import com.boyue.karaoke.service.SoftService;
import com.boyue.karaoke.service.SoftUpdateDeviceService;
import com.boyue.karaoke.service.SoftUpdateTaskService;

@Service
public class SoftUpdateTaskServiceImpl implements SoftUpdateTaskService {

	@Autowired
	private SoftUpdateTaskDAO softUpdateTaskDAO;
	@Autowired
	private SoftUpdateDeviceService softUpdateDeviceService;
	@Autowired
	private SoftService softService;
	
	@Override
	public SoftUpdateTask findById(int id) {
		return softUpdateTaskDAO.findById(id);
	}

	@Override
	public void save(SoftUpdateTask softUpdateTask) {
		softUpdateTaskDAO.save(softUpdateTask);
		for (SoftUpdateDevice d : softUpdateTask.getSoftUpdateDevices()){
			d.setSoftUpdateTaskId(softUpdateTask.getId());
			softUpdateDeviceService.save(d);
		}
	}

	@Override
	public void update(SoftUpdateTask softUpdateTask) {
		
		//删除老的device关系
		softUpdateDeviceService.deleteByTask(softUpdateTask.getId());
		
		for (SoftUpdateDevice d : softUpdateTask.getSoftUpdateDevices()){
			d.setSoftUpdateTaskId(softUpdateTask.getId());
			softUpdateDeviceService.save(d);
		}
		softUpdateTaskDAO.update(softUpdateTask);
	}

	@Override
	public void deleteById(int id) {
		softUpdateTaskDAO.deleteById(id);
	}

	@Override
	public void deleteByIdList(List<Integer> idList) {
		for (int taskId : idList) {
			//删除老的device关系
			softUpdateDeviceService.deleteByTask(taskId);
		}
		softUpdateTaskDAO.deleteByIdList(idList);
	}

	@Override
	public List<SoftUpdateTask> findByIdList(List<Integer> idList) {
		return softUpdateTaskDAO.findByIdList(idList);
	}

	@Override
	public PageBean<SoftUpdateTask> findPage(SoftUpdateTask softUpdateTask, int pageNumber,
			int pageSize) {
		if (softUpdateTask == null) {
			softUpdateTask = new SoftUpdateTask();
		}
		return softUpdateTaskDAO.findPage(softUpdateTask, pageNumber, pageSize );
	}

	public List<SoftUpdateTask> findBySoft(int versionId) {
		return softUpdateTaskDAO.findBySoft(versionId);
	}

	@Override  
	public SoftUpdateTask findByDevice(int deviceid, String softVersion) {
		Date date = new Date();
		List<SoftUpdateDevice> softUpdateDevices = softUpdateDeviceService.findbyDevice(deviceid);
		//只取开始时间最近的一个
		SoftUpdateTask st = null;
		for (SoftUpdateDevice sud : softUpdateDevices) {
			SoftUpdateTask sut = this.findById(sud.getSoftUpdateTaskId());
//			if (sut == null 
//					|| sut.getStatus() == SoftUpdateTask.DISABLE 
//					|| (StringUtils.isNotBlank(sut.getTargetVersion()) && !sut.getTargetVersion().equals(softVersion))
			if (sut == null || sut.getStatus() == SoftUpdateTask.DISABLE || sut.getTargetVersion().endsWith(softVersion)|| StringUtils.isBlank(softVersion)
					
				) {
				continue;
			}
			if ((date.getTime() >= sut.getStartTime().getTime()) && (date.getTime() <= sut.getEndTime().getTime())) {
				if (st == null) {
					st = sut;
				} else if(sut.getStartTime().getTime() > st.getStartTime().getTime()) {
					st = sut;
				}
			}
		}
		return st;
	}

}
