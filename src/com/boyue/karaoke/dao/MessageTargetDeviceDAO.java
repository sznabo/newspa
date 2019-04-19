package com.boyue.karaoke.dao;

import java.util.List;

import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.MessageTargetDevice;
import com.boyue.karaoke.model.ServerMsgDetail;

/**
 *  
 *  
 *
 */
public interface MessageTargetDeviceDAO extends DAO<MessageTargetDevice>  {
	
	public void delMessageTargetByMsgId(int messageId);
	
	public void delMessageTargetDeviceByMsgId(List<Integer> isList);
	
	public List<MessageTargetDevice> findTargetlistByMessageId(int messageId);

	/**
	 * @param deviceId
	 */
	public void deleteByDevice(int deviceId);

}
