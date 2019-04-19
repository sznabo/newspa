package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.web.BaseAction;
import com.boyue.karaoke.model.Ad;
import com.boyue.karaoke.model.AdDetail;
import com.boyue.karaoke.model.ShopIntroduce;
import com.boyue.karaoke.service.AdDetailService;
import com.boyue.karaoke.service.AdService;
import com.boyue.karaoke.service.IShopIntroduceService;
@Controller("ShopIntroduceAction")
@Scope(value = "prototype")
@SuppressWarnings("serial")
public class ShopIntroduceAction extends BaseAction<ShopIntroduce> {
	
	private ShopIntroduce model = new ShopIntroduce();
	private Ad ad = new Ad();
	private AdDetail adDetail = new AdDetail();
	private File img;
	private File logo_img;
	private String logo_imgFileName;
	private List<Integer> idList;
	private List<Ad> adList;
	private Integer redirectLv;
	private Integer queryLv;
	private Integer positionType;
	private List<ShopIntroduce> shopintroducelist;
	private List<AdDetail> adDetailList = new ArrayList<AdDetail>();
	private Integer viewFlag;
	private Integer shigongcanbaFlag = 0;
	private Integer newFalg = 0;
	
	@Autowired
	private IShopIntroduceService shopIntroduceService;
	@Autowired
	private AdService adService;
	@Autowired
	private AdDetailService adDetailService;
	
