package com.boyue.karaoke.web.webaction;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.Device;
import com.boyue.karaoke.service.DeviceService;
import com.boyue.karaoke.web.DefaultBaseAction;
import com.boyue.karaoke.web.devicestate.OnlineUserList;

@Controller("IndexAction")
@Scope(value = "prototype")
public class IndexAction extends DefaultBaseAction {
	@Autowired
	private DeviceService deviceService;
	
	private Integer onlineDeviceCount;
	private Integer offlineDeviceCount;
	
	public String index() {
		
		return SUCCESS;
	}
	
	public String home() {
		int total = deviceService.findAll().size();
		this.onlineDeviceCount = OnlineUserList.getOnlineUserList().size(); 
		
		this.offlineDeviceCount =  total -onlineDeviceCount;
		
		return SUCCESS;
	}
	
	public String home1() {
		int total = deviceService.findAll().size();
		this.onlineDeviceCount = OnlineUserList.getOnlineUserList().size(); 
		
		this.offlineDeviceCount =  total -onlineDeviceCount;
		
		return SUCCESS;
	}


	public Integer getOnlineDeviceCount() {
		return onlineDeviceCount;
	}

	public void setOnlineDeviceCount(Integer onlineDeviceCount) {
		this.onlineDeviceCount = onlineDeviceCount;
	}

	public Integer getOfflineDeviceCount() {
		return offlineDeviceCount;
	}

	public void setOfflineDeviceCount(Integer offlineDeviceCount) {
		this.offlineDeviceCount = offlineDeviceCount;
	}

}
