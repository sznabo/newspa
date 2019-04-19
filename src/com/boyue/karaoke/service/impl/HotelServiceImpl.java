package com.boyue.karaoke.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.karaoke.service.HotelService;
import com.boyue.karaoke.dao.HotelDAO;
import com.boyue.karaoke.model.HotelRegister;

@Service
public class HotelServiceImpl implements HotelService{
	@Autowired
	private HotelDAO hotelDAO;

	@Override
	public void udpate(HotelRegister hotelRegister) {
		hotelDAO.update(hotelRegister);
	}

	@Override
	public void save(HotelRegister hotelRegister) {
		hotelDAO.save(hotelRegister);
	}

	@Override
	public HotelRegister findById(Integer id) {
		return hotelDAO.findById(id);
	}

}
	