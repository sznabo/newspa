package com.boyue.karaoke.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.dao.AdDAO;
import com.boyue.karaoke.dao.IVodProgramDAO;
import com.boyue.karaoke.model.Ad;
import com.boyue.karaoke.service.VodPartService;
import com.boyue.karaoke.service.VodProgramService;
import com.boyue.karaoke.service.VodVideoService;
import com.boyue.spa.domain.Vodpart;
import com.boyue.spa.domain.Vodprogram;
import com.boyue.spa.domain.Vodvideo;


@Service
public class VodProgramServiceImpl implements VodProgramService {
	
	private VodPartService vodPartService;
	@Autowired
	private VodVideoService videoService;
	@Autowired
	private IVodProgramDAO programDao;
	@Autowired
	private AdDAO adDAO;

	/**获得视频分类列表*/
	@Override
	public List<Vodprogram> browseVodprogramByVodpartID(int vodpartid) {
		String hql = "from Vodprogram as vod where vod.vodpartid = "+vodpartid+" order by vod.id desc";
		return programDao.query(hql);
	}
	/**
	 * @Name: loadVodProgramByVodprogramID
	 * @Description: 根据节目ID查询节目对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: int vodprogramID 节目对象ID
	 * @Return: Vodprogram 节目对象
	 */
	@Override
	public Vodprogram loadVodProgramByVodprogramID(int vodprogramID) {
		return programDao.loadById(Vodprogram.class, vodprogramID);
	}	
	/**
	 * @Name: saveVodprogram
	 * @Description: 保存添加的节目信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: Vodprogram model 节目对象
	 * @Return: String 跳转到vodprogramList.jsp页面
	 * @throws Exception true 保存成功
	 * 					 false 保存失败
	 */
	@Override
	public boolean saveVodprogram(Vodprogram model) {
		//设置位置
		if (model.getPosition() == null) {
			model.setPosition(obtainPosition(model.getVodpartid()));
		} else {
			updateOtherPostion(model.getPosition(), model.getVodpartid());
		}
//		model.setYear("");
//		model.setArea("");
//		Ad ad = new Ad();
//		ad.setName(model.getVoidprogramname());
//		ad.setPosition(0);
//		ad.setContentType(Ad.VIDEO);
//		ad.setCategory(Ad.VOD_AD);
//		//保存广告对象信息，即向广告中插入一条数据
//		adDAO.save(ad);
//		//保存点播信息前插入广告外键ID
//		model.setAdid(ad.getId());
//		//保存点播信息
		programDao.save(model);
		return true;
	}	
	