	/**
	 * @Name: home
	 * @Description: 显示本店介绍首页信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-01（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到shopIntroduceList.jsp页面
	 * @throws Exception 有异常抛出
	 */
	public String home()throws Exception{
		if(model.getLv() != null){
			this.setSessionAttr("lv", model.getLv());
		} else {
			model.setLv(Integer.valueOf(this.getSessionAttr("lv").toString()));
		}
		
		if(model.getParentID() != null){
			this.setSessionAttr("lv2id", model.getParentID());
		} else if (this.getSessionAttr("lv2id") != null){
			model.setParentID((Integer)this.getSessionAttr("lv2id"));
		}
		
	
		this.pageBean = shopIntroduceService.findShopIntroduceList(model,pageNo,4);
		shopintroducelist = this.pageBean.getElements();
		int count = 0 ;
		if(shopintroducelist != null && !shopintroducelist.isEmpty()){
			for(ShopIntroduce  si : shopintroducelist){
				if(si.getShigongcanba() != null && si.getShigongcanba() == 1){
					count ++;
				}else{
					
				}
			}
		}
		if(count == 4){
			this.shigongcanbaFlag = 1;
			this.setSessionAttr("shigongcanbaFlag", shigongcanbaFlag);
		}else{
			this.shigongcanbaFlag = 0;
			this.setSessionAttr("shigongcanbaFlag", shigongcanbaFlag);
		}
		List<ShopIntroduce> siList = this.pageBean.getElements();
		if(siList != null && !siList.isEmpty()){
			for(ShopIntroduce s : siList){
				if(s.getAdid() != null){
					Ad a = this.adService.findAdByIntroAdId(s.getAdid());
					s.setAd(a);
				}
			}
		}
		return "list";
	}
	/**
	 * @Name: add
	 * @Description: 增加本店介绍信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-01（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到addShopIntroduce.jsp页面
	 */
	public String add(){
		if(model.getLv() == 2){
			model.setParentID(Integer.parseInt(this.getSessionAttr("lv2id").toString()));
			shopintroducelist = this.shopIntroduceService.findShopIntroduceByParentID(Integer.parseInt(this.getSessionAttr("lv2id").toString()),model.getLv(),model.getId());
		}
		if(model.getLv() == 1){
			shopintroducelist = this.shopIntroduceService.findShopIntroduce(model.getLv(),model.getId());
		}
		this.adList = this.adService.findAdListByIntro(Ad.INTRO_CONTENT);
		return "add";
	}
	/**
	 * @Name: saveShopIntroduce
	 * @Description: 保存本店介绍信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-01（创建日期）
	 * @Parameters: 无
	 * @Return: String 重定向到shopIntroduceList.jsp页面
	 * @throws Exception 有异常抛出
	 */
	public String saveShopIntroduce() throws Exception{
		if(model.getLv() != null){
			if(model.getLv() == 1){
				model.setParentID(null);
			}
			if(model.getLv() == 2){
				model.setParentID(Integer.parseInt(this.getSessionAttr("lv2id").toString()));
			}
		}
		//保存图片路径至数据库
//		model.setVoidprogramimg(imgPath);
		if (positionType == 0) {//表示默认顺延到最后一个位置
			model.setPosition(null);
		}
		if (getLang() == 1) {
			model.setNamee(model.getName());
			model.setDescriptione(model.getDescription());
		}else if (getLang() == 2) {
			model.setName(model.getNamee());
			model.setDescription(model.getDescriptione());
		}
		shopIntroduceService.saveShopIntroduce(model,logo_img,logo_imgFileName);
		return "redirectList";
	}
	/**
	 * @Name: edit
	 * @Description: 更新本店介绍信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-01（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到editShopIntroduce.jsp页面
	 */
	public String edit(){
		if(Integer.parseInt(this.getSessionAttr("lv").toString()) == 1){
			shopintroducelist = this.shopIntroduceService.findShopIntroduce(Integer.parseInt(this.getSessionAttr("lv").toString()),model.getId());
		}
		else if(this.getSessionAttr("lv2id") != null){
			model.setParentID(Integer.parseInt(this.getSessionAttr("lv2id").toString()));
			shopintroducelist = this.shopIntroduceService.findShopIntroduceByParentID(Integer.parseInt(this.getSessionAttr("lv2id").toString()),2,model.getId());
		}
		//
		if(model.getId() == 1 || model.getId() == 2 || model.getId() == 3 || model.getId() == 4){
			this.newFalg = 1;
			this.setSessionAttr("newFalg", newFalg);
		}else{
			this.newFalg = 0;
			this.setSessionAttr("newFalg", newFalg);
		}
		model = shopIntroduceService.findShopIntroduceByID(model.getId());
		this.adList = this.adService.findAdListByIntro(Ad.INTRO_CONTENT);
		return "edit";
	}
	/**
	 * @Name: updateShopIntroduce
	 * @Description: 保存更新本店介绍信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-01（创建日期）
	 * @Parameters: 无
	 * @Return: String 重定向到shopIntroduceList.jsp页面
	 */
	public String updateShopIntroduce()throws Exception{
		ShopIntroduce old = shopIntroduceService.findShopIntroduceByID(model.getId());
//		if(model.getLv() != null){
			if(Integer.parseInt(this.getSessionAttr("lv").toString()) == 1){
				model.setParentID(null);
			}
			if(Integer.parseInt(this.getSessionAttr("lv").toString()) == 2){
				model.setParentID(Integer.parseInt(this.getSessionAttr("lv2id").toString()));
			}
//		}
		if (positionType.intValue() == -1) {//-1:不改变顺序， 0：弄到最后一个， 1指定位置
			model.setPosition(null);
		} else if (positionType.intValue() == 0) {
			model.setPosition(0);
		}
		if (getLang() == 1) {
			model.setNamee(old.getNamee());
			model.setDescriptione(old.getDescriptione());
		}else if (getLang() == 2) {
			model.setName(old.getName());
			model.setDescription(old.getDescription());
		}
		shopIntroduceService.updateShopIntroduce(model,img,logo_img,logo_imgFileName);
		return "redirectList";
	}
	/**
	 * @Name: delByIDs
	 * @Description: 根据ID或ID集合删除本店介绍信息
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-01（创建日期）
	 * @Parameters: 无
	 * @Return: String 重定向到shopIntroduceList.jsp页面
	 */
	public String delByIDs(){
		shopIntroduceService.delByIDs(idList);
		return "redirectList";
	}
	
