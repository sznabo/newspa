package com.boyue.karaoke.service.impl;

import java.io.File;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.dao.SoftDAO;
import com.boyue.karaoke.model.Soft;
import com.boyue.karaoke.service.SoftService;
import com.boyue.karaoke.service.SoftUpdateTaskService;

@Service
public class SoftServiceImpl implements SoftService {

	@Autowired
	private SoftDAO softDAO;
	@Autowired
	private SoftUpdateTaskService softUpdateTaskService;

	@Override
	public Soft findById(int id) {
		return softDAO.findById(id);
	}

	@Override
	public void save(Soft soft) {
		softDAO.save(soft);
	}

	@Override
	public void update(Soft soft) {
		Soft orig = softDAO.findById(soft.getId());
		if (StringUtils.isNotBlank(soft.getName())) {
			orig.setName(soft.getName());
		}
		if (StringUtils.isNotBlank(soft.getVersion())) {
			orig.setVersion(soft.getVersion());
		}
		if (StringUtils.isNotBlank(soft.getPackageName())) {
			orig.setPackageName(soft.getPackageName());
		}
		if (StringUtils.isNotBlank(soft.getFilePath())) {
			orig.setFilePath(soft.getFilePath());
		}
		if (StringUtils.isNotBlank(soft.getRemark())) {
			orig.setRemark(soft.getRemark());
		}
		softDAO.update(orig);
	}

	@Override
	public void deleteById(int id) {
		if (!hasJob(id)) {
			Soft s = (Soft) softDAO.findById(id);
			File f = new File(SystemConfig.getProjectBasePath() + s.getFilePath());
			if (f.exists()) {
				f.delete();
			} 
		}
		softDAO.deleteById(id);
	}

	@Override
	public void deleteByIdList(List<Integer> idList) {
		if (idList != null) {
			for (Integer id : idList) {
				deleteById(id);
			}
		}
	}

	/**
	 * 检测有没有关联的升级任务
	 * 
	 * @param versionId
	 * @return
	 */
	private boolean hasJob(int versionId) {
		// 还需要修改
		List list = softUpdateTaskService.findBySoft(versionId);
		if (list != null && !list.isEmpty()) {
			return true;
		}
		return false;
	}

	@Override
	public List<Soft> findByIdList(List<Integer> idList) {
		return softDAO.findByIdList(idList);
	}

	@Override
	public PageBean<Soft> findPage(Soft soft, int pageNumber, int pageSize) {
		if (soft == null) {
			soft = new Soft();
		}
		return softDAO.findPage(soft, pageNumber, pageSize);
	}

	@Override
	public List<Soft> findAll() {
		return softDAO.findByExample(new Soft());
	}

}
