package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.SoftUpdateTaskDAO;
import com.boyue.karaoke.model.SoftUpdateTask;

/**
 *  
 *  
 *
 */
@Repository
public class SoftUpdateTaskDAOImpl extends BaseDAOImpl<SoftUpdateTask> implements SoftUpdateTaskDAO {

	@Override
	public List<SoftUpdateTask> findBySoft(int softId) {
		return this.findByHql("FROM SoftUpdateTask where soft.id=" + softId);
	}

}
