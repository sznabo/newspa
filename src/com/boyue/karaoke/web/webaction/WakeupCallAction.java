package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.util.Date;
import java.util.List;

import javazoom.jl.decoder.JavaLayerException;

import javassist.expr.NewArray;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.web.Response;
import com.boyue.karaoke.common.Constants;
import com.boyue.karaoke.model.Calling;
import com.boyue.karaoke.model.Device;
import com.boyue.karaoke.model.WakeupCall;
import com.boyue.karaoke.service.DeviceService;
import com.boyue.karaoke.service.WakeupCallService;
import com.boyue.karaoke.util.PropertiesUtil;
import com.boyue.karaoke.web.DefaultBaseAction;


@Controller("WakeupCallAction")
@Scope(value = "prototype")
public class WakeupCallAction extends DefaultBaseAction<WakeupCall>{
	
	@Autowired
	private DeviceService deviceService;
	@Autowired
	private WakeupCallService wakeupCallService;
	
	Device device = new Device();
	WakeupCall model = new WakeupCall();

	/**
	 * 分页显示
	 * @return
	 */
	public String home(){
		model = new WakeupCall();
		this.pageBean = wakeupCallService.findPage(model, pageNo, pageSize);
		List<WakeupCall> elements = pageBean.getElements();
		for (WakeupCall w : elements) {
			Device d = deviceService.findById(w.getUserid());
			w.setDevice(d);
		}
		return "list";
	}
	
	
	
	
	/**
	 * 查找返回未读消息个数
	 */
	
	public String unResult(){
		Integer unresult = wakeupCallService.findUnresult();
		ajaxResponse = new Response<Integer>();
		if(unresult == null || unresult.equals("")){
			ajaxResponse.setMsgBody(0);
		}else{
//			File audioFile  = new File(PropertiesUtil.Path);
//    		try {
//    			new javazoom.jl.player.Player(new FileInputStream(audioFile)).play();
//    		} catch (FileNotFoundException e) {
//    			// TODO Auto-generated catch block
//    			e.printStackTrace();
//    		} catch (JavaLayerException e) {
//    			// TODO Auto-generated catch block
//    			e.printStackTrace();
//    		}
			ajaxResponse.setMsgBody(unresult);
		}
		return JSON_RESULT;
	}
	
	
	/**
	 * 将返回消息返回终端
	 * @return
	 */
	public String changeBack(){
		if(model.getId() != null){
			model = wakeupCallService.findById(model.getId());
			model.setBackIf(1);
			model.setBackTime(new Date());
			wakeupCallService.updateWakeUp(model);
		}
		
		return home();
	}

	
	/**
	 * 将叫醒消息修改做已处理
	 * @return
	 */
	public String manger(){
		if(model.getId() != null){
			model = wakeupCallService.findById(model.getId());
			model.setManageIf(1);
			model.setUpdatetime(new Date());
			wakeupCallService.updateWakeUp(model);
		}
		
		return home();
	}



	public Device getDevice() {
		return device;
	}




	public void setDevice(Device device) {
		this.device = device;
	}




	public WakeupCall getModel() {
		return model;
	}




	public void setModel(WakeupCall model) {
		this.model = model;
	}
	
	
	

}
