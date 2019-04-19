package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.karaoke.model.Functions;

public interface FunctionsService {

	List<Functions> findAll();
	
	Functions findById(Integer id);
	
	void updateFcuntion(Functions functions);
}
