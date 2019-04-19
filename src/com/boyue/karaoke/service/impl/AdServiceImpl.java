package com.boyue.karaoke.service.impl;

import java.io.File;
import java.util.Calendar;
import java.util.List;

import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.dao.AdDAO;
import com.boyue.karaoke.dao.AdDetailDAO;
import com.boyue.karaoke.dao.IShopIntroduceDAO;
import com.boyue.karaoke.dao.IVodProgramDAO;
import com.boyue.karaoke.model.Ad;
import com.boyue.karaoke.model.AdDetail;
import com.boyue.karaoke.model.Message;
import com.boyue.karaoke.model.ShopIntroduce;
import com.boyue.karaoke.service.AdService;
import com.boyue.spa.domain.Vodprogram;

/**
 *
 * @author ben
 * @date   2014-7-1 上午9:53:06
 *
 */
@Service
public class AdServiceImpl implements AdService {

	@Autowired
	private AdDAO adDAO;
	@Autowired
	private AdDetailDAO adDetailDAO;
	@Autowired
	private IShopIntroduceDAO shopIntroduceDAO;
	@Autowired
	private IVodProgramDAO vodProgramDAO;
	
	@Override
	public Ad findById(Integer id) {
		return adDAO.findById(id);
	}

	@Override
	public void update(Ad old) {
		adDAO.update(old);
	}

	@Override
	public PageBean<Ad> findPage(Ad ad, int pageNo, int pageSize) {
		return adDAO.findPage(ad, pageNo, pageSize);
	}

	@Override
	public List<Ad> findAll() {
		return adDAO.findAll();
	}
	/**
	 * @Name: saveAd
	 * @Description: 保存广告管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-11（创建日期）
	 * @Parameters: Ad ad 广告管理对象
	 * @Return: 无
	 */
	@Override
	public void saveAd(Ad ad) {
		// TODO Auto-generated method stub
		ad.setPosition(0);
		this.adDAO.save(ad);
	}
	/**
	 * @Name: updateAd
	 * @Description: 更新广告管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-11（创建日期）
	 * @Parameters: Ad ad 广告管理对象
	 * @Return: 无
	 */
	@Override
	public void updateAd(Ad ad) {
		// TODO Auto-generated method stub
		Ad oldAd = this.findById(ad.getId());
		oldAd.setPosition(0);
		if(ad.getName() != null && !ad.getName().trim().equals("")){
			oldAd.setName(ad.getName().trim());
		}
		if(ad.getContentType() != null){
			oldAd.setContentType(ad.getContentType());
		}
		if(ad.getCategory() != null){
			oldAd.setCategory(ad.getCategory());
		}
		this.adDAO.update(oldAd);
	}
	/**
	 * @Name: delByIDs
	 * @Description: 根据ID或ID集合删除广告管理信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-11（创建日期）
	 * @Parameters: List<Integer> idList 广告管理对象ID或ID集合
	 * @Return: 无
	 */
	@Override
	public void delByIDs(List<Integer> idList,Integer showFlag) {
		
	/*	
		if (idList != null && !idList.isEmpty()) {
			List<AdDetail> list = adDetailService.findByIdList(idList);
			adDetailService.deleteByIdList(idList);
			for (AdDetail a : list) {
				new File(this.getProjectPath() + a.getPath()).delete();
			}
		}*/
		
		
		if(idList != null && !idList.isEmpty()){
			for(Integer id : idList){
				//删除时把本店介绍或点播节目中的广告外键ID更新为null
//				this.setAdIdIsNull(showFlag, id);
				if(this.setAdIdIsNull(showFlag, id)){
					//先删除广告底下的图片
					try{
						deleteDetailByAdid(id);
						this.adDAO.deleteById(id);
					}catch (Exception e) {
						e.printStackTrace();
					}
				}
				
			}
		}
	}
	
