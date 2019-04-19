package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.Calling;
import com.boyue.karaoke.model.Device;


public interface ICallingService {

	void saveCalling(Device callingDevive);

	List<Calling> findCallingList();

	PageBean<Calling> findPage(Calling calling, int pageNo, int pageSize);

	Integer findUnReadMsgByStatus(Calling model);

	void updateCallingChangeStatus();

	void delCallingByTimerTask();

}
