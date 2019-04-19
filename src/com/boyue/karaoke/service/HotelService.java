package com.boyue.karaoke.service;

import com.boyue.karaoke.model.HotelRegister;

public interface HotelService {

	void udpate(HotelRegister hotelRegister);

	void save(HotelRegister hotelRegister);

	HotelRegister findById(Integer id);

	
	
}
