package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.io.IOException;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.RequestAware;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.common.Constants;
import com.boyue.karaoke.model.TemlCfg;
import com.boyue.karaoke.service.TemlCfgService;
import com.boyue.karaoke.web.DefaultBaseAction;
@Controller("BackImgAction")
@Scope(value = "prototype")
public class BackImgAction extends DefaultBaseAction<TemlCfg>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;
	@Autowired
	private TemlCfgService temlCfgService;
	
	private TemlCfg back;
	private TemlCfg logo;
	private TemlCfg volume;
	private File logo_img;
	private String logo_imgFileName;
	private File back_img;
	private String back_imgFileName;
	
	
	public String list(){
		back = temlCfgService.findByKey(Constants.TEML_BACK_IMG);
		logo = temlCfgService.findByKey(Constants.TEML_LOGO);
		volume = temlCfgService.findByKey(Constants.TEML_VOLUME);
		return SUCCESS;
	}
	
	public String update() {
		back = new TemlCfg();
		logo = new TemlCfg();
		volume.setKey(Constants.TEML_VOLUME);
		volume.setDesc("终端音量");
		back.setKey(Constants.TEML_BACK_IMG);
		back.setDesc("终端背景图片");
		logo.setKey(Constants.TEML_LOGO);
		logo.setDesc("终端桌面logo");
		
		if (back_img != null) {
			try {
				back.setValue(setImgPath(back_img, Constants.BACK_IMG_PATH, back_imgFileName));
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		
		if (logo_img != null) {
			try {
				logo.setValue(setImgPath(logo_img, Constants.TEML_LOGO, logo_imgFileName));
			} catch (IOException e) {
				
				e.printStackTrace();
			}
		}
		
		temlCfgService.update(back);
		temlCfgService.update(logo);
		temlCfgService.update(volume);
		return SUCCESS;
	}
	
	private String setImgPath(File img,String ImgPath,String imgFileName) throws IOException {
		String imgType = imgFileName.substring(imgFileName.lastIndexOf("."));
		String imgName = new Date().getTime()+imgType;
		String imgPathReal  = ImgPath +imgName;		
		FileUtils.copyFile(img, new File(ServletActionContext.getServletContext().getRealPath("/") + imgPathReal));
		return imgPathReal;
	}
	

	public File getLogo_img() {
		return logo_img;
	}

	public void setLogo_img(File logo_img) {
		this.logo_img = logo_img;
	}

	public String getLogo_imgFileName() {
		return logo_imgFileName;
	}

	public void setLogo_imgFileName(String logo_imgFileName) {
		this.logo_imgFileName = logo_imgFileName;
	}

	public String getBack_imgFileName() {
		return back_imgFileName;
	}

	public void setBack_imgFileName(String back_imgFileName) {
		this.back_imgFileName = back_imgFileName;
	}

	public TemlCfg getLogo() {
		return logo;
	}

	public void setLogo(TemlCfg logo) {
		this.logo = logo;
	}
	
	
	public TemlCfg getBack() {
		return back;
	}

	public void setBack(TemlCfg back) {
		this.back = back;
	}

	public File getBack_img() {
		return back_img;
	}

	public void setBack_img(File back_img) {
		this.back_img = back_img;
	}

	public TemlCfg getVolume() {
		return volume;
	}

	public void setVolume(TemlCfg volume) {
		this.volume = volume;
	}

}


