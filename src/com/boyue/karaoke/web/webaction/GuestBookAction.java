package com.boyue.karaoke.web.webaction;

import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.web.BaseAction;
import com.boyue.karaoke.model.GuestBook;
import com.boyue.karaoke.service.IGuestBookService;
@SuppressWarnings({ "serial", "rawtypes" })
@Controller("GuestBookAction")
@Scope(value = "prototype")
public class GuestBookAction extends BaseAction {
	
	private GuestBook model = new GuestBook();
	private List<Integer> idList;
	private Date startTime;
	private Date endTime;
	
	@Autowired
	private IGuestBookService guestBookService;

	/**
	 * @Name: home
	 * @Description: 显示留言管理首页信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-30（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到guestBookList.jsp页面
	 */
	public String home(){		
		this.pageBean = guestBookService.findLiveManagementList(model,pageNo,pageSize,startTime,endTime);
		return "list";
	}
	/**
	 * @Name: delByIDs
	 * @Description: 根据ID删除留言管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-30（创建日期）
	 * @Parameters: 无
	 * @Return: String 重定向到guestBookList.jsp页面
	 */
	public String delByIDs(){
		guestBookService.deleteGuestBookByID(idList);
		return "redirectList";
	}
	/**
	 * @Name: view
	 * @Description: 查看留言管理信息详情
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-30（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到viewGuestBook.jsp页面
	 */
	public String view(){
		model = guestBookService.findGuestBookByID(model.getId());
		return "view";
	}
	public GuestBook getModel() {
		return model;
	}
	public void setModel(GuestBook model) {
		this.model = model;
	}
	public IGuestBookService getGuestBookService() {
		return guestBookService;
	}
	public void setGuestBookService(IGuestBookService guestBookService) {
		this.guestBookService = guestBookService;
	}
	public List<Integer> getIdList() {
		return idList;
	}
	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}
	public Date getStartTime() {
		return startTime;
	}
	public void setStartTime(Date startTime) {
		this.startTime = startTime;
	}
	public Date getEndTime() {
		return endTime;
	}
	public void setEndTime(Date endTime) {
		this.endTime = endTime;
	}
	
}
