package com.boyue.karaoke.web.webaction;

import java.util.ArrayList;
import java.util.Date;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.DeviceCategory;
import com.boyue.karaoke.model.Soft;
import com.boyue.karaoke.model.SoftUpdateDevice;
import com.boyue.karaoke.model.SoftUpdateTask;
import com.boyue.karaoke.service.DeviceCategoryService;
import com.boyue.karaoke.service.DeviceService;
import com.boyue.karaoke.service.SoftService;
import com.boyue.karaoke.service.SoftUpdateDeviceService;
import com.boyue.karaoke.service.SoftUpdateTaskService;
import com.boyue.karaoke.web.DefaultBaseAction;

@Controller("SoftUpdateTaskAction")
@Scope(value = "prototype")
public class SoftUpdateTaskAction extends DefaultBaseAction<SoftUpdateTask> {

	@Autowired
	private SoftUpdateTaskService softUpdateTaskService;
	@Autowired
	private SoftService softService;
	@Autowired
	private DeviceService deviceService;
	@Autowired
	private DeviceCategoryService deviceCategoryService;
	@Autowired 
	private SoftUpdateDeviceService softUpdateDeviceService;
	private Integer id;
	
	//页面传过来的删除数据的id 列表
	private List<Integer> idList;
	//页面传过来的添加数据的id列表
	private List<Integer> idListsave;
	
	private SoftUpdateTask softUpdateTask;
	
	private List<Soft> softList=new ArrayList<Soft>();
	
	private List<DeviceCategory> categories=new ArrayList<DeviceCategory>();
	
	
	private Map<Integer, SoftUpdateDevice>	deviceMap;
	/**
	 * 进入增加页面
	 * @return
	 */
	public String toAdd() {
		softList=softService.findAll();
		categories = deviceCategoryService.findAll();
		for (DeviceCategory category : categories) {
			category.setDevices(deviceService.findByCategory(category.getId()));
		}
		return SUCCESS;
	}
	
	/**
	 * 增加
	 * @return
	 */
	public String save() {	
		softUpdateTask.setCreateTime(new Date());
		List<SoftUpdateDevice> soUpdateDeviceList=new ArrayList<SoftUpdateDevice>();
	
		for(Integer id:idListsave)
		{
			SoftUpdateDevice soUpdateDevice=new SoftUpdateDevice(); 
			soUpdateDevice.setDeviceId(id);
			soUpdateDeviceList.add(soUpdateDevice);
		}
		softUpdateTask.setSoftUpdateDevices(soUpdateDeviceList);
		
		softUpdateTaskService.save(softUpdateTask);
		return SUCCESS;
	}
	
	/**
	 * 修改
	 * @return
	 */
	public String update() {
		softUpdateTask.setCreateTime(new Date());
		List<SoftUpdateDevice> soUpdateDeviceList=new ArrayList<SoftUpdateDevice>();
		
		softUpdateDeviceService.deleteByTask(softUpdateTask.getId());
		
	
		for(Integer id:idListsave)
		{
			SoftUpdateDevice soUpdateDevice=new SoftUpdateDevice(); 
			soUpdateDevice.setDeviceId(id);
			soUpdateDeviceList.add(soUpdateDevice);
		}
		softUpdateTask.setSoftUpdateDevices(soUpdateDeviceList);
		
		SoftUpdateTask sut = softUpdateTaskService.findById(softUpdateTask.getId());
		sut.setName(softUpdateTask.getName());
		sut.setStatus(softUpdateTask.getStatus());
		sut.setRemark(softUpdateTask.getRemark());
		sut.setSoft(softUpdateTask.getSoft());
		sut.setStartTime(softUpdateTask.getStartTime());
		sut.setEndTime(softUpdateTask.getEndTime());
		sut.setTargetVersion(softUpdateTask.getTargetVersion());
		sut.setSoftUpdateDevices(softUpdateTask.getSoftUpdateDevices());
		
		softUpdateTaskService.update(sut);
		return SUCCESS;
	}

	/**
	 * 跳转到修改页面
	 * @return
	 */
	public String toUpdate() {
		softList=softService.findAll();
		softUpdateTask = softUpdateTaskService.findById(softUpdateTask.getId());
		categories = deviceCategoryService.findAll();
		for (DeviceCategory category : categories) {
			category.setDevices(deviceService.findByCategory(category.getId()));
		}
		List<SoftUpdateDevice> devices = softUpdateDeviceService.findByTask(softUpdateTask.getId());
		softUpdateTask.setSoftUpdateDevices(devices);
		deviceMap = new HashMap<Integer, SoftUpdateDevice>();
		for (SoftUpdateDevice d : devices) {
			deviceMap.put(d.getDeviceId(),d);
		}
		
		return SUCCESS;
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String delete() {
		if (idList != null && !idList.isEmpty()) {
			softUpdateTaskService.deleteByIdList(idList);
		}
		return SUCCESS;
	}

	/**
	 * 分页查询
	 * @return
	 */
	public String findPage() {
		this.pageBean = softUpdateTaskService.findPage(softUpdateTask, pageNo, pageSize);
		return SUCCESS;
	}
	
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<Integer> getIdList() {
		return idList;
	}

	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}

	public SoftUpdateTask getSoftUpdateTask() {
		return softUpdateTask;
	}

	public void setSoftUpdateTask(SoftUpdateTask softUpdateTask) {
		this.softUpdateTask = softUpdateTask;
	}

	public List<Soft> getSoftList() {
		return softList;
	}

	public void setSoftList(List<Soft> softList) {
		this.softList = softList;
	}

	public List<DeviceCategory> getCategories() {
		return categories;
	}

	public void setCategories(List<DeviceCategory> categories) {
		this.categories = categories;
	}

	public List<Integer> getIdListsave() {
		return idListsave;
	}

	public void setIdListsave(List<Integer> idListsave) {
		this.idListsave = idListsave;
	}

	public Map<Integer, SoftUpdateDevice> getDeviceMap() {
		return deviceMap;
	}

	public void setDeviceMap(Map<Integer, SoftUpdateDevice> deviceMap) {
		this.deviceMap = deviceMap;
	}
	
	
}
