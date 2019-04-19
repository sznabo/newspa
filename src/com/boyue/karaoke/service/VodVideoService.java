package com.boyue.karaoke.service;

import java.util.List;
import java.util.Map;

import org.hibernate.criterion.Criterion;

import com.boyue.framework.common.PageBean;
import com.boyue.spa.domain.Vodprogram;
import com.boyue.spa.domain.Vodvideo;
import com.boyue.spa.service.querycondition.QueryCondition;
import com.boyue.spa.service.querycondition.VodVideoQueryCondition;


public interface VodVideoService {

	/**通过vodprogramID节目id获得节目剧集*/
	public List<Vodvideo> browseVodVideoByVodprogramID(int vodprogramID);
	/**保存Vodvideo对象*/
	public boolean saveVodvideo(Vodvideo model);
	/**删除,批量删除*/
	public boolean delVodvideo(String hql);
	/**根据Id单个删除*/
	public boolean delVodvideoByID(int videoID);
	/**根据Id获得Vodvideo对象*/
	public Vodvideo loadVodvideoByID(int videoID);
	/**更新Vodvideo对象*/
	public boolean updateVodvideo(Vodvideo model);
	/**查询Vodvideo，通过hql*/
	public List<Vodvideo> loadVodvideoListByHql(String hql);
	/**分页加载Vodvideo对象集*/
	public PageBean loadPage(int pageNo,int pageSize,Class cls,List<Criterion> params);
	
	public List<Vodvideo> findVodvideoByGram(int gramid);
	
	public List<Vodvideo> findByIdList(List<Integer> idsList);
	
	public Map<Integer,List<Vodvideo>> findByProgramId(List<Integer> idsList);
	
	public Vodvideo findById(int videoId);
	public PageBean<Vodvideo> findVodvidelPage(VodVideoQueryCondition condition);
	public PageBean<Vodvideo> loadpage(int pageNo, int pageSize, Class<Vodvideo> class1,
			List<Criterion> paramss);
	public Vodvideo findByProgramId(Integer vodpartid);
	
	public boolean savevods(List<Vodvideo> lists);
	
}
