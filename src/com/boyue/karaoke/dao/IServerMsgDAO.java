package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.ServerMsg;

public interface IServerMsgDAO extends DAO<ServerMsg> {

	ServerMsg findServerMsgByMsgid(Integer msgid);

	List<ServerMsg> findServerMsgList(List<Integer> idList);

	void delServerMsgByNoneDetail();
	
	public  Integer findMsgcount();
}
