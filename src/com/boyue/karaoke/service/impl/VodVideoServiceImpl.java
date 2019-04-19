package com.boyue.karaoke.service.impl;

import java.io.File;
import java.util.ArrayList;
import java.util.Collections;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.apache.commons.lang.StringUtils;
import org.apache.log4j.Logger;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.IVodVideoDAO;
import com.boyue.karaoke.service.VodVideoService;
import com.boyue.spa.domain.Vodpart;
import com.boyue.spa.domain.Vodprogram;
import com.boyue.spa.domain.Vodvideo;
import com.boyue.spa.service.querycondition.QueryCondition;
import com.boyue.spa.service.querycondition.VodVideoQueryCondition;

@Service
public class VodVideoServiceImpl implements VodVideoService {
	private static final Logger LOG = Logger.getLogger(VodVideoServiceImpl.class);
	@Autowired
	private IVodVideoDAO dao;

	/**浏览具体节目剧集信息*/
	@Override
	@SuppressWarnings("unchecked")
	public List<Vodvideo> browseVodVideoByVodprogramID(int vodprogramID) {
		// TODO Auto-generated method stub
		String hql = "from Vodvideo as vod where vod.vodprogramid = "+vodprogramID+" order by vod.id desc";
		return dao.query(hql);
	}
	/**
	 * @Name: saveVodvideo
	 * @Description: 保存Vodvideo对象剧集信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: Vodvideo model 节目续集对象
	 * @Return: boolean true 保存成功
	 * 					false 保存失败
	 */
	@Override
	public boolean saveVodvideo(Vodvideo model) {
		boolean status = false;
		try {
			if (model.getPosition() == null || model.getPosition().intValue() == 0) {
				int position = obtainPosition(model.getVodprogramid());
				model.setPosition(position);
			} else {
				int position = model.getPosition();
				updateOtherPostion(position, model.getVodprogramid());
			}
			dao.save(model);
			status = true;
		} catch (Exception e) {
			e.printStackTrace();
			//LOG.error("保存vodvideo异常", e);
			return false;
		}
		return status;
	}	

	/**删除Video*/
	@Override
	@Transactional
	public boolean delVodvideo(String hql) {
		// TODO Auto-generated method stub
		boolean status = false;
		try{
			dao.delObject(hql);
			status = true;
		}catch(Exception e){
			e.printStackTrace();
		}
		return status;
	}	
	/**
	 * @Name: delVodvideoByID
	 * @Description: 根据ID删除节目续集信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: int videoID 节目续集ID
	 * @Return: boolean true 保存成功
	 * 					false 保存失败
	 */
	@Override
	public boolean delVodvideoByID(int videoID){
		// TODO Auto-generated method stub
		boolean status = false;
		try{
			Vodvideo vv = (Vodvideo) dao.loadById(Vodvideo.class, videoID);
//			deleteVideo(vv.getVoidpath());
			dao.delById(Vodvideo.class, videoID);
			status = true;
		}catch (Exception e) {
//			LOG.error("", e);
		}
		return status;
	}
	
	/**根据Id加载Vodvideo对象*/
	@Override
	public Vodvideo loadVodvideoByID(int videoID) {
		// TODO Auto-generated method stub
		return (Vodvideo)dao.loadById(Vodvideo.class, videoID);
	}
	/**
	 * @Name: delVodvideo
	 * @Description: 更新Vodvideo对象剧集信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: Vodvideo model Vodvideo对象剧集
	 * @Return: boolean true 更新成功
	 * 					false 更新失败
	 */
	@Override
	public boolean updateVodvideo(Vodvideo model) {
		// TODO Auto-generated method stub
		boolean status = false;
		Vodvideo video = (Vodvideo) dao.loadById(Vodvideo.class, model.getId());
		String oldPath = video.getVoidpath().trim();
		video.setFilmid(model.getFilmid());
		video.setIfenable(model.getIfenable());
		video.setReleasetype(model.getReleasetype());
		video.setServerid(model.getServerid());
		video.setServername(model.getServername());
		video.setVoidformat(model.getVoidformat());
		video.setVoidgrade(model.getVoidgrade());
		video.setVoidname(model.getVoidname());
		video.setVoidnamee(model.getVoidnamee());
		video.setVoidpath(model.getVoidpath());
		video.setVoidstatus(model.getVoidstatus());
		if (model.getReleasetime() != null) {
			video.setReleasetime(model.getReleasetime());
		}
		if (video.getVoidstatus() == Vodvideo.DISABLE) {
			video.setReleasetime(null);
		}
		try{
			//-1:不改变顺序， 0：弄到最后一个， 1指定位置
			if (model.getPosition() != null) {//null表示不变
				if (model.getPosition().intValue() == 0) {//0 是变成最后一个
					int position = obtainPosition(model.getVodprogramid());
					video.setPosition(position);
				} else {//指定位置
					video.setPosition(model.getPosition());
					updateOtherPostion(model.getPosition(), model.getVodprogramid());
				}
			}
			dao.saveOrUpdate(video);
			status = true;
		}catch (Exception e) {
			//LOG.error("", e);
			status = false;
		}
		//删掉原来的文件
//		try {
//			if (!oldPath.equals(model.getVoidpath().trim())) {
//				deleteVideo(oldPath);
//			}
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
		return status;
	}	
	
//	public static void deleteVideo(String path) {
//		File file = new File(SystemConfig.getProjectBasePath() + Config.getVodDir() + File.separator + path);
//		System.out.println("删除文件:" + file.getAbsolutePath());
//		if (file.exists()) {
//			file.delete();
//		}
//	}
	
