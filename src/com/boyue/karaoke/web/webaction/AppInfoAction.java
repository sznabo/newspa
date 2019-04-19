package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.io.IOException;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.model.AppCategory;
import com.boyue.karaoke.model.AppInfo;
import com.boyue.karaoke.service.AppCategoryService;
import com.boyue.karaoke.service.AppInfoService;
import com.boyue.karaoke.util.ApkUtil;
import com.boyue.karaoke.web.DefaultBaseAction;

/**
 *
 * @author ben
 * @date   2014-6-27 下午5:18:36
 *
 */
@Controller("AppInfoAction")
@Scope(value = "prototype")
public class AppInfoAction  extends DefaultBaseAction<AppInfo> {
	
	@Autowired
	private AppInfoService appInfoService;
	@Autowired
	private AppCategoryService appCategoryService;
	private Integer id;
	
	//页面传过来的id 列表
	private List<Integer> idList;
	
	private AppInfo appInfo;
	
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
	 * @throws IOException 
	 */
	public String save() throws IOException {
		String apkPackageName = ApkUtil.getAPKPackageName1(SystemConfig.getProjectBasePath() + appInfo.getPath());
		if (StringUtils.isNotBlank(apkPackageName)) {
			appInfo.setPackageName(apkPackageName);
			if (getLang() == 1) {
				appInfo.setAppNamee(appInfo.getAppName());
			}else if (getLang() == 2) {
				appInfo.setAppName(appInfo.getAppNamee());
			}
			appInfoService.save(appInfo);
		}
		return SUCCESS;
	}
	
	/**
	 * 修改
	 * @return
	 * @throws IOException 
	 */
	public String update() throws IOException {
		AppInfo old = appInfoService.findById(appInfo.getId());
		if (getLang() == 1) {
			old.setAppName(appInfo.getAppName());
		}else if (getLang() ==2) {
			old.setAppNamee(appInfo.getAppNamee());
		}
		
		old.setPackageName(appInfo.getPackageName());
		old.setKind(appInfo.getKind());
		old.setPosition(appInfo.getPosition());
       
		String oldIcon = null;
		String oldApk = null;
		if (StringUtils.isNotBlank(appInfo.getIcon())) {
			oldIcon = old.getIcon();
			old.setIcon(appInfo.getIcon());
		}
		if (StringUtils.isNotBlank(appInfo.getPath())) {
			String apkPackageName = ApkUtil.getAPKPackageName1(SystemConfig.getProjectBasePath() + appInfo.getPath());
			old.setPackageName(apkPackageName);
			
			oldApk = old.getPath();
			old.setPath(appInfo.getPath());
		}
		appInfoService.update(old);
		if (oldIcon != null) {
			new File(this.getProjectPath() + oldIcon).delete();
		}
		if (oldApk != null) {
			new File(this.getProjectPath() + oldApk).delete();
		}
		return SUCCESS;
	}

	/**
	 * 跳转到修改页面
	 * @return
	 */
	public String toUpdate() {
		appInfo = appInfoService.findById(id);
		return SUCCESS;
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String delete() {
		if (idList != null && !idList.isEmpty()) {
			appInfoService.deleteByIdList(idList);
		}
		return SUCCESS;
	}

	/**
	 * 分页查询
	 * @return
	 */
	public String findPage() {
		if(appInfo != null && appInfo.getCategory() != null) {
			this.setSessionAttr("curAppCategory", appInfo.getCategory());
		}
		if (appInfo == null) {
			appInfo = new AppInfo();
		}
		appInfo.setCategory((Integer)this.getSessionAttr("curAppCategory"));
		AppCategory category = appCategoryService.findById(appInfo.getCategory());
		this.setSessionAttr("categoryName", category.getName());
		this.pageBean = appInfoService.findPage(appInfo, pageNo, pageSize);
		return SUCCESS;
	}

	public Integer getId() {
		return id;
	}

	public void setId(Integer id) {
		this.id = id;
	}

	public List<Integer> getIdList() {
		return idList;
	}

	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}

	public AppInfo getAppInfo() {
		return appInfo;
	}

	public void setAppInfo(AppInfo appInfo) {
		this.appInfo = appInfo;
	}
}
