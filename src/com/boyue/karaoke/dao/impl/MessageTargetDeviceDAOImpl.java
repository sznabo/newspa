package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.MessageTargetDeviceDAO;
import com.boyue.karaoke.model.MessageTargetDevice;

/**
 *  
 *  
 *
 */
@Repository
public class MessageTargetDeviceDAOImpl extends BaseDAOImpl<MessageTargetDevice> implements MessageTargetDeviceDAO {

	@Override
	public void delMessageTargetDeviceByMsgId(List<Integer> idList) {
		this.executeSql("delete from message_target_device where message_id in (" + StringUtils.join(idList, ",") + ")");
	}

	@Override
	public List<MessageTargetDevice> findTargetlistByMessageId(int messageId) {
		return this.findByHql("FROM MessageTargetDevice where messageId=" + messageId);
	}

	@Override
	public void delMessageTargetByMsgId(int messageId) {
		this.executeSql("delete from message_target_device where message_id=" + messageId);
	}

	@Override
	public void deleteByDevice(int deviceId) {
		this.executeSql("delete from message_target_device where device_id=" + deviceId);
	}

}
