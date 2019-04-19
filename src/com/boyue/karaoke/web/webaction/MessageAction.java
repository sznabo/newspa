package com.boyue.karaoke.web.webaction;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.Device;
import com.boyue.karaoke.model.DeviceCategory;
import com.boyue.karaoke.model.Message;
import com.boyue.karaoke.model.MessageTargetDevice;
import com.boyue.karaoke.service.DeviceCategoryService;
import com.boyue.karaoke.service.DeviceService;
import com.boyue.karaoke.service.MessageService;
import com.boyue.karaoke.service.MessageTargetDeviceService;
import com.boyue.karaoke.web.DefaultBaseAction;

@Controller("MessageAction")
@Scope(value = "prototype")
public class MessageAction extends DefaultBaseAction<Message> {

	@Autowired
	private MessageService messageService;
	@Autowired 
	private DeviceCategoryService deviceCategoryService;
	@Autowired
	private DeviceService deviceService;
	@Autowired
	private MessageTargetDeviceService targetService;
	
	private Integer id;
	
	//页面传过来的id 列表
	private List<Integer> idList;
	
	private List<Integer> idListsave;
	private List<Integer> messageIdList;
	
	private Message message = new Message();;
	
	@Resource(name="messageStatus")
	private Map<Integer, String> messageStatus;
	
	@Resource(name="messagePosition")
	private Map<Integer, String> messagePosition;
	
	@Resource(name="messagePlayType")
	private Map<Integer, String> messagePlayType;
	
	private List<DeviceCategory> deviceCategoryList;
	private Map<Integer, Integer> msgTagdeviceMap;
	private Integer playType;
 	
	/**
	 * 进入增加页面
	 * @return
	 */
	public String addMessage() {
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
		return "toadd";
	}
	
	
	/**
	 * 分页查询
	 * @return
	 */
	public String findPage() {
		this.pageBean = messageService.findPage(message, pageNo, pageSize);
		return "list";
	}
	
	/**
	 * 增加
	 * @return
	 */
	public String save() {
		if(playType.intValue() == 1){
			message.setType(1);
		}else if(playType.intValue() == 2){
			message.setType(2);
		}
		if (getLang() == 1) {
			message.setContente(message.getContent());
		}else if (getLang() == 2) {
			message.setContent(message.getContente());
		}
		messageService.save(message,idListsave);
		return "redirectList";
		//return findPage();
	}
	
	/**
	 * 修改
	 * @return
	 */
	public String update() {
		Message orig = messageService.findById(message.getId());
		if(playType.intValue() == 1){
			message.setType(1);
			
		}else if(playType.intValue() == 2){
			message.setType(2);
		}
		if (getLang() == 1) {
			message.setContente(orig.getContente());
		}else if (getLang() == 2) {
			message.setContent(orig.getContent());
		}
		messageService.update(message,idListsave);
		//message = new Message();
		//return findPage();
		return "redirectList";
	}

	/**
	 * 跳转到修改页面
	 * @return
	 */
	public String toUpdate() {
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
		
		List<MessageTargetDevice> trgtlist = targetService.findByMessageId(message.getId());
		if(trgtlist != null && !trgtlist.isEmpty()){
			if(msgTagdeviceMap == null ){
				msgTagdeviceMap = new HashMap<Integer, Integer>();
			}
			msgTagdeviceMap.clear();
			for(MessageTargetDevice t : trgtlist){
				msgTagdeviceMap.put(t.getDeviceId(), t.getDeviceId());
			}
		}
		message = messageService.findById(message.getId());
		return "edit";
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String delMessage() {
		if (messageIdList != null && !messageIdList.isEmpty()) {
			messageService.deleteByIdList(messageIdList);
		}
		return findPage();
	}
	
	/**
	 * 删除
	 * */
	public String deleteMsg(){
		messageService.deleteById(message.getId());
		message = new Message();
		return findPage();
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

	public Message getMessage() {
		return message;
	}

	public void setMessage(Message message) {
		this.message = message;
	}

	public Map<Integer, String> getMessageStatus() {
		return messageStatus;
	}

	public void setMessageStatus(Map<Integer, String> messageStatus) {
		this.messageStatus = messageStatus;
	}

	public Map<Integer, String> getMessagePosition() {
		return messagePosition;
	}

	public void setMessagePosition(Map<Integer, String> messagePosition) {
		this.messagePosition = messagePosition;
	}

	public List<DeviceCategory> getDeviceCategoryList() {
		return deviceCategoryList;
	}

	public void setDeviceCategoryList(List<DeviceCategory> deviceCategoryList) {
		this.deviceCategoryList = deviceCategoryList;
	}

	public List<Integer> getIdListsave() {
		return idListsave;
	}

	public void setIdListsave(List<Integer> idListsave) {
		this.idListsave = idListsave;
	}

	public List<Integer> getMessageIdList() {
		return messageIdList;
	}

	public void setMessageIdList(List<Integer> messageIdList) {
		this.messageIdList = messageIdList;
	}

	public Map<Integer, Integer> getMsgTagdeviceMap() {
		return msgTagdeviceMap;
	}

	public void setMsgTagdeviceMap(Map<Integer, Integer> msgTagdeviceMap) {
		this.msgTagdeviceMap = msgTagdeviceMap;
	}

	public Integer getPlayType() {
		return playType;
	}

	public void setPlayType(Integer playType) {
		this.playType = playType;
	}

	public Map<Integer, String> getMessagePlayType() {
		return messagePlayType;
	}

	public void setMessagePlayType(Map<Integer, String> messagePlayType) {
		this.messagePlayType = messagePlayType;
	}
	
}
