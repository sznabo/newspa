package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.ServerMsgDetail;

public interface IServerMsgDetailDAO extends DAO<ServerMsgDetail>{

	void delServerMsgDetailByMsgId(List<Integer> list);

	List<ServerMsgDetail> findByMsgId(Integer id);

	List<ServerMsgDetail> findServerMsgDetailByUserid(Integer id);

	void deleteByUserIdList(List<Integer> idList);

}
