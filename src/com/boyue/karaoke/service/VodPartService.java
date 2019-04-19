package com.boyue.karaoke.service;

import java.util.List;

import com.boyue.framework.common.PageBean;
import com.boyue.spa.domain.Vodpart;
import com.boyue.spa.service.querycondition.VodVideoQueryCondition;
import com.boyue.spa.service.querycondition.VodpartQueryCondition;



public interface VodPartService {
	/** 浏览直播管理 */
	public List<Vodpart> browseVodPartService();	
	/** 装载指定的直播管理 */	
	public Vodpart  loadVodPartService(Integer id);	
	/** 删除指定的直播管理 */	
	public void delVodPartService(Integer id);	
	/** 新增或修改直播管理 */
	public boolean saveOrUpdateVodPartService(Vodpart vodpart);	
	/** 新增直播管理 */
	public boolean saveVodPartService(Vodpart vodpart);
	/**通过hql执行批删除*/
	public boolean delVodPartMore(String hql);
	/**通过hql获得VodPart对象*/
	public Vodpart loadVodpartByHql(String hql);
	/**通过hql获得VodPart对象集合*/
	public List<Vodpart> loadVodpartlistByHql(String hql);
	
	
	public PageBean<Vodpart> findVodpartPage(VodpartQueryCondition condition);
	
	public void delete(List<Integer> idList);
	/**
	 * 根据ID查询栏目信息
	 * @param id
	 * @return
	 */
	public Vodpart findVodPartByID(Integer id);
	/**
	 * 更新栏目信息
	 * @param model
	 */
	public void updateVodPartService(Vodpart model);
	public List<Vodpart> findVodpartName(String vodpartname);
	public PageBean<Vodpart> findVodpartPage(List<Vodpart> vodPartList,
			VodpartQueryCondition condition);
	public List<Vodpart> findAll();
	public List<Vodpart> findIsName(Vodpart v);
}
