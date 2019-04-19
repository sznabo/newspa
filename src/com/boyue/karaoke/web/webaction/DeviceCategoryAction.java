package com.boyue.karaoke.web.webaction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.DeviceCategory;
import com.boyue.karaoke.service.DeviceCategoryService;
import com.boyue.karaoke.web.DefaultBaseAction;

@Controller("DeviceCategoryAction")
@Scope(value = "prototype")
public class DeviceCategoryAction extends DefaultBaseAction<DeviceCategory> {

	@Autowired
	private DeviceCategoryService deviceCategoryService;
	
	private Integer id;
	
	//页面传过来的id 列表
	private List<Integer> idList;
	
	private DeviceCategory deviceCategory;
	
	/**
	 * 进入增加页面
	 * @return
	 */
	public String toAdd() {
		return SUCCESS;
	}
	
	/**
	 * 增加
	 * @return
	 */
	public String save() {
		deviceCategoryService.save(deviceCategory);
		return SUCCESS;
	}
	
	/**
	 * 修改
	 * @return
	 */
	public String update() {
		deviceCategoryService.update(deviceCategory);
		return SUCCESS;
	}

	/**
	 * 跳转到修改页面
	 * @return
	 */
	public String toUpdate() {
		deviceCategory = deviceCategoryService.findById(id);
		return SUCCESS;
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String delete() {
		if (idList != null && !idList.isEmpty()) {
			deviceCategoryService.deleteByIdList(idList);
		}
		return SUCCESS;
	}

	/**
	 * 分页查询
	 * @return
	 */
	public String findPage() {
		this.pageBean = deviceCategoryService.findPage(deviceCategory, pageNo, pageSize);
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

	public DeviceCategory getDeviceCategory() {
		return deviceCategory;
	}

	public void setDeviceCategory(DeviceCategory deviceCategory) {
		this.deviceCategory = deviceCategory;
	}
	
}
