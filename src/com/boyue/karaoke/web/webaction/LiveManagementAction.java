package com.boyue.karaoke.web.webaction;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.web.BaseAction;
import com.boyue.karaoke.model.LiveManagement;
import com.boyue.karaoke.service.ILiveManagementService;
@SuppressWarnings({ "serial", "rawtypes" })
@Controller("LiveManagementAction")
@Scope(value = "prototype")
public class LiveManagementAction extends BaseAction{
	
	private Integer positionType;
	private LiveManagement model = new LiveManagement();
	private List<LiveManagement> liveManagementList;
	private List<Integer> idList;
	
	@Autowired
	private ILiveManagementService liveManagementService;

	/**
	 * @Name: home
	 * @Description: 显示直播管理首页信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-28（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到liveManagementList.jsp页面
	 */
	public String home(){
		this.pageBean = liveManagementService.findLiveManagementList(model,pageNo,pageSize);
		return "list";
	}
	/**
	 * @Name: add
	 * @Description: 添加直播管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-28（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到addLiveManagement.jsp.jsp页面
	 */
	public String add(){
		liveManagementList = liveManagementService.findLiveManagementList(model);
		return "add";
	}
	/**
	 * @Name: saveLiveMangement
	 * @Description: 保存直播管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-28（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到liveManagementList.jsp页面
	 */
	public String saveLiveMangement(){
		if(positionType == 0){
			model.setPosition(null);
		}
		liveManagementService.saveLiveManagement(model);
		return "redirectList";
	}
	/**
	 * @Name: delByIDs
	 * @Description: 根据ID删除直播管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-28（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到liveManagementList.jsp页面
	 */
	public String delByIDs(){
		liveManagementService.deleteLiveManagement(idList);
		return "redirectList";
	}
	/**
	 * @Name: edit
	 * @Description: 更新直播管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-28（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到editLiveManagement.jsp.jsp页面
	 */
	public String edit(){
		 model = liveManagementService.findLiveManagement(model.getId());
		 liveManagementList = liveManagementService.findLiveManagementList(model);
		return "edit";
	}
	/**
	 * @Name: updateLiveManagement
	 * @Description: 保存更新直播管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-28（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到liveManagementList.jsp页面
	 */
	public String updateLiveManagement(){
		if (positionType.intValue() == -1) {//-1:不改变顺序， 0：弄到最后一个， 1指定位置
			model.setPosition(null);
		} else if (positionType.intValue() == 0) {
			model.setPosition(0);
		}
		liveManagementService.updateLiveManagement(model);
		return "redirectList";
	}
	
	public ILiveManagementService getLiveManagementService() {
		return liveManagementService;
	}
	public void setLiveManagementService(
			ILiveManagementService liveManagementService) {
		this.liveManagementService = liveManagementService;
	}
	public LiveManagement getModel() {
		return model;
	}
	public void setModel(LiveManagement model) {
		this.model = model;
	}
	public Integer getPositionType() {
		return positionType;
	}
	public void setPositionType(Integer positionType) {
		this.positionType = positionType;
	}
	public List<LiveManagement> getLiveManagementList() {
		return liveManagementList;
	}
	public void setLiveManagementList(List<LiveManagement> liveManagementList) {
		this.liveManagementList = liveManagementList;
	}
	public List<Integer> getIdList() {
		return idList;
	}
	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}
}