	/**
	 * @Name: viewIntroduce
	 * @Description: 预览本店介绍信息，由图片和文字组成
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-01（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到viewShopIntroduce.jsp页面
	 */
	public String viewIntroduce(){
		if(this.getSessionAttr("lv2id") != null){
			model = shopIntroduceService.findShopIntroduceByID(model.getId());
			//获取广告中的内容类型：内容类型:1图片,2视频，3 flash
//			List<AdDetail> addetailList = null;
			Integer ct = null;
			if(model.getAdid() != null){
				this.ad = this.adService.findById(model.getAdid());
				ct = ad.getContentType();
				//获取广告明细中的图片路径
				adDetailList = this.adDetailService.findByAd(ad.getId());
			}
			//用于设定标志，到底是单个图片、多个图片、视频、FLASH还是无
			this.setFlag(ct);
		}
		return "viewIntroduce";
	}
	private void setFlag(Integer ct) {
		if(adDetailList != null && !adDetailList.isEmpty()){
			//如果是单个图片
			if(adDetailList.size() == 1 && ct == 1){
				adDetail =  adDetailList.get(0);
				this.viewFlag = 1;
				this.setSessionAttr("viewFlag", viewFlag);
			//如果是多个图片
			}else if(adDetailList.size() > 1 && ct == 1){
				this.viewFlag = 2;
				this.setSessionAttr("viewFlag", viewFlag);
			//如果是视频
			}else if(adDetailList.size() >= 1 && ct == 2){
				this.viewFlag = 3;
				this.setSessionAttr("viewFlag", viewFlag);
			//如果是flash
			}else if(adDetailList.size() >= 1 && ct == 3){
				this.viewFlag = 4;
				this.setSessionAttr("viewFlag", viewFlag);
			}
		}else{
			this.viewFlag = 0;
			this.setSessionAttr("viewFlag", viewFlag);
		}
	}
	/**
	 * @Name: viewShiYiTu
	 * @Description: 终端与后台图片对应的示意图
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-11-13（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到viewShiYiTuShopIntroduce.jsp页面
	 */
	public String viewShiYiTu(){
		if(model.getLv() == 2){
			model.setParentID(Integer.parseInt(this.getSessionAttr("lv2id").toString()));
		}
		
		this.pageBean = shopIntroduceService.findShopIntroduceList(model,pageNo,6);
		
		return "shiyitu";
	}
	public String sendLv(){
		this.model.setLv(queryLv);
		return "";
	}
	public IShopIntroduceService getShopIntroduceService() {
		return shopIntroduceService;
	}
	public void setShopIntroduceService(IShopIntroduceService shopIntroduceService) {
		this.shopIntroduceService = shopIntroduceService;
	}
	public ShopIntroduce getModel() {
		return model;
	}
	public void setModel(ShopIntroduce model) {
		this.model = model;
	}
	public File getImg() {
		return img;
	}
	public void setImg(File img) {
		this.img = img;
	}
	public String getLogo_imgFileName() {
		return logo_imgFileName;
	}
	public AdDetail getAdDetail() {
		return adDetail;
	}
	public void setAdDetail(AdDetail adDetail) {
		this.adDetail = adDetail;
	}
	public void setLogo_imgFileName(String logo_imgFileName) {
		this.logo_imgFileName = logo_imgFileName;
	}
	public List<Integer> getIdList() {
		return idList;
	}
	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}
	public File getLogo_img() {
		return logo_img;
	}
	public void setLogo_img(File logo_img) {
		this.logo_img = logo_img;
	}
	public Ad getAd() {
		return ad;
	}
	public void setAd(Ad ad) {
		this.ad = ad;
	}
	public List<Ad> getAdList() {
		return adList;
	}
	public void setAdList(List<Ad> adList) {
		this.adList = adList;
	}
	public Integer getRedirectLv() {
		return redirectLv;
	}
	public void setRedirectLv(Integer redirectLv) {
		this.redirectLv = redirectLv;
	}
	public Integer getQueryLv() {
		return queryLv;
	}
	public void setQueryLv(Integer queryLv) {
		this.queryLv = queryLv;
	}
	public Integer getPositionType() {
		return positionType;
	}
	public void setPositionType(Integer positionType) {
		this.positionType = positionType;
	}
	public List<ShopIntroduce> getShopintroducelist() {
		return shopintroducelist;
	}
	public void setShopintroducelist(List<ShopIntroduce> shopintroducelist) {
		this.shopintroducelist = shopintroducelist;
	}
	public List<AdDetail> getAdDetailList() {
		return adDetailList;
	}
	public void setAdDetailList(List<AdDetail> adDetailList) {
		this.adDetailList = adDetailList;
	}
	public Integer getViewFlag() {
		return viewFlag;
	}
	public void setViewFlag(Integer viewFlag) {
		this.viewFlag = viewFlag;
	}
	public Integer getNewFalg() {
		return newFalg;
	}
	public void setNewFalg(Integer newFalg) {
		this.newFalg = newFalg;
	}
	public Integer getShigongcanbaFlag() {
		return shigongcanbaFlag;
	}
	public void setShigongcanbaFlag(Integer shigongcanbaFlag) {
		this.shigongcanbaFlag = shigongcanbaFlag;
	}
	
}
