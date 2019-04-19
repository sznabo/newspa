package com.boyue.karaoke.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.Message;

/**
 *  
 *  
 *
 */
public interface MessageDAO extends DAO<Message>  {

	PageBean<Message> findPage(Message message, int pageNumber, int pageSize,
			List<Criterion> params);

	
}
