package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.model.ServerMsg;
import com.boyue.karaoke.model.ServerMsgDetail;

public interface IServerMsgService {

	PageBean<ServerMsg> findServerMsgList(ServerMsg model, int pageNo,
			int pageSize);

	ServerMsg findById(Integer id);

	void saveServerMsg(ServerMsg model, List<Integer> idListsave);

	void updateServerMsg(ServerMsg model, List<Integer> idListsave);

	void delByIDs(List<Integer> idList);

	ServerMsg findServerMsgByMsgid(Integer msgid);

	List<ServerMsg> findServerMsgList(List<ServerMsgDetail> smdList);

	void delServerMsgByNoneDetail();
	
	public  Integer findMsgCount();
}
