package com.boyue.karaoke.dao;

import org.hibernate.criterion.Order;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.Calling;

public interface ICallingDAO extends DAO<Calling> {

	Integer findUnReadMsgByStatus(Calling model);

	void updateCallingStatus();
	
	Calling getUnread(Integer deviceId); 

}
