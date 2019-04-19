package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.springframework.stereotype.Repository;

import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.AdminDAO;
import com.boyue.karaoke.model.Admin;

/**
 *  
 *  
 *
 */
@Repository
public class AdminDAOImpl extends BaseDAOImpl<Admin> implements AdminDAO {

	@Override
	public Admin findByLoginName(String name) {
		List<Admin> list = this.findByHql("from Admin where loginName =?", new Object[]{name});
		return list.isEmpty()?null:list.get(0);
	}

}