	/**更新Vodprogram对象*/
	@Override
	public boolean updateVodprogram(Vodprogram model) {
		Object o = programDao.loadById(Vodprogram.class, model.getId());
		if (o == null) {
			return false;
		}
		
		Vodprogram gram = (Vodprogram) o;
		if (model.getPosition() != null) {//null表示不变
			if (model.getPosition().intValue() == 0) {//0 是变成最后一个
				int position = obtainPosition(gram.getVodpartid());
				gram.setPosition(position);
			} else {//指定位置
				gram.setPosition(model.getPosition());
				updateOtherPostion(model.getPosition(), model.getVodpartid());
			}
		}
		if (StringUtils.isNotBlank(model.getVoidprogramimg())) {
			gram.setVoidprogramimg(model.getVoidprogramimg());
		}
		gram.setArea(StringUtils.trimToEmpty(model.getArea()));
		gram.setTypes(model.getTypes());
		gram.setFilmtype(StringUtils.trimToEmpty(model.getFilmtype()));
		gram.setYear(StringUtils.trimToEmpty(model.getYear()));
		gram.setVoidprogramdescription(StringUtils.trimToEmpty(model.getVoidprogramdescription()));
		gram.setVoidprogramdirector(StringUtils.trimToEmpty(model.getVoidprogramdirector()));
		gram.setVoidprogramname(StringUtils.trimToEmpty(model.getVoidprogramname()));
		gram.setVoidprogramnamee(StringUtils.trimToEmpty(model.getVoidprogramnamee()));
		gram.setVoidprogramstarring(StringUtils.trimToEmpty(model.getVoidprogramstarring()));
		//增加对点播广告的修改
		gram.setAdid(model.getAdid());
		if (model.getMaxVisitCount() != null) {
			gram.setMaxVisitCount(model.getMaxVisitCount());
		}
		if (StringUtils.isNotBlank(model.getVoidprogramimg())) {
			gram.setVoidprogramimg(model.getVoidprogramimg());
		}
		programDao.saveOrUpdate(gram);
		return true;
	}	

	
	@Override
	public boolean delVodprogramById(Integer id) {
		// TODO Auto-generated method stub
		boolean bool = false;
		try {
			programDao.delById(Vodprogram.class, id);
			bool = true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return bool;
	}	
	/**
	 * @Name: loadpage
	 * @Description: 分页查询Vodprogram对象
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: int pageNo 分页中的当前页
	 * 				int pageSize 分页中的页数
	 * 				Class cls 分页中用到的对象,
	 *				List<Criterion> params 分页用到的参数
	 * @Return: PageBean<Vodprogram> 对象分页后的PageBean
	 */
	@Override
	public PageBean<Vodprogram> loadpage(int pageNo, int pageSize, Class cls,
			List<Criterion> params) {
		return programDao.findPage(pageNo, pageSize, cls, params, Order.asc("position"));
	}
	
	/**
	 * @Name: findGramByPart
	 * @Description: 根据栏目ID查询节目对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: 无
	 * @Return: int vodPartId 栏目ID
	 */
	@Override
	public List<Vodprogram> findGramByPart(int vodPartId) {
		return programDao.findByHql("FROM Vodprogram where vodpartid =  " + vodPartId + "  order by position asc");
	}
	
	private int updateOtherPostion(int position, int partid) {
		return programDao.executeSql("update vodprogram set position=position+1 where position>=" + position + " and vodpartid=" + partid, null);
	}
	
	private int obtainPosition(int vodpartid) {
		List list = programDao.findByHql("select max(position) FROM Vodprogram where vodpartid=" + vodpartid);
		if (list == null || list.isEmpty() ||list.get(0) == null) {//如果没有记录，从1开始
			return 1;
		} else {
			return Integer.valueOf(list.get(0).toString()) + 1;
		}
	}

	public VodPartService getVodPartService() {
		return vodPartService;
	}

	public void setVodPartService(VodPartService vodPartService) {
		this.vodPartService = vodPartService;
	}



	public VodVideoService getVideoService() {
		return videoService;
	}

	public void setVideoService(VodVideoService videoService) {
		this.videoService = videoService;
	}

	/* (non-Javadoc)
	 * @see com.boyue.struts.service.VodProgramService#findAll()
	 */
	@Override
	public List<Vodprogram> findAll() {
		List<Vodprogram> all = programDao.findAll();
		
		List<Vodpart> allVodpart = vodPartService.findAll();
		Map<Integer, Vodpart> map = new HashMap<Integer, Vodpart>();
		for (Vodpart p : allVodpart) {
			map.put(p.getId(), p);
		}
		
		for (Vodprogram g : all) {
			g.setVodpart(map.get(g.getVodpartid()));
		}
		return all;
	}

	/**
	 * @Name: getVodProgramTypes
	 * @Description: 根据点播栏目ID查栏目中的类型信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: Integer vodpartId 栏目ID
	 * @Return: List<String> 栏目中的类型集合
	 */  
	@Override
	public List<String> getVodProgramTypes(Integer vodpartId) {
		String sql = "SELECT DISTINCT filmtype FROM vodprogram WHERE filmtype IS NOT NULL AND filmtype !=''";
		if (vodpartId != null) {
			sql = sql + " AND vodpartid=" + vodpartId;
		}
		List<String> list = programDao.findBySql(sql, null);
		return list;
	}
	
	/**
	 * @Name: getVodProgramAreas
	 * @Description: 根据点播栏目ID查栏目中的区域信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: Integer vodpartId 点播栏目ID
	 * @Return: List<String> 栏目中的类型集合
	 */
	public List<String> getVodProgramAreas(Integer vodpartId) {
		String sql = "SELECT DISTINCT area FROM vodprogram WHERE area IS NOT NULL AND area !=''";
		if (vodpartId != null) {
			sql = sql + " AND vodpartid=" + vodpartId;
		}
		List<String> list = programDao.findBySql(sql, null);
		return list;
	}

	@Override
	public List<String> getVodProgramYears(Integer vodpartId) {
		String sql = "SELECT DISTINCT YEAR FROM vodprogram WHERE YEAR IS NOT NULL AND YEAR !=''";
		if (vodpartId != null) {
			sql = sql + " AND vodpartid=" + vodpartId;
		}
		List<String> list = programDao.findBySql(sql, null);
		return list;
	}
	/**
	 * @Name: delete
	 * @Description: 删除节目信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: List<Integer> idList 节目ID集合
	 * @Return: 无
	 */
	@Override
	public void delete(List<Integer> idList) {
		if (idList == null) {
			return;
		}
		for (Integer id : idList) {
//			List list = programDao.findBySql("SELECT * FROM product_package_video WHERE video_id=" + id, null);
//			if (!list.isEmpty()) {//如果产品已经在使用，则无法删除
//				continue;
//			}
			List<Vodvideo> vvList = videoService.findVodvideoByGram(id);
			if(vvList != null && vvList.size() > 0){
				for (Vodvideo vodvideo : vvList) {
					videoService.delVodvideoByID(vodvideo.getId());
				}
			}
			Vodprogram vodprogram = programDao.findById(id);
			programDao.delById(Vodprogram.class, id); 
			String picPath = vodprogram.getVoidprogramimg();
			new File(SystemConfig.getProjectBasePath() + picPath).delete();
			//dao.executeSql("DELETE FROM vodvideo WHERE vodprogramid=" + id, null);
		}
		
	}

	@Override
	public List<Vodprogram> findByIdList(List<Integer> idList) {
		if (idList == null || idList.isEmpty()) {
			return Collections.EMPTY_LIST;
		}
		List<Vodprogram> list = programDao.findByIds(idList, Vodprogram.class, "id"); //program
		Map<Integer, List<Vodvideo>> videoMap = videoService.findByProgramId(idList); //proramId->video
		for (Vodprogram vp : list) {
			List<Vodvideo> vvList = videoMap.get(vp.getId());
			vp.setVideos(vvList);
		}
//	    Service cmsServer = servicerMngSerivce.getCmsServer();
	    String project = getProjectName();
		List<Vodprogram> vproramlist = new ArrayList<Vodprogram>();
		for(Vodprogram vgram:list){
			if(vgram.getVideos()!=null && !vgram.getVideos().isEmpty()){
				vproramlist.add(vgram);
			}
		}
		return vproramlist;
	}

	private String getProjectName() {
		// TODO Auto-generated method stub
		return null;
	}
	@Override
	public List<Vodprogram> findByName(String name) {
		String hql="from Vodprogram where voidprogramname like '%"+name+"%'";
		
		return programDao.findByHql(hql);
	}
	
	
	@Override
	public boolean savevods(List<Vodprogram> lists) {
		boolean status = false;
		try{
			for(Vodprogram v:lists){
				if(findNameif(v)){
				programDao.save(v);
				if(v.getV() != null){
				    v.getV().setVodprogramid(v.getId());
					videoService.saveVodvideo(v.getV());
				}
				}
			}
			status = true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
		
	}
	
	//查找同个栏目下是否有重复记录
	public boolean findNameif(Vodprogram vod){
		boolean status = true;
		String hql = "from Vodprogram v where v.vodpartid ="+vod.getVodpartid()+" and v.voidprogramname='"+vod.getVoidprogramname()+"' and v.voidprogramdirector = '"+vod.getVoidprogramdirector()+"'";
		List<Vodprogram> lists = programDao.findByHql(hql);
		if(lists != null && lists.size() > 0){
			status = false;
		}
		return status;
	}

	
	/*电影热度  */
	@Override
	public Vodprogram findById(Integer vodPid) {
		Vodprogram vodprogram = (Vodprogram)this.programDao.findById(vodPid);
		return vodprogram;
	}
	
	/* (non-Javadoc)  
	
	 * <p>Title: loadpageBysortType</p>  
	
	 * <p>Description: </p>  
	
	 * @param paramInt1
	 * @param paramInt2
	 * @param paramClass
	 * @param paramList
	 * @param paramInt3
	 * @return  
	
	 * @see com.boyue.karaoke.service.VodProgramService#loadpageBysortType(int, int, java.lang.Class, java.util.List, int)  
	
	 */
	public PageBean<Vodprogram> loadpageBysortType(int pageNo, int pageSize, Class cls, List<Criterion> params, int sortType)
	   {
	     if (sortType == 2) {
	       return this.programDao.findPage(pageNo, pageSize, cls, params, Order.desc("playtime"));
	     }
	     if (sortType == 1) {
	       return this.programDao.findPage(pageNo, pageSize, cls, params, Order.desc("position"));
	     }
	     return null;
	   }
	

}
