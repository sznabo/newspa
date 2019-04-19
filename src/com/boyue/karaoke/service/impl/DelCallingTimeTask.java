package com.boyue.karaoke.service.impl;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.karaoke.service.ICallingService;
@Service
public class DelCallingTimeTask{
	
	@Autowired
	private ICallingService callingService;
	
	public void run() {
		callingService.delCallingByTimerTask();
	}
}
