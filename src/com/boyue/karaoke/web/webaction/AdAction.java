package com.boyue.karaoke.web.webaction;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.web.Response;
import com.boyue.karaoke.model.Ad;
import com.boyue.karaoke.service.AdService;
import com.boyue.karaoke.web.DefaultBaseAction;

/**
 *
 * @author ben
 * @date   2014-7-1 上午9:57:28
 *
 */
@SuppressWarnings("serial")
@Controller("AdAction")
@Scope(value = "prototype")
public class AdAction extends DefaultBaseAction<Ad> {

	@Autowired
	private AdService adService;
	
	private List<Integer> contentTypeList;
	private List<Integer> categoryList;
	private Ad ad;
	private List<Ad> adList;
	private List<Integer> idList;
	private List<String> checkidList;
	private Integer showFlag;
	private Boolean firstFlag;

	public String toUpdate() {
		this.ad = adService.findById(ad.getId());
		return SUCCESS;
	}
	
	public String update() {
		Ad old = this.adService.findById(ad.getId());
		old.setContentType(ad.getContentType());
		adService.update(old);
		return SUCCESS;
	}
	/**
	 * @Name: findPage
	 * @Description: 显示广告管理首页信息
	 * @Author:
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-10（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到liveManagementList.jsp页面
	 */
	public String findPage() {
		if (ad == null) {
			ad = new Ad();
		}
		if(firstFlag != null && firstFlag == true){
			this.setSessionAttr("showFlag", showFlag);
		}
		if(Integer.parseInt(this.getSessionAttr("showFlag").toString()) == 1){
			ad.setCategory(Ad.AD);
		}else if(Integer.parseInt(this.getSessionAttr("showFlag").toString()) == 2){
			ad.setCategory(Ad.VOD_AD);
		}else if(Integer.parseInt(this.getSessionAttr("showFlag").toString()) == 3){
			ad.setCategory(Ad.INTRO_CONTENT);
		}else if(Integer.parseInt(this.getSessionAttr("showFlag").toString()) == 4){
			ad.setCategory(Ad.EXPENSE);
		}
		this.pageBean = adService.findPage(ad, pageNo, pageSize);
		return SUCCESS;
	}
	/**
	 * @Name: add
	 * @Description: 增加广告管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-10（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到addAd.jsp页面
	 */
	public String add(){
		this.showFlag = Integer.parseInt(this.getSessionAttr("showFlag").toString());
		return SUCCESS;
	}
	/**
	 * @Name: saveAd
	 * @Description: 保存广告管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-10（创建日期）
	 * @Parameters: 无
	 * @Return: String 重定向到list.jsp页面
	 */
	public String saveAd(){
		if(showFlag == 2){
			ad.setContentType(Ad.VIDEO);
			ad.setCategory(Ad.VOD_AD);
		}else if(showFlag == 3){
			ad.setCategory(Ad.INTRO_CONTENT);
		}else if(showFlag == 4){
			ad.setCategory(Ad.EXPENSE);
		}
		this.adService.saveAd(ad);
		return this.findPage();
	}
	/**
	 * @Name: edit
	 * @Description: 编辑广告管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-10（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到editAd.jsp页面
	 */
	public String edit(){
		this.showFlag = Integer.parseInt(this.getSessionAttr("showFlag").toString());
		this.ad = this.adService.findById(ad.getId());
		return SUCCESS;
	}
	/**
	 * @Name: updateAd
	 * @Description: 更新广告管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-10（创建日期）
	 * @Parameters: 无
	 * @Return: String 重定向到list.jsp页面
	 */
	public String updateAd(){
		if(showFlag == 2){
			ad.setContentType(Ad.VIDEO);
			ad.setCategory(Ad.VOD_AD);
		}else if(showFlag == 3){
			ad.setCategory(Ad.INTRO_CONTENT);
		}
		this.adService.updateAd(ad);
		return SUCCESS;
	}
	/**
	 * @Name: delByIDs
	 * @Description: 根据ID或ID集合删除广告管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-10（创建日期）
	 * @Parameters: 无
	 * @Return: String 重定向到list.jsp页面
	 */
	public String delByIDs(){
		this.adService.delByIDs(idList,Integer.parseInt(this.getSessionAttr("showFlag").toString()));
		return SUCCESS;
	}
	
	
	/**
	 * @Name: checkIsAd
	 * @Description: 查询是否有所属栏目是广告
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-11（创建日期）
	 * @Parameters: 无
	 * @Return: String 返回JOSON格式数据
	 */
	@SuppressWarnings({ "unchecked", "static-access"})
	public String checkIsAd(){
		List<Ad> pgList = new ArrayList<Ad>();
		//查询是否有所属栏目是广告
		this.isAd(pgList);
		this.ajaxResponse = new Response<Boolean>();
		if(pgList == null || pgList.isEmpty()){
			this.ajaxResponse.setMsgBody(true);
		}else{
			this.ajaxResponse.setMsgBody(false);
		}
		return this.JSON_RESULT;
	}

	private void isAd(List<Ad> pgList) {
		if(checkidList != null && !checkidList.isEmpty()){
			String idStr = new String(new StringBuffer().append(checkidList));
			String newIdStr = idStr.substring(1, idStr.length()-1);
			String [] ids = newIdStr.split(",");
			Ad a = null;
			if(ids != null && ids.length >= 1){
				for(String vcid : ids){
					a = this.adService.findById(Integer.parseInt(vcid));
					if(a != null && a.getCategory() == 1){
						pgList.add(a);
					}
				}
			}
		}
	}
	public Ad getAd() {
		return ad;
	}

	public void setAd(Ad ad) {
		this.ad = ad;
	}

	public List<Integer> getContentTypeList() {
		return contentTypeList;
	}

	public void setContentTypeList(List<Integer> contentTypeList) {
		this.contentTypeList = contentTypeList;
	}

	public List<Integer> getCategoryList() {
		return categoryList;
	}

	public void setCategoryList(List<Integer> categoryList) {
		this.categoryList = categoryList;
	}
	public List<Ad> getAdList() {
		return adList;
	}

	public void setAdList(List<Ad> adList) {
		this.adList = adList;
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
}
