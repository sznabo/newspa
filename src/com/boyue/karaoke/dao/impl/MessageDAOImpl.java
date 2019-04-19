package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.MessageDAO;
import com.boyue.karaoke.model.Message;

/**
 *  
 *  
 *
 */
@Repository
public class MessageDAOImpl extends BaseDAOImpl<Message> implements MessageDAO {

	@Override
	public PageBean<Message> findPage(Message message, int pageNumber,
			int pageSize, List<Criterion> params) {
		// TODO Auto-generated method stub
		return super.findPage(pageNumber, pageSize, Message.class, params, null);
	}

}
