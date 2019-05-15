package com.boyue.karaoke.web.webaction;

import java.io.File;
import java.util.List;

import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.web.BaseAction;
import com.boyue.karaoke.model.Ad;
import com.boyue.karaoke.model.AdDetail;
import com.boyue.karaoke.service.AdDetailService;
import com.boyue.karaoke.service.AdService;

/**
 *
 * @author ben
 * @date   2014-7-1 下午4:00:57
 *
 */
@Controller("AdDetailAction")
@Scope(value = "prototype")
public class AdDetailAction extends BaseAction<AdDetail>{

	@Autowired
	private AdDetailService adDetailService;
	@Autowired
	private AdService adService;
	private Integer showFlag;
	private Integer category;
	
	//页面传过来的id 列表
	private List<Integer> idList;
	
	private AdDetail adDetail;
	private Ad ad;
	private Integer adid;
	/**
	 * 进入增加页面
	 * @return
	 */
	public String toAdd() {
//		this.setSessionAttr("curAd",adService.findById(ad.getId()));
		this.getSessionAttr("curAd");
		return SUCCESS;
	}
	
	/**
	 * 增加
	 * @return
	 */
	public String save() {
		adDetail.setAdid(getCurAdId());
		adDetailService.save(adDetail);
//		this.setSessionAttr("curAd",adService.findById(ad.getId()));
		return SUCCESS;
	}
	
	public String updateContentType() {
		Ad old = this.adService.findById(ad.getId());
		old.setContentType(ad.getContentType());
		adService.update(old);
		this.setSessionAttr("curAd",adService.findById(ad.getId()));
		return SUCCESS;
	}
	
	/**
	 * 修改
	 * @return
	 */
	public String update() {
		AdDetail old = adDetailService.findById(adDetail.getId());
		old.setName(adDetail.getName());
		old.setPosition(adDetail.getPosition());
		String oldFile = null;
		if (StringUtils.isNotBlank(adDetail.getPath())) {
			oldFile = old.getPath();
			old.setPath(adDetail.getPath());
		}
		old.setInter(adDetail.getInter());
		adDetailService.update(old);
		if (oldFile != null) {
			new File(oldFile).delete();
		}
		return SUCCESS;
	}

	/**
	 * 跳转到修改页面
	 * @return
	 */
	public String toUpdate() {
		this.adDetail = adDetailService.findById(adDetail.getId());
	//	System.out.println(adid);
		this.getSessionAttr("curAd");
		return SUCCESS;
	}
	
	/**
	 * 删除
	 * @return
	 */
	public String delete() {
		if (idList != null && !idList.isEmpty()) {
			List<AdDetail> list = adDetailService.findByIdList(idList);
			adDetailService.deleteByIdList(idList);
			for (AdDetail a : list) {
				new File(this.getProjectPath() + a.getPath()).delete();
			}
		}
		return SUCCESS;
	}

	private int getCurAdId() {
		return (Integer) this.getSessionAttr("curAdId");
	}
	
	/**
	 * 分页查询
	 * @return
	 */
	public String findPage() {
		if(adDetail != null && adDetail.getAdid() != null) {
			this.setSessionAttr("curAdId", adDetail.getAdid());
			this.setSessionAttr("curAd",adService.findById(adDetail.getAdid()));
		}
		if (adDetail == null) {
			adDetail = new AdDetail();
		}
		adDetail.setAdid(getCurAdId());
//		this.setSessionAttr("showFlag", showFlag);
		this.pageBean = adDetailService.findPage(adDetail, pageNo, 4);
		if(category != null){
			this.setSessionAttr("cate", category);
		}
		return SUCCESS;
	}

	public List<Integer> getIdList() {
		return idList;
	}

	public void setIdList(List<Integer> idList) {
		this.idList = idList;
	}

	public AdDetail getAdDetail() {
		return adDetail;
	}

	public void setAdDetail(AdDetail adDetail) {
		this.adDetail = adDetail;
	}

	public Ad getAd() {
		return ad;
	}

	public void setAd(Ad ad) {
		this.ad = ad;
	}

	public Integer getShowFlag() {
		return showFlag;
	}

	public void setShowFlag(Integer showFlag) {
		this.showFlag = showFlag;
	}

	public Integer getCategory() {
		return category;
	}

	public void setCategory(Integer category) {
		this.category = category;
	}

	public Integer getAdid() {
		return adid;
	}

	public void setAdid(Integer adid) {
		this.adid = adid;
	}
	
	
	
}
