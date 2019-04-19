package com.boyue.karaoke.web.webaction;


import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.HotelRegister;
import com.boyue.karaoke.service.HotelService;
import com.boyue.karaoke.web.DefaultBaseAction;

/**
 *
 * @author ben
 * @date   2014-7-1 上午9:57:28
 *
 */
@SuppressWarnings("serial")
@Controller("HotelAction")
@Scope(value = "prototype")
public class HotelAction extends DefaultBaseAction<HotelRegister> {
	
	@Autowired
	private HotelService hotelService;
	
	private HotelRegister hotelRegister;
	
	
	/**
	 * 修改/注册酒店
	 */
	public String update() {
			hotelRegister.setId(1);
		if (hotelRegister.getOldhotelname()!=null && !hotelRegister.getOldhotelname().equals("")) {
			hotelRegister.setOldhotelname(hotelRegister.getHotelname());
			hotelService.udpate(hotelRegister);
		}else {
			hotelRegister.setOldhotelname(hotelRegister.getHotelname());
			hotelService.save(hotelRegister);
		}
		return SUCCESS;
	}
	
	
	/**
	 * 跳转
	 */
	public String findList() {
		 HotelRegister hotelRegisters =new HotelRegister();
		 hotelRegisters.setId(1);
		this.hotelRegister=hotelService.findById(hotelRegisters.getId());
		return SUCCESS;
	}
	
	
	public HotelRegister getHotelRegister() {
		return hotelRegister;
	}

	public void setHotelRegister(HotelRegister hotelRegister) {
		this.hotelRegister = hotelRegister;
	}
}
