package com.boyue.karaoke.web.webaction;

import java.sql.Time;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.web.Response;
import com.boyue.karaoke.common.Constants;
import com.boyue.karaoke.model.Calling;
import com.boyue.karaoke.model.Device;
import com.boyue.karaoke.model.DeviceCategory;
import com.boyue.karaoke.model.Product;
import com.boyue.karaoke.service.DeviceCategoryService;
import com.boyue.karaoke.service.DeviceService;
import com.boyue.karaoke.service.ICallingService;
import com.boyue.karaoke.service.ProductService;
import com.boyue.karaoke.web.DefaultBaseAction;

@Controller("DeviceAction")
@Scope(value = "prototype")
public class DeviceAction extends DefaultBaseAction<Device> {

	@Autowired
	private DeviceService deviceService;

	@Autowired
	private DeviceCategoryService deviceCategoryService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ICallingService callingService;

	private Integer id;
	
	private List<Product> allProducts;
	
	// 页面传过来的idList
	private List<Integer> idslist;
	
	//节目单更新时间
	private Time contentUpdateTime;

	private Device device;
	
	private String addmessge;

	@Resource(name = "deviceTypes")
	private Map<Integer, String> typesaa;

	@Resource(name = "deviceStatus")
	private Map<Integer, String> deviceStatus;

	@Resource(name = "deviceRunStatus")
	private Map<Integer, String> deviceRunStatus;

	private List<DeviceCategory> categorylist;
	/**
	 * 进入增加页面
	 * 
	 * @return
	 */
	public String addDevice() {
		List<Device> devices  = deviceService.findAll();
		if(devices!= null && devices.size()>0){
			Integer num = (Integer)ServletActionContext.getServletContext().getAttribute(Constants.SYS_PERSON_NUM);
			if(devices.size() >= num){
				addmessge = "1";
				return "toUp";
			}
		}
		categorylist = deviceCategoryService.findAllCategorys(new DeviceCategory());
		this.allProducts = productService.findAll();
		return "toadd";
	}

	/**
	 * 判断是否重复MAC
	 * 
	 * */
	public String checkMACisExist() {
		ajaxResponse = new Response<Boolean>();

		Device de = new Device();
		de.setMac(device.getMac());
		List<Device> list = deviceService.findByTerm(de);

		if (list == null || list.isEmpty()) {
			ajaxResponse.setMsgBody(true);
		} else {
			ajaxResponse.setMsgBody(false);
		}
		return JSON_RESULT;
	}

	/**
	 * 增加
	 * 
	 * @return
	 */
	public String save() {
		if (device.getProduct()== null || device.getProduct().getId() == null) {
			device.setProduct(null);
		}
		deviceService.save(device);
		deviceCategoryService.deleteUselessDeviceCategory();
		return SUCCESS;
	}

	/**
	 * 修改
	 * 
	 * @return
	 */
	public String update() {
		Device orig = deviceService.findById(device.getId());
		orig.setCategoryName(device.getCategoryName());
		orig.setMac(device.getMac());
		orig.setUserName(device.getUserName());
		orig.setRemark(device.getRemark());
		orig.setStatus(device.getStatus());
		orig.setCategoryId(device.getCategoryId());
		orig.setPosition(device.getPosition());
		orig.setIpaddr(device.getIpaddr());
		if (device.getProduct() != null && device.getProduct().getId() != null) {
			orig.setProduct(device.getProduct());
		} else {
			orig.setProduct(null);
		}
		deviceService.update(orig);
		deviceCategoryService.deleteUselessDeviceCategory();
		return SUCCESS;
	}

	/**
	 * 跳转到修改页面
	 * 
	 * @return
	 */
	public String toUpdate() {
		categorylist = deviceCategoryService.findAllCategorys(new DeviceCategory());
		this.allProducts = productService.findAll();
		device = deviceService.findById(device.getId());
		return "edit";
	}

	/**
	 * 删除
	 * @return
	 */
	public String delDevice() {
		if (idslist != null && !idslist.isEmpty()) {
			deviceService.deleteByIdList(idslist);
			deviceCategoryService.deleteUselessDeviceCategory();
		}
		return SUCCESS;
	}
	
	public String delDeviceById(){
		if (idslist != null && !idslist.isEmpty()) {
			deviceService.deleteByIdList(idslist);
			deviceCategoryService.deleteUselessDeviceCategory();
		}
		return SUCCESS;
	}

	/**
	 * 分页查询
	 * @return
	 */
	public String findPage() {
		
		this.pageBean = deviceService.findPage(device, pageNo, pageSize);
//		Collection<OnlineUser> onlineUserList = OnlineUserList.getOnlineUserList();
//		
//		for (Device d : pageBean.getElements()) {
//			
//			d.setRunStatus(Device.OFFLINE);
//			
//			for (OnlineUser onlineUser : onlineUserList) {
//				if (onlineUser.getMac().equals(d.getMac())) {
//					d.setRunStatus(Device.ONLINE);
//				}
//			}
//		}
		
		return "list";
	}
	
	public String callingDevice(){

		return "callingDevice";
	}
	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public Device getDevice() {
		return device;
	}

	public void setDevice(Device device) {
		this.device = device;
	}

	public Map<Integer, String> getTypesaa() {
		return typesaa;
	}

	public void setTypesaa(Map<Integer, String> typesaa) {
		this.typesaa = typesaa;
	}

	public Map<Integer, String> getDeviceStatus() {
		return deviceStatus;
	}

	public void setDeviceStatus(Map<Integer, String> deviceStatus) {
		this.deviceStatus = deviceStatus;
	}

	public Map<Integer, String> getDeviceRunStatus() {
		return deviceRunStatus;
	}

	public void setDeviceRunStatus(Map<Integer, String> deviceRunStatus) {
		this.deviceRunStatus = deviceRunStatus;
	}

	public List<Integer> getIdslist() {
		return idslist;
	}

	public void setIdslist(List<Integer> idslist) {
		this.idslist = idslist;
	}

	public List<DeviceCategory> getCategorylist() {
		return categorylist;
	}

	public void setCategorylist(List<DeviceCategory> categorylist) {
		this.categorylist = categorylist;
	}

	public Time getContentUpdateTime() {
		return contentUpdateTime;
	}

	public void setContentUpdateTime(Time contentUpdateTime) {
		this.contentUpdateTime = contentUpdateTime;
	}

	public List<Product> getAllProducts() {
		return allProducts;
	}

	public void setAllProducts(List<Product> allProducts) {
		this.allProducts = allProducts;
	}

	public String getAddmessge() {
		return addmessge;
	}

	public void setAddmessge(String addmessge) {
		this.addmessge = addmessge;
	}
	
	

}
