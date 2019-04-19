package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.AdDAO;
import com.boyue.karaoke.model.Ad;

/**
 *
 * @author ben
 * @date   2014-7-1 上午9:51:11
 *
 */
@Repository
public class AdDAOImpl extends BaseDAOImpl<Ad> implements AdDAO  {

	/**
	 * @Name: findAdContextTypeList
	 * @Description: 查询广告管理内容类型集合
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-10（创建日期）
	 * @Parameters: 无
	 * @Return: List<String> 广告管理内容类型集合
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> findAdContextTypeList() {
		// TODO Auto-generated method stub
		return super.findBySql("SELECT DISTINCT content_type FROM ad", null);
	}
	/**
	 * @Name: findAdCategoryList
	 * @Description: 查询广告管理所属栏目集合
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-10（创建日期）
	 * @Parameters: 无
	 * @Return: 广告管理所属栏目集合
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<Integer> findAdCategoryList() {
		// TODO Auto-generated method stub
		return super.findBySql("SELECT DISTINCT category FROM ad", null);
	}
	@Override
	public PageBean<Ad> findPage(Ad ad, int pageNo, int pageSize, Order asc) {
		// TODO Auto-generated method stub
		return super.findPage(ad, pageNo, pageSize, Order.asc("position"));
	}
	@Override
	public Ad findIsAd(int id) {
		// TODO Auto-generated method stub
		List<Ad> adList = super.findByHql("FROM Ad WHERE id = " + id);
		if(adList != null && !adList.isEmpty() && adList.size() == 1){
			return adList.get(0);
		}
		return null;
	}
	/**
	 * @Name: findAdLeftContent
	 * @Description: 查询广告中为本店介绍的名称（左侧内容）
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-14（创建日期）
	 * @Parameters: int introContent 本店介绍ID
	 * @Return: 广告下的为本店介绍的名称的（左侧内容）集合
	 */
	@SuppressWarnings("unchecked")
	@Override
	public List<String> findAdLeftContent(int introContentid) {
		// TODO Auto-generated method stub
		return super.findBySql("SELECT name FROM ad WHERE category = ?",new Object[]{introContentid});
	}
	/**
	 * @Name: findAdListByIntro
	 * @Description: 查询广告中为本店介绍的广告对象集合
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-14（创建日期）
	 * @Parameters: int introContent 本店介绍ID
	 * @Return: List<Ad> 广告下的为本店介绍的广告对象集合
	 */
	@Override
	public List<Ad> findAdListByIntro(int introContentid) {
		// TODO Auto-generated method stub
		return super.findByHql("FROM Ad WHERE category = " + introContentid);
	}
	/**
	 * @Name: findAdListByVodProgram
	 * @Description: 查询点播节目中点播广告的对象（点播广告）
	 * @Author: （作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-16（创建日期）
	 * @Parameters: int adid 广告对象中所属点播广告的ID
	 * @Return: List<Vodprogram> 广告对象集合
	 */
	@Override
	public List<Ad> findAdListByVodProgram(int adid) {
		// TODO Auto-generated method stub
		return super.findByHql("FROM Ad WHERE category = " + adid);
	}

}
