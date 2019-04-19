package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.karaoke.model.ServerMsgDetail;

public interface IServerMsgDetailService {

	List<ServerMsgDetail> findByMsgId(Integer id);

	List<ServerMsgDetail> findServerMsgDetailByUserid(Integer id);

	void delServerMsgDetailList(List<ServerMsgDetail> smdList);

}
