package com.boyue.karaoke.service;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.boyue.framework.common.PageBean;
import com.boyue.spa.domain.Vodprogram;



public interface VodProgramService {
	/**根据Vodpartid加载视频信息*/
//	public List<Vodprogram> browseVodprogramByVodpartID(int vodpartid);
	/**根据vodprogramid加载本对象信息*/
	public Vodprogram loadVodProgramByVodprogramID(int vodprogramID);
	/**保存Vodprogram对象*/
	public boolean saveVodprogram(Vodprogram model);
	/**更新Vodprogram对象*/
	public boolean updateVodprogram(Vodprogram model);
	/**删除Vodprogram对象，通过vodpartid*/
//	public boolean delVodprogramByVodpartId(String hql);
	/**删除Vodprogram对象，通过VodprogramId*/
	public boolean delVodprogramById(Integer id);
	/**分页Vodprogram查询*/
	public PageBean<Vodprogram> loadpage(int pageNo, int pageSize, Class cls, List<Criterion> params);
	
	public List<Vodprogram> findGramByPart(int vodPartId);
	
	public List<Vodprogram> findAll();
	
	public List<String> getVodProgramTypes(Integer vodpartId);
	
	public List<String> getVodProgramAreas(Integer vodpartId);
	
	public List<String> getVodProgramYears(Integer vodpartId);
	
	public void delete(List<Integer> idList);
	
	public List<Vodprogram> findByIdList(List<Integer> idList);
	
	List<Vodprogram> browseVodprogramByVodpartID(int vodpartid);
	
	public List<Vodprogram> findByName(String name);
	
	/**批量导入电影*/
	public boolean savevods(List<Vodprogram> lists);
	
	public abstract Vodprogram findById(Integer paramInteger);
	
	public abstract PageBean<Vodprogram> loadpageBysortType(int paramInt1, int paramInt2, Class paramClass, List<Criterion> paramList, int paramInt3);
	  
}
