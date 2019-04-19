package com.boyue.karaoke.service.impl;

import java.util.List;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.SoftUpdateDeviceDAO;
import com.boyue.karaoke.model.SoftUpdateDevice;
import com.boyue.karaoke.service.SoftUpdateDeviceService;
import com.boyue.karaoke.service.SoftUpdateTaskService;

@Service
public class SoftUpdateDeviceServiceImpl implements SoftUpdateDeviceService {

	@Autowired
	private SoftUpdateDeviceDAO softUpdateDeviceDAO;
	
	@Override
	public SoftUpdateDevice findById(int id) {
		return softUpdateDeviceDAO.findById(id);
	}

	@Override
	public void save(SoftUpdateDevice softUpdateDevice) {
		softUpdateDeviceDAO.save(softUpdateDevice);
	}

	@Override
	public void update(SoftUpdateDevice softUpdateDevice) {
		SoftUpdateDevice orig = softUpdateDeviceDAO.findById(softUpdateDevice.getId());
    	if(softUpdateDevice.getSoftUpdateTaskId() != null) {
			orig.setSoftUpdateTaskId(softUpdateDevice.getSoftUpdateTaskId());
		}
    	if(softUpdateDevice.getDeviceId() != null) {
			orig.setDeviceId(softUpdateDevice.getDeviceId());
		}
		softUpdateDeviceDAO.update(orig);
	}

	@Override
	public void deleteById(int id) {
		softUpdateDeviceDAO.deleteById(id);
	}

	@Override
	public void deleteByIdList(List<Integer> idList) {
		softUpdateDeviceDAO.deleteByIdList(idList);
	}

	@Override
	public List<SoftUpdateDevice> findByIdList(List<Integer> idList) {
		return softUpdateDeviceDAO.findByIdList(idList);
	}

	@Override
	public PageBean<SoftUpdateDevice> findPage(SoftUpdateDevice softUpdateDevice, int pageNumber,
			int pageSize) {
		if (softUpdateDevice == null) {
			softUpdateDevice = new SoftUpdateDevice();
		}
		return softUpdateDeviceDAO.findPage(softUpdateDevice, pageNumber, pageSize );
	}

	@Override
	public List<SoftUpdateDevice> findByTask(Integer id) {
		SoftUpdateDevice so = new SoftUpdateDevice();
		so.setSoftUpdateTaskId(id);
		return softUpdateDeviceDAO.findByExample(so );
	}
	
	public void deleteByTask(int  id) {
		softUpdateDeviceDAO.deleteByTask(id);
	}

	@Override
	public void deleteByDevice(int deviceId) {
		softUpdateDeviceDAO.deleteByDevice(deviceId);
	}

	@Override
	public List<SoftUpdateDevice> findbyDevice(int deviceid) {
		SoftUpdateDevice entity = new SoftUpdateDevice();
		entity.setDeviceId(deviceid);
		return softUpdateDeviceDAO.findByExample(entity);
	}

}
