package com.boyue.karaoke.web.webaction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.web.BaseAction;
import com.boyue.karaoke.model.Device;
import com.boyue.karaoke.model.DeviceCategory;
import com.boyue.karaoke.model.ServerMsg;
import com.boyue.karaoke.model.ServerMsgDetail;
import com.boyue.karaoke.service.DeviceCategoryService;
import com.boyue.karaoke.service.DeviceService;
import com.boyue.karaoke.service.IServerMsgDetailService;
import com.boyue.karaoke.service.IServerMsgService;
import com.boyue.karaoke.service.MessageService;
@SuppressWarnings("serial")
@Controller("ServerMsgAction")
@Scope(value="prototype")
public class ServerMsgAction extends BaseAction<ServerMsg> {

	@Autowired
	private IServerMsgService serverMsgService;
	@Autowired 
	private DeviceCategoryService deviceCategoryService;
	@Autowired
	private DeviceService deviceService;
	@Autowired
	private IServerMsgDetailService serverMsgDetailService;
	@Autowired
	private MessageService messageService;
	
	private ServerMsg model = new ServerMsg();
	private List<Integer> idList;
	private List<Integer> idListsave;
	private Map<Integer, Integer> msgTagdeviceMap;
	private List<DeviceCategory> deviceCategoryList;
	/**
	 * @Name: home
	 * @Description: 显示留言管理首页信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-15（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到serverMsgList.jsp页面
	 */
	public String home(){
		this.pageBean = serverMsgService.findServerMsgList(model,pageNo,pageSize);
		return "list";
	}
	/**
	 * @Name: add
	 * @Description: 增加留言管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-15（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到addServerMsg.jsp页面
	 */
	public String add(){
		this.setDeviceEnd();
		return "add";
	}
	/**
	 * @Name: saveServerMsg
	 * @Description: 保存留言管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-15（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到serverMsgList.jsp页面
	 */
	public String saveServerMsg(){
		if (getLang() == 1) {
			model.setContente(model.getContent());
		}else if (getLang() == 2) {
			model.setContent(model.getContente());
		}
		serverMsgService.saveServerMsg(model,idListsave);
		return "redirectList";
	}
	/**
	 * @Name: update
	 * @Description: 更新留言管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-15（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到editServerMsg.jsp页面
	 */
	public String update(){
		//设备终端
		this.setDeviceEnd();
		//设置被选中的终端
		setSeclectDeviceEnd();
		model = serverMsgService.findById(model.getId());
		return "edit";
	}
	
	/**
	 * @Name: updateServerMsg
	 * @Description: 保存更新管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-15（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到serverMsgList.jsp页面
	 */
	public String updateServerMsg(){
		ServerMsg old = serverMsgService.findById(model.getId());
		if (getLang() == 1) {
			model.setContente(old.getContente());
		}else if (getLang() == 2) {
			model.setContent(old.getContent());
		}
		serverMsgService.updateServerMsg(model,idListsave);
		return "redirectList";
	}
	/**
	 * @Name: delByIDs
	 * @Description: 根据ID或ID集合删除留言管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-15（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到serverMsgList.jsp页面
	 */
	public String delByIDs(){
		serverMsgService.delByIDs(idList);
		return "redirectList";
	}
	/**
	 * @Name: setSeclectDeviceEnd
	 * @Description: 设置被选中的终端
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-18（创建日期）
	 * @Parameters: 无
	 * @Return: 无
	 */
	private void setSeclectDeviceEnd() {
		List<ServerMsgDetail> smdList = serverMsgDetailService.findByMsgId(model.getId());
		if(smdList != null && !smdList.isEmpty()){
			if(msgTagdeviceMap == null ){
				msgTagdeviceMap = new HashMap<Integer, Integer>();
			}
			msgTagdeviceMap.clear();
			for(ServerMsgDetail smd : smdList){
				msgTagdeviceMap.put(smd.getUserid(), smd.getUserid());
			}
		}
	}
	/**
	 * @Name: setDeviceEnd
	 * @Description: 设置设备终端
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-18（创建日期）
	 * @Parameters: 无
	 * @Return: String 无
	 */
	private void setDeviceEnd() {
		if(deviceCategoryList == null){
			deviceCategoryList = new ArrayList<DeviceCategory>();
		}
		deviceCategoryList.clear();
		
		List<DeviceCategory> catelist = deviceCategoryService.findAllCategorys(new DeviceCategory());
		if(!catelist.isEmpty()){
			for(DeviceCategory d: catelist){
				List<Device> list = deviceService.findByCategory(d.getId());
				if(list != null && !list.isEmpty() ){
					d.setDevices(list);
					deviceCategoryList.add(d);
				}
			}
		}
	}
	
	public IServerMsgService getServerMsgService() {
		return serverMsgService;
	}
	public void setServerMsgService(IServerMsgService serverMsgService) {
		this.serverMsgService = serverMsgService;
	}
	public ServerMsg getModel() {
		return model;
	}
	public void setModel(ServerMsg model) {
		this.model = model;
	}
	public List<DeviceCategory> getDeviceCategoryList() {
		return deviceCategoryList;
	}

	public void setDeviceCategoryList(List<DeviceCategory> deviceCategoryList) {
		this.deviceCategoryList = deviceCategoryList;
	}
	public DeviceCategoryService getDeviceCategoryService() {
		return deviceCategoryService;
	}
	public void setDeviceCategoryService(DeviceCategoryService deviceCategoryService) {
		this.deviceCategoryService = deviceCategoryService;
	}
	public DeviceService getDeviceService() {
		return deviceService;
	}
	public void setDeviceService(DeviceService deviceService) {
		this.deviceService = deviceService;
	}
	public List<Integer> getIdList() {
		return idList;
	}
	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}
	public List<Integer> getIdListsave() {
		return idListsave;
	}
	public void setIdListsave(List<Integer> idListsave) {
		this.idListsave = idListsave;
	}
	public Map<Integer, Integer> getMsgTagdeviceMap() {
		return msgTagdeviceMap;
	}
	public void setMsgTagdeviceMap(Map<Integer, Integer> msgTagdeviceMap) {
		this.msgTagdeviceMap = msgTagdeviceMap;
	}
	public MessageService getMessageService() {
		return messageService;
	}
	public IServerMsgDetailService getServerMsgDetailService() {
		return serverMsgDetailService;
	}
	public void setServerMsgDetailService(
			IServerMsgDetailService serverMsgDetailService) {
		this.serverMsgDetailService = serverMsgDetailService;
	}
	public void setMessageService(MessageService messageService) {
		this.messageService = messageService;
	}
}
