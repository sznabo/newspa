package com.boyue.karaoke.service.impl;

import java.util.Date;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.security.MD5;
import com.boyue.karaoke.dao.AdminDAO;
import com.boyue.karaoke.model.Admin;
import com.boyue.karaoke.service.AdminService;

@Service
public class AdminServiceImpl implements AdminService {

	@Autowired
	private AdminDAO adminDAO;
	
	@Override
	public Admin findById(int id) {
		return adminDAO.findById(id);
	}

	@Override
	public void save(Admin admin) {
		admin.setCreateTime(new Date());
		admin.setPassword(MD5.encrypt2Str(admin.getPassword()));
		adminDAO.save(admin);
	}

	@Override
	public void update(Admin admin) {
		Admin orig = adminDAO.findById(admin.getId());
    	if(StringUtils.isNotBlank(admin.getUserName())) {
			orig.setUserName(admin.getUserName());
		}
    	if(StringUtils.isNotBlank(admin.getLoginName())) {
			orig.setLoginName(admin.getLoginName());
		}
    	if(StringUtils.isNotBlank(admin.getPassword())) {
			orig.setPassword(MD5.encrypt2Str(admin.getPassword()));
		}
		adminDAO.update(orig);
	}

	@Override
	public void deleteById(int id) {
		adminDAO.deleteById(id);
	}

	@Override
	public void deleteByIdList(List<Integer> idList) {
		adminDAO.deleteByIdList(idList);
	}

	@Override
	public List<Admin> findByIdList(List<Integer> idList) {
		return adminDAO.findByIdList(idList);
	}

	@Override
	public PageBean<Admin> findPage(Admin admin, int pageNumber,
			int pageSize) {
		if (admin == null) {
			admin = new Admin();
		}
		return adminDAO.findPage(admin, pageNumber, pageSize);
	}

	@Override
	public Admin findByLoginName(String loginName) {
		return adminDAO.findByLoginName(loginName);
	}

	@Override
	public List<Admin> findAll() {
		return adminDAO.findByExample(new Admin());
	}

}