	/**通过SQL查询Vodvideo对象List*/
	@Override
	public List<Vodvideo> loadVodvideoListByHql(String hql) {
		return dao.query(hql);
	}
	/**
	 * @Name: loadPage
	 * @Description: 分页查询节目续集信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: int pageNo 分页中的当前页
	 * 				int pageSize 分页中的页数
	 * 				Class cls 分页中用到的对象
					List<Criterion> params 分页中的参数
	 * @Return: PageBean<Vodvideo> 分页后节目续集对象集合
	 */
	@Override
	public PageBean<Vodvideo> loadPage(int pageNo, int pageSize, Class cls,
			List<Criterion> params) {
		return dao.findPage(pageNo, pageSize, cls, params, Order.asc("position"));
	}
	/**
	 * @Name: delete
	 * @Description: 根据ID查询节目续集信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: int gramid 节目ID
	 * @Return: List<Vodvideo> 节目续集对象集合
	 */
	@Override
	public List<Vodvideo> findVodvideoByGram(int gramid) {
		return dao.findByHql("FROM Vodvideo where vodprogramid=" + gramid + " order by position asc");
	}
	
	private int updateOtherPostion(int position, int gramid) {
		return dao.executeSql("update Vodvideo set position=position+1 where position>=" + position + " and vodprogramid=" + gramid, null);
	}
	
	private int obtainPosition(int gramid) {
		List list = dao.findByHql("select max(position) FROM Vodvideo where vodprogramid=" + gramid);
		if (list == null || list.isEmpty() || list.get(0) == null) {//如果没有记录，从1开始
			return 1;
		} else { 
			return Integer.valueOf(list.get(0).toString()) + 1;
		}
	}

	@Override
	public List<Vodvideo> findByIdList(List<Integer> idsList) {
		return dao.findByIds(idsList, Vodvideo.class, "id");
	}

	@Override
	public Map<Integer, List<Vodvideo>> findByProgramId(List<Integer> idsList) {
		if (idsList == null || idsList.isEmpty()) {
			return Collections.EMPTY_MAP;
		}
//		Service controlServer = servicerMngSerivce.getControlServer();
		String controlServerAddr = "";
//		if (controlServer != null) {
//			controlServerAddr = controlServer.getServiceip() + ":" + controlServer.getServiceport();
//		}
		List<Vodvideo> list = dao.findByHql("FROM Vodvideo where vodprogramid in (" + StringUtils.join(idsList.iterator(), ",") +")");
		Map<Integer, List<Vodvideo>> map = new HashMap<Integer, List<Vodvideo>>();
		for (Vodvideo v : list) {
			v.setServer(controlServerAddr);
			List<Vodvideo> vvList = map.get(v.getVodprogramid());
			if (vvList == null) {
				vvList = new ArrayList<Vodvideo>();
			}
			vvList.add(v);
			map.put(v.getVodprogramid(), vvList);
		}
		return map;
	}
	/**
	 * @Name: findById
	 * @Description: 根据Vodvideo对象剧集ID查询对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: int videoId Vodvideo对象剧集ID
	 * @Return: Vodvideo Vodvideo对象剧集
	 */
	@Override
	public Vodvideo findById(int videoId) {
		return (Vodvideo) dao.loadById(Vodvideo.class, videoId);
	}

	@Override
	public PageBean<Vodvideo> findVodvidelPage(VodVideoQueryCondition condition) {
		Vodvideo t = new Vodvideo();
		if (StringUtils.isNotBlank(condition.getVoidname())) {
			t.setVoidname(condition.getVoidname());
		}
		PageBean<Vodvideo> page = dao.findPage(t , condition.getPageNo(), condition.getPageSize());
		return page;
	}

	@Override
	public PageBean<Vodvideo> loadpage(int pageNo, int pageSize, Class<Vodvideo> class1,
			List<Criterion> paramss) {
		return dao.findPage(pageNo, pageSize, class1, paramss, null);
	}
	@Override
	public Vodvideo findByProgramId(Integer id) {
		
		return this.dao.findByProgramId(id);
	}
	
	
	@Override
	public boolean savevods(List<Vodvideo> lists) {
		boolean status = false;
		try{
			for(Vodvideo v:lists){
				if(findNameif(v)){
				dao.save(v);
				}
			}
			status = true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		
		return status;
	}
	
	//查找同个栏目下是否有重复记录
	public boolean findNameif(Vodvideo vod){
		boolean status = true;
		String hql = "from Vodvideo v where v.vodprogramid ="+vod.getVodprogramid()+" and v.voidname='"+vod.getVoidname()+"'";
		List<Vodvideo> lists = dao.findByHql(hql);
		if(lists != null && lists.size() > 0){
			status = false;
		}
		return status;
	}
	
	
}
