package com.boyue.karaoke.service.impl;

import java.util.ArrayList;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.MessageDAO;
import com.boyue.karaoke.dao.MessageTargetDeviceDAO;
import com.boyue.karaoke.model.Message;
import com.boyue.karaoke.model.MessageTargetDevice;
import com.boyue.karaoke.service.MessageService;

@Service
public class MessageServiceImpl implements MessageService {

	@Autowired
	private MessageDAO messageDAO;

	@Autowired
	private MessageTargetDeviceDAO targetDAO;
	
	@Override
	public Message findById(int id) {
		return messageDAO.findById(id);
	}

	@Override
	public void save(Message message,List<Integer> idList) {
		if(!idList.isEmpty()){
			messageDAO.save(message);
			for(Integer in:idList){
				MessageTargetDevice tg = new MessageTargetDevice();
				tg.setMessageId(message.getId());
				tg.setDeviceId(in.intValue());
				targetDAO.save(tg);
			}
		}
	}

	@Override
	public void update(Message message,List<Integer> idlist) {
		Message orig = messageDAO.findById(message.getId());
    	if(StringUtils.isNotBlank(message.getTitle())) {
			orig.setTitle(message.getTitle());
		}
    	if(message.getStatus() != null) {
			orig.setStatus(message.getStatus());
		}
    	if(message.getPosition() != null) {
			orig.setPosition(message.getPosition());
		}
    	if(message.getType() != null){
    		orig.setType(message.getType());
    	}
		if(message.getType() == 1){
			orig.setStartTime(null);
		}else if(message.getType() == 2){
			orig.setStartTime(message.getStartTime());
		}
		if(message.getType() == 1){
			orig.setEndTime(null);
		}else if(message.getType() == 2){
			orig.setEndTime(message.getEndTime()); 
		}
		if(message.getType() == 1){
			orig.setStartDate(null);
		}else if(message.getType() == 2){
			orig.setStartDate(message.getStartDate()); 
		}
		if(message.getType() == 1){
			orig.setEndDate(null);
		}else if(message.getType() == 2){
			orig.setEndDate(message.getEndDate()); 
		}
    	if(StringUtils.isNotBlank(message.getContent())) {
			orig.setContent(message.getContent());
		}
    	orig.setContent(message.getContent());
    	orig.setContente(message.getContente());
    	
		messageDAO.update(orig);
		
		//删除以前的任务
		List<Integer> list = new ArrayList<Integer>();
		list.add(message.getId());
		targetDAO.delMessageTargetDeviceByMsgId(list);
		
		//重新建立任务
		if(idlist != null && !idlist.isEmpty() ){
			for(Integer in:idlist){
				MessageTargetDevice tg = new MessageTargetDevice();
				tg.setMessageId(message.getId());
				tg.setDeviceId(in.intValue());
				targetDAO.save(tg);
			}
		}
	}

	@Override
	public void deleteById(int id) {
		targetDAO.delMessageTargetByMsgId(id);
		messageDAO.deleteById(id);
	}

	@Override
	public void deleteByIdList(List<Integer> idList) {
		targetDAO.delMessageTargetDeviceByMsgId(idList);
		messageDAO.deleteByIdList(idList);
	}

	@Override
	public List<Message> findByIdList(List<Integer> idList) {
		return messageDAO.findByIdList(idList);
	}

	
	
	/**
	 * @Title: findPage
	 * @Description: 获取分页消息
	 */
	@Override
	public PageBean<Message> findPage(Message message, int pageNumber,int pageSize) {
		if (message == null) {
			message = new Message();
		}
		List<Criterion> params = new ArrayList<Criterion>();
		if(message.getTitle() != null && !message.getTitle().trim().equals("")){
			params.add(Restrictions.like("title", message.getTitle().trim(),MatchMode.ANYWHERE));
		}
		return messageDAO.findPage(message, pageNumber, pageSize,params);
	}

	@Override
	public List<Message> findDeviceMessage(int deviceId) {
		MessageTargetDevice t = new MessageTargetDevice();
		t.setDeviceId(deviceId);
		List<MessageTargetDevice> list = targetDAO.findByExample(t);
		
		List<Message> msgs = new ArrayList<Message>();
		if(list != null && !list.isEmpty()){
			for (MessageTargetDevice mtd : list) {
				Message m = this.findById(mtd.getMessageId());
				if(m != null){
					msgs.add(m);
				}
			}
		}
		return msgs;
	}

}
