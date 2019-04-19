package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.common.Constants;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.model.LiveApk;
import com.boyue.karaoke.service.LiveApkService;
import com.boyue.karaoke.util.ApkUtil;
import com.boyue.karaoke.web.DefaultBaseAction;

@Controller("LiveApkAction")
@Scope(value = "prototype")
public class LiveApkAction extends DefaultBaseAction<LiveApk> {

	/**
	 * 
	 */
	private static final long serialVersionUID = -2940036538692300634L;

	@Autowired
	private LiveApkService liveApkService;
	
	private LiveApk model;

	private File apk;
	
	private String apkFileName;
	
	private String errMsg;
	public String list(){
		model = liveApkService.findApk();
		return SUCCESS;
	}
	
	public String update(){
		
		if (apk != null) {
			try {
				model.setPath(setImgPath(apk, Constants.LIVE_APP, apkFileName));
				model.setPackName(ApkUtil.getAPKPackageName1(SystemConfig.getProjectBasePath() + model.getPath()));
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		liveApkService.updateApk(model);
		errMsg = "更改成功";
		return SUCCESS;
	}

	public File getApk() {
		return apk;
	}

	public void setApk(File apk) {
		this.apk = apk;
	}

	public String getApkFileName() {
		return apkFileName;
	}

	public void setApkFileName(String apkFileName) {
		this.apkFileName = apkFileName;
	}

	public LiveApk getModel() {
		return model;
	}

	public void setModel(LiveApk model) {
		this.model = model;
	}

	private String getProjectBasePath() {
		String path = this.getClass().getProtectionDomain().getCodeSource().getLocation().getPath();
		if (path.startsWith("/")) {// /D:/eclipseprojcet201310/adserver/WebRoot/去掉开头的 / ,windows下
			path = path.substring(1);
		}
		int index = path.indexOf("WEB-INF/classes/");
		return path.substring(0, index);
	}
	
	private String setImgPath(File img,String ImgPath,String imgFileName) throws IOException {
		String imgType = imgFileName.substring(imgFileName.lastIndexOf("."));
		String imgName = new Date().getTime()+imgType;
		String imgPathReal  = ImgPath +imgName;		
		FileUtils.copyFile(img, new File(ServletActionContext.getServletContext().getRealPath("/") + imgPathReal));
		return imgPathReal;
	}

	public String getErrMsg() {
		return errMsg;
	}

	public void setErrMsg(String errMsg) {
		this.errMsg = errMsg;
	}

	
}
