package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.io.IOException;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.common.Constants;
import com.boyue.karaoke.model.TerminalMenu;
import com.boyue.karaoke.service.TerminalMenuService;
import com.boyue.karaoke.web.DefaultBaseAction;
import com.opensymphony.xwork2.ActionContext;

@Controller("TerminalMenuAction")
@Scope(value = "prototype")
public class TerminalMenuAction extends DefaultBaseAction<TerminalMenu>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private TerminalMenuService terminalMenuService;
	
	private File img;
	private File logo_img;
	private String logo_imgFileName;
	private TerminalMenu terminalMenu;
	private List<Integer> idList;
	private List<String> checkidList;
	private Integer showFlag;
	private Boolean firstFlag;
	
	public String findPage() {
		TerminalMenu terminalMenu = new TerminalMenu();
		this.pageBean = terminalMenuService.findPage(terminalMenu, pageNo, pageSize);
		return SUCCESS;
	}
	
	
	public String updateStatu() {
		terminalMenuService.updateStatu(terminalMenu.getId());
		return SUCCESS;
	}
	
	//修改排版名称
	public String update() {
		TerminalMenu oldMenu = terminalMenuService.findById(terminalMenu.getId());
		try {
			if (logo_img != null) {
				terminalMenu.setLogoUrl(setImgPath(logo_img, Constants.MENU_LOGO_PATH, logo_imgFileName));
			}else {
				terminalMenu.setLogoUrl(oldMenu.getLogoUrl());
			}
		} catch (IOException e) {
			e.printStackTrace();
		}
		if (getLang() == 1) {  //中文
			terminalMenu.setNamee(oldMenu.getNamee());
		}else if (getLang() == 2) {   //英文
			terminalMenu.setName(oldMenu.getName());
		}
		terminalMenuService.update(terminalMenu);
		return SUCCESS;
	}
	
	public String toUpdate() {
		TerminalMenu menu = terminalMenuService.findById(terminalMenu.getId());
		ActionContext.getContext().getSession().put("model", menu);
		return SUCCESS;
	}


	public TerminalMenu getTerminalMenu() {
		return terminalMenu;
	}

	public void setTerminalMenu(TerminalMenu terminalMenu) {
		this.terminalMenu = terminalMenu;
	}


	public List<Integer> getIdList() {
		return idList;
	}

	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}

	public List<String> getCheckidList() {
		return checkidList;
	}

	public void setCheckidList(List<String> checkidList) {
		this.checkidList = checkidList;
	}

	public Integer getShowFlag() {
		return showFlag;
	}

	public void setShowFlag(Integer showFlag) {
		this.showFlag = showFlag;
	}

	public Boolean getFirstFlag() {
		return firstFlag;
	}

	public void setFirstFlag(Boolean firstFlag) {
		this.firstFlag = firstFlag;
	}




	public TerminalMenuService getTerminalMenuService() {
		return terminalMenuService;
	}




	public void setTerminalMenuService(TerminalMenuService terminalMenuService) {
		this.terminalMenuService = terminalMenuService;
	}


	public File getImg() {
		return img;
	}


	public void setImg(File img) {
		this.img = img;
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
	
	
	
	private String setImgPath(File img,String ImgPath,String imgFileName) throws IOException {
		String imgType = imgFileName.substring(imgFileName.lastIndexOf("."));
		String imgName = new Date().getTime()+imgType;
		String imgPathReal  = ImgPath +imgName;		
		FileUtils.copyFile(img, new File(ServletActionContext.getServletContext().getRealPath("/") + imgPathReal));
		return imgPathReal;
	}
	
	
}
