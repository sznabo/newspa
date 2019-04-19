package com.boyue.karaoke.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.MessageTargetDeviceDAO;
import com.boyue.karaoke.model.MessageTargetDevice;
import com.boyue.karaoke.service.MessageTargetDeviceService;

@Service
public class MessageTargetDeviceServiceImpl implements MessageTargetDeviceService {

	@Autowired
	private MessageTargetDeviceDAO messageTargetDeviceDAO;
	
	@Override
	public MessageTargetDevice findById(int id) {
		return messageTargetDeviceDAO.findById(id);
	}

	@Override
	public void save(MessageTargetDevice messageTargetDevice) {
		messageTargetDeviceDAO.save(messageTargetDevice);
	}

	@Override
	public void update(MessageTargetDevice messageTargetDevice) {
		MessageTargetDevice orig = messageTargetDeviceDAO.findById(messageTargetDevice.getId());
    	if(messageTargetDevice.getMessageId() != null) {
			orig.setMessageId(messageTargetDevice.getMessageId());
		}
    	if(messageTargetDevice.getDeviceId() != null) {
			orig.setDeviceId(messageTargetDevice.getDeviceId());
		}
		messageTargetDeviceDAO.update(orig);
	}

	@Override
	public void deleteById(int id) {
		messageTargetDeviceDAO.deleteById(id);
	}

	@Override
	public void deleteByIdList(List<Integer> idList) {
		messageTargetDeviceDAO.deleteByIdList(idList);
	}

	@Override
	public List<MessageTargetDevice> findByIdList(List<Integer> idList) {
		return messageTargetDeviceDAO.findByIdList(idList);
	}

	@Override
	public PageBean<MessageTargetDevice> findPage(MessageTargetDevice messageTargetDevice, int pageNumber,
			int pageSize) {
		if (messageTargetDevice == null) {
			messageTargetDevice = new MessageTargetDevice();
		}
		return messageTargetDeviceDAO.findPage(messageTargetDevice, pageNumber, pageSize );
	}

	@Override
	public List<MessageTargetDevice> findByMessageId(int messgeId) {
		// TODO Auto-generated method stub
		return messageTargetDeviceDAO.findTargetlistByMessageId(messgeId);
	}

	@Override
	public void deleteByDevice(int deviceId) {
		messageTargetDeviceDAO.deleteByDevice(deviceId);
		
	}

}
