package com.boyue.karaoke.service.impl;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Order;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.DeviceDAO;
import com.boyue.karaoke.model.Calling;
import com.boyue.karaoke.model.Device;
import com.boyue.karaoke.model.DeviceCategory;
import com.boyue.karaoke.service.DeviceCategoryService;
import com.boyue.karaoke.service.DeviceService;
import com.boyue.karaoke.service.MessageTargetDeviceService;
import com.boyue.karaoke.service.SoftUpdateDeviceService;

@Service
public class DeviceServiceImpl implements DeviceService {

	@Autowired
	private DeviceDAO deviceDAO;
	@Autowired
	private DeviceCategoryService deviceCategoryService;
	@Autowired
	private SoftUpdateDeviceService softUpdateDeviceService;
	@Autowired
	private MessageTargetDeviceService messageTargetDeviceService;
	/**
	 * @Name: findById
	 * @Description: 根据ID查询设备信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-21（创建日期）
	 * @Parameters: int id 设备ID
	 * @Return: Device 设备对象
	 */
	@Override
	public Device findById(int id) {
		return deviceDAO.findById(id);
	}

	@Override
	public void save(Device device) {
		device.setCreateDate(new Date());
		device.setRunStatus(Device.OFFLINE);
		DeviceCategory category = deviceCategoryService.findById(device.getCategoryId());
		device.setCategoryName(category.getName());
		deviceDAO.save(device);
	}

	@Override
	public void update(Device device) {
		DeviceCategory category = deviceCategoryService.findById(device.getCategoryId());
		device.setCategoryName(category.getName());
		deviceDAO.update(device);
	}

	@Override
	public void deleteById(int id) {
		//删除关联的数据
		softUpdateDeviceService.deleteByDevice(id);
		messageTargetDeviceService.deleteByDevice(id);
		deviceDAO.deleteById(id);
	}

	@Override
	public void deleteByIdList(List<Integer> idList) {
		for (int id : idList) {
			deleteById(id);
		}
	}

	@Override
	public List<Device> findByIdList(List<Integer> idList) {
		return deviceDAO.findByIdList(idList);
	}

	@Override
	public PageBean<Device> findPage(Device device, int pageNumber,
			int pageSize) {
		if (device == null) {
			device = new Device();
		}
		List<Criterion> params = new ArrayList<Criterion>();
		if(device.getMac() != null && !device.getMac().trim().equals("")){
			params.add(Restrictions.like("mac", device.getMac().trim(), MatchMode.ANYWHERE));
		}
		if(device.getRunStatus() != null && !device.getRunStatus().equals("")){
			if(device.getRunStatus().equals(1) || device.getRunStatus().equals(2)){
				params.add(Restrictions.eq("runStatus", device.getRunStatus()));
			}
		}
		//return deviceDAO.findPage(device, pageNumber, pageSize);
		return deviceDAO.findPage(device,pageNumber, pageSize,params);
	}

	@Override
	public List<Device> findAll() {
		return deviceDAO.findByExample(new Device());
	}

	
	@Override
	public List<Device> findByCategory(int categoryId) {
		Device t = new Device();
		t.setCategoryId(categoryId);
		return deviceDAO.findByExample(t );
	}

	@Override
	public Device findByMac(String mac) {
		Device t = new Device();
		t.setMac(mac);
		t.setStatus(Device.ENABLE);
		List<Device> device = deviceDAO.findByExample(t);
		if (!device.isEmpty()) {
			return device.get(0);
		}
		return null;
	}

	@Override
	public List<Device> findByTerm(Device device) {
		return deviceDAO.findByExample(device);
	}

	@Override
	public void updateDeviceStatusByIdList(List<Integer> idList) {
		// TODO Auto-generated method stub
		if(!idList.isEmpty()){
			for(Integer in:idList){
				Device de = deviceDAO.findById(in.intValue());
				if(de.getStatus().intValue() != 3){
					de.setStatus(3);
				}
				deviceDAO.update(de);
			}
		}
	}

	@Override
	public void offline(String mac) {
		Device d = findByMac(mac);
		if (d != null) {
			d.setRunStatus(Device.OFFLINE);
		}
		this.update(d);
	}

	@Override
	public void initAllDeviceOffline() {
		deviceDAO.updateRunStatus(Device.OFFLINE);
	}

	/* (non-Javadoc)
	 * @see com.boyue.karaoke.service.DeviceService#findByProduct(int)
	 */
	@Override
	public List<Device> findByProduct(int productId) {
		return deviceDAO.findByProduct(productId);
	}

	@Override
	public PageBean<Device> findDevicePage(List<Calling> callingList,
			int pageNo, int pageSize) {
		// TODO Auto-generated method stub
//		Device dev = new Device();
		List<Device> devList = new ArrayList<Device>();
		if(callingList != null && !callingList.isEmpty()){
			for(Calling call : callingList){
				List<Criterion> params = new ArrayList<Criterion>();
				if(call.getUserid() != null && !call.getUserid().toString().trim().equals("")){
					List<Integer> deviceidList = new ArrayList<Integer>();
					deviceidList.add(call.getUserid());
					params.add(Restrictions.in("id", deviceidList));
					devList.add(deviceDAO.findById(call.getUserid()));
//					for(Integer devid: deviceidList){
//						devList.add(deviceDAO.findById(devid));
//					}
				}
				if(devList != null && !devList.isEmpty()){
					for(Device dev:devList){
						return deviceDAO.findPage(dev, pageNo, pageSize, params,Order.asc(dev.getCalling().getStatus().toString()),Order.desc(dev.getCalling().getTime().toString()));
					}
				}
			}
		}
		return null;
	}

	@Override
	public Integer findByMaxCount() {
	 return this.deviceDAO.findByMaxCount();
	}

}