	private void deleteDetailByAdid(Integer adid){
		List<AdDetail> details = adDetailDAO.findByAd(adid);
		if(details != null && details.size() > 0){
			for(AdDetail detail:details){
				new File(SystemConfig.getProjectBasePath()+detail.getPath()).delete();
				adDetailDAO.delete(detail);
			}
		}
	}
	/**
	 * @Name: setAdIdIsNull
	 * @Description: 删除时把本店介绍或点播节目中的广告外键ID更新为null
	 * @Author: 
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-16（创建日期）
	 * @Parameters: Integer showFlag 用于判断是本店介绍还是点播节目
	 * 				Integer id 页面选择的要删除项ID
	 * @Return: 无
	 */
	private boolean setAdIdIsNull(Integer showFlag, Integer id) {
		boolean status = false;
		//删除时把本店介绍中的广告外键ID清空
		if(showFlag == Ad.INTRO_CONTENT){
			List<ShopIntroduce> siList = this.shopIntroduceDAO.findIntroAdId(id);
			if(siList != null && !siList.isEmpty()){
				
//				for(ShopIntroduce s: siList){
//					s.setAdid(null);
//					this.shopIntroduceDAO.update(s);
//				}
			}else {
				status = true;
			}
}
		//删除时把点播节目中的广告外键ID清空
		if(showFlag == Ad.VOD_AD){
			List<Vodprogram> vpList = this.vodProgramDAO.findVodProgramByAdid(id);
			if(vpList != null && !vpList.isEmpty()){
				for(Vodprogram vp : vpList){
					vp.setAdid(null);
					this.vodProgramDAO.update(vp);
				}
			}
			status = true;
		}
		//消费介绍
		if(showFlag == Ad.EXPENSE){
			status = true;
		}
		
		return status;
	}

	@Override
	public Ad findIsAd(int id) {
		// TODO Auto-generated method stub
		return this.adDAO.findIsAd(id);
	}
	/**
	 * @Name: findAdLeftContent
	 * @Description: 查询广告中为本店介绍的名称（左侧内容）
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-14（创建日期）
	 * @Parameters: int introContent 本店介绍ID
	 * @Return: List<String> 广告下的为本店介绍的名称的（左侧内容）集合
	 */
	@Override
	public List<String> findAdLeftContent(int introContentid) {
		// TODO Auto-generated method stub
		return this.adDAO.findAdLeftContent(introContentid);
	}
	/**
	 * @Name: findAdListByIntro
	 * @Description: 查询广告中为本店介绍的广告对象集合
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-14（创建日期）
	 * @Parameters: int introContent 本店介绍ID
	 * @Return: List<Ad> 广告下的为本店介绍的广告对象集合
	 */
	@Override
	public List<Ad> findAdListByIntro(int introContentid) {
		// TODO Auto-generated method stub
		return this.adDAO.findAdListByIntro(introContentid);
	}
	/**
	 * @Name: findAdListByIntro
	 * @Description: 根据本店介绍中外键（adid）查询广告对象
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-16（创建日期）
	 * @Parameters: Integer adid 本店介绍中外键adid
	 * @Return: Ad 广告对象
	 */
	@Override
	public Ad findAdByIntroAdId(Integer adid) {
		// TODO Auto-generated method stub
		return this.adDAO.findById(adid);
	}
	/**
	 * @Name: findAdListByVodProgram
	 * @Description: 根据点播节目中外键（adid）查询广告对象
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-16（创建日期）
	 * @Parameters: int adid 点播节目中外键adid
	 * @Return: Ad 广告对象
	 */
	@Override
	public List<Ad> findAdListByVodProgram(int adid) {
		// TODO Auto-generated method stub
		return this.adDAO.findAdListByVodProgram(adid);
	}

	@Override
	public Ad findToTime(Message m) {
		// TODO Auto-generated method stub
		return this.adDAO.findById(m.getId());
//		if(a != null){
//			 Calendar cal_now=Calendar.getInstance();//使用日历类
////			  int year=cal.get(Calendar.YEAR);//得到年
////			  int month=cal.get(Calendar.MONTH)+1;//得到月，因为从0开始的，所以要加1
////			  int day=cal.get(Calendar.DAY_OF_MONTH);//得到天
//			  int hour=cal_now.get(Calendar.HOUR);//得到小时
//			  int minute=cal_now.get(Calendar.MINUTE);//得到分钟
//			  int second=cal_now.get(Calendar.SECOND);//得到秒
//			  
//		}
//		return null;
	}
}
