package com.boyue.karaoke.web.webaction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.web.BaseAction;
import com.boyue.framework.web.Response;
import com.boyue.karaoke.model.Calling;
import com.boyue.karaoke.model.Device;
import com.boyue.karaoke.service.DeviceService;
import com.boyue.karaoke.service.ICallingService;
@Controller("CallingAction")
@Scope(value="prototype")
@SuppressWarnings("serial")
public class CallingAction extends BaseAction<Calling> {

	@Autowired
	private ICallingService callingService;
	@Autowired
	private DeviceService deviceService;
	
	Calling model = new Calling();
	
	Device device = new Device();
	
	/**
	 * @Name: home
	 * @Description: 呼叫信息列表，即关于设备的信息
	 * @Author:（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-21（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到callingList.jsp页面
	 */
	public String home(){
		this.pageBean = callingService.findPage(model, pageNo, pageSize);
		List<Calling> elements = pageBean.getElements();
		for (Calling c : elements) {
			Device d = deviceService.findById(c.getUserid());
			c.setDevice(d);
		}
		callingService.updateCallingChangeStatus();
		return "list";
	}
	/**
	 * @Name: unreadMsg
	 * @Description: 查询呼叫中未读信息的条数
	 * @Author:（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-22（创建日期）
	 * @Parameters: 无
	 * @Return: 返回全局json结果视图
	 */
	public String unreadMsg(){
		Integer unreadMsgList = callingService.findUnReadMsgByStatus(model);
		ajaxResponse = new Response<Integer>();
		if(unreadMsgList == null || unreadMsgList.equals("")){
			ajaxResponse.setMsgBody(0);
		}else{
//			 File audioFile  = new File(PropertiesUtil.Path);
//	    		try {
//	    			new javazoom.jl.player.Player(new FileInputStream(audioFile)).play();
//	    		} catch (FileNotFoundException e) {
//	    			// TODO Auto-generated catch block
//	    			e.printStackTrace();
//	    		} catch (JavaLayerException e) {
//	    			// TODO Auto-generated catch block
//	    			e.printStackTrace();
//	    		}
			ajaxResponse.setMsgBody(unreadMsgList);
		}
//		System.out.println("呼叫中未读信息的个数：" + unreadMsgList);
		return JSON_RESULT;
	}

	public Calling getModel() {
		return model;
	}
	public void setModel(Calling model) {
		this.model = model;
	}

	public Device getDevice() {
		return device;
	}

	public void setDevice(Device device) {
		this.device = device;
	}
}
