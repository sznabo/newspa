package com.boyue.karaoke.web.webaction;

import java.util.List;





import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.karaoke.model.TerminalMenu;
import com.boyue.karaoke.model.TerminalSubMenu;
import com.boyue.karaoke.service.TerminalMenuService;
import com.boyue.karaoke.service.TerminalSubMenuService;
import com.boyue.karaoke.web.DefaultBaseAction;
import com.opensymphony.xwork2.ActionContext;


@Controller("TerminalSubMenuAction")
@Scope(value = "prototype")
public class TerminalSubMenuAction extends DefaultBaseAction<TerminalSubMenu>{
	/**
	 * 
	 */
	private static final long serialVersionUID = 1L;

	@Autowired
	private TerminalSubMenuService terminalSubMenuService;
	
	@Autowired
	private TerminalMenuService terminalMenuService;

	private TerminalSubMenu model;
	private List<Integer> idList;
	private List<String> checkidList;
	private Integer showFlag;
	private Boolean firstFlag;
	
	public String findPage() {
		
		if (model != null) {
			if (model.getMenuId() != null) {
				ActionContext.getContext().getSession().put("menu", terminalMenuService.findById(model.getMenuId()));
				model.setMenuId(((TerminalMenu)ActionContext.getContext().getSession().get("menu")).getId());
			}
		}
		this.pageBean = terminalSubMenuService.findPage(model, pageNo, pageSize);
		return SUCCESS;
	}
	
	
	public String updateStatu() {
		terminalSubMenuService.updateStatu(model.getId());
		
		return SUCCESS;
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
	
	public TerminalSubMenu getModel() {
		return model;
	}


	public void setModel(TerminalSubMenu model) {
		this.model = model;
	}
	
	
}
