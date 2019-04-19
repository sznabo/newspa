package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.model.MainAd;
import com.boyue.karaoke.service.MainAdService;
import com.boyue.karaoke.web.DefaultBaseAction;

@SuppressWarnings("serial")
@Controller("MainAdAction")
@Scope(value = "prototype")
public class MainAdAction extends DefaultBaseAction<MainAd> {

	@Autowired
	private MainAdService mainAdService;
	
	private MainAd model;
	
	private List<Integer> idList;
	
	/**
	 * 进入增加页面
	 * @return
	 */
	public String toAdd() {
		return SUCCESS;
	}
	
	/**
	 * 增加
	 * @return
	 */
	public String save() {
		mainAdService.save(model);
		return SUCCESS;
	}

	
	public String toUpdate() {
		model = mainAdService.findById(model.getId());
		return SUCCESS;
	}
	
	public String update() {
		MainAd old = this.mainAdService.findById(model.getId());
		old.setName(model.getName());
		old.setType(model.getType());
		old.setPosition(model.getPosition());
		old.setInter(model.getInter());
		if (StringUtils.isNotBlank(model.getFilePath())) {
			new File(SystemConfig.getProjectBasePath()+old.getFilePath()).delete();
			old.setFilePath(model.getFilePath());
		}
		if (StringUtils.isNotBlank(model.getMusicPath())) {
			new File(SystemConfig.getProjectBasePath()+old.getMusicPath()).delete();
			old.setMusicPath(model.getMusicPath());
		}
		if (model.getType().intValue() == 2 && old.getMusicPath() != null) {  //广告为视频时并且音频文件不为空时，删除
			new File(SystemConfig.getProjectBasePath()+old.getMusicPath()).delete();
		}
		mainAdService.update(old);
		return SUCCESS;
	}

	/**
	 * 删除
	 * @return
	 */
	public String delete() {
		if (idList != null && !idList.isEmpty()) {
			mainAdService.delByIDs(idList);
		}
		return SUCCESS;
	}
	
	/**
	 * 分页查询
	 * @return
	 */
	public String findPage() {
		
		this.pageBean = mainAdService.findPage(model, pageNo, 10);
		
		return SUCCESS;
	}
	
	public MainAdService getMainAdService() {
		return mainAdService;
	}

	public void setMainAdService(MainAdService mainAdService) {
		this.mainAdService = mainAdService;
	}

	public MainAd getModel() {
		return model;
	}

	public void setModel(MainAd model) {
		this.model = model;
	}

	public List<Integer> getIdList() {
		return idList;
	}

	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}
	
	
}
