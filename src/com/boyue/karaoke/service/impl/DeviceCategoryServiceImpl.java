package com.boyue.karaoke.service.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.DeviceCategoryDAO;
import com.boyue.karaoke.model.Device;
import com.boyue.karaoke.model.DeviceCategory;
import com.boyue.karaoke.service.DeviceCategoryService;
import com.boyue.karaoke.service.DeviceService;

@Service
public class DeviceCategoryServiceImpl implements DeviceCategoryService {

	@Autowired
	private DeviceCategoryDAO deviceCategoryDAO;
	@Autowired
	private DeviceService deviceService;
	
	@Override
	public DeviceCategory findById(int id) {
		return deviceCategoryDAO.findById(id);
	}

	@Override
	public void save(DeviceCategory deviceCategory) {
		deviceCategoryDAO.save(deviceCategory);
	}
	
	@Override
	public void save(DeviceCategory deviceCategory,Device device) {
		deviceCategoryDAO.save(deviceCategory);
		
		device.setCategoryId(deviceCategory.getId());
		deviceService.save(device);
	}

	@Override
	public void update(DeviceCategory deviceCategory) {
		DeviceCategory orig = deviceCategoryDAO.findById(deviceCategory.getId());
    	if(StringUtils.isNotBlank(deviceCategory.getName())) {
			orig.setName(deviceCategory.getName());
		}
		deviceCategoryDAO.update(orig);
	}

	@Override
	public void deleteById(int id) {
		deviceCategoryDAO.deleteById(id);
	}

	@Override
	public void deleteByIdList(List<Integer> idList) {
		
		deviceCategoryDAO.deleteByIdList(idList);
	}

	@Override
	public List<DeviceCategory> findByIdList(List<Integer> idList) {
		return deviceCategoryDAO.findByIdList(idList);
	}

	@Override
	public PageBean<DeviceCategory> findPage(DeviceCategory deviceCategory, int pageNumber,
			int pageSize) {
		if (deviceCategory == null) {
			deviceCategory = new DeviceCategory();
		}
		return deviceCategoryDAO.findPage(deviceCategory, pageNumber, pageSize);
	}

	@Override
	public List<DeviceCategory> findAllCategorys(DeviceCategory deviceCategory) {
		// TODO Auto-generated method stub
		return deviceCategoryDAO.findByExample(deviceCategory);
	}

	@Override
	public List<DeviceCategory> findAll() {
		return deviceCategoryDAO.findByExample(new DeviceCategory());
	}

	@Override
	public void deleteUselessDeviceCategory() {
//		deviceCategoryDAO.deleteNoExistDeviceCategory();
	}

	@Override
	public DeviceCategory findByName(String categoryName) {
		DeviceCategory t = new DeviceCategory();
		t.setName(categoryName);
		List<DeviceCategory> list = deviceCategoryDAO.findByExample(t);
		if (!list.isEmpty()) {
			return list.get(0);
		}
		return null;
	}
}
