package com.boyue.karaoke.service.impl;

import java.io.File;
import java.util.List;


import org.apache.commons.lang.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.IVodPartDAO;
import com.boyue.karaoke.dao.IVodProgramDAO;
import com.boyue.karaoke.service.VodPartService;
import com.boyue.spa.domain.Vodpart;
import com.boyue.spa.service.querycondition.VodVideoQueryCondition;
import com.boyue.spa.service.querycondition.VodpartQueryCondition;


@Service
public class VodPartServiceImpl implements VodPartService{
	
	@Autowired
	private IVodPartDAO dao;
	@Autowired
	private IVodProgramDAO vodProgramDAO;
	
	@SuppressWarnings("unchecked")
	public List<Vodpart> browseVodPartService() { 
		return dao.findAll();
	}
	/**
	 * @Name: loadVodPartService
	 * @Description: 装载指定的直播管理
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: 无
	 * @Return: String 跳到vodPartList.jsp页面
	 */
	@Override
	public Vodpart loadVodPartService(Integer id) {
		return dao.findById(id);
	}

	@Override
	public void delVodPartService(Integer id) {
		dao.deleteById(id);
	}
	
	@Override
	public boolean delVodPartMore(String hql) {
		boolean status = false;
		//dao.delObject(hql);
		status = true;
		return status;
	}
	/**
	 * @Name: saveOrUpdateVodPartService
	 * @Description: 保存或更新点播栏目信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-23（创建日期）
	 * @Parameters: Vodpart vodpart 点播栏目对象
	 * @Return: boolean true 保存成功
	 * 					false 保存失败
	 */
	@Override
	public boolean saveOrUpdateVodPartService( Vodpart vodpart) {
		boolean status = false;
		try{
			dao.saveOrUpdate(vodpart);
			status = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}	
		return status;
	}
	/**
	 * @Name: saveVodPartService
	 * @Description: 保存新增点播栏目信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-11（创建日期）
	 * @Parameters: Vodpart vodpart 点播栏目对象
	 * @Return: boolean true 保存成功
	 * 					false 保存失败
	 */
	@Override
	public boolean saveVodPartService(Vodpart vodpart) {
		boolean status = false;
		try{
			dao.save(vodpart);
			status = true;
		}catch(Exception ex){
			ex.printStackTrace();
		}	
		return status;
	}

	@Override
	public List<Vodpart> loadVodpartlistByHql(String hql) {
		//return dao.query(hql);
		return null;
	}
	/**
	 * @Name: findVodpartPage
	 * @Description: 分页查询栏目信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-11（创建日期）
	 * @Parameters: VodpartQueryCondition condition 用于存放查询条件，有pageNO和pageSize
	 * @Return: PageBean<Vodpart> 返回分页后的pageBean
	 */
	@Override
	public PageBean<Vodpart> findVodpartPage(VodpartQueryCondition condition) {
		Vodpart t = new Vodpart();
		if (StringUtils.isNotBlank(condition.getVodpartName())) {
			t.setVodpartname(condition.getVodpartName());
		}
		if (StringUtils.isNotBlank(condition.getVodpartNamee())) {
			t.setVodpartnamee(condition.getVodpartNamee());
		}
		PageBean<Vodpart> page = dao.findPage(t , condition.getPageNo(), condition.getPageSize());
		return page;
	}	
	/**
	 * @Name: delete
	 * @Description: 批处理删除点播栏目信息,如果栏目下有影片则不能删除文件
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-11（创建日期）
	 * @Parameters: List<Integer> idList ID集合
	 * @Return: 无
	 */
	@Override
	public void delete(List<Integer> idList) {
		if (idList == null) {
			return;
		}
		
		for (Integer vodid : idList) {
			//如果存在影片，则不删除
			List gramList  = vodProgramDAO.findVodprogramByID(vodid);
			if (!gramList.isEmpty()) {
				continue;
			}
			new File(findVodPartByID(vodid).getImg()).delete();
			dao.deleteById(vodid);
		}
	}

	@Override
	public Vodpart loadVodpartByHql(String hql) {
		// TODO Auto-generated method stub
		return null;
	}
	/**
	 * @Name: findVodPartByID
	 * @Description: 根据ID查询栏目信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-11（创建日期）
	 * @Parameters: Integer id 栏目ID
	 * @Return: Vodpart 栏目信息
	 */
	@Override
	public Vodpart findVodPartByID(Integer id) {
		Vodpart vodpart = dao.findById(id);
		return vodpart;
	}
	/**
	 * @Name: updateVodPartService
	 * @Description: 更新栏目信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-07-11（创建日期）
	 * @Parameters: Vodpart model 栏目对象
	 * @Return: 无
	 */
	@Override
	public void updateVodPartService(Vodpart model) {
		dao.update(model);
	}

	@Override
	public List<Vodpart> findVodpartName(String vodpartname) {
//		return dao.fi
		//return dao.findVodpartName(vodpartname);
		return null;
	}
	@Override
	public PageBean<Vodpart> findVodpartPage(List<Vodpart> vodPartList,
			VodpartQueryCondition condition) {
		PageBean<Vodpart> list = null;
		for(int i = 0; vodPartList != null && i < vodPartList.size(); i++ ){
			Vodpart vodpart = vodPartList.get(i);
			list = dao.findPage(vodpart, condition.getPageNo(), condition.getPageSize());
		}
		return list;
	}

	@Override
	public List<Vodpart> findAll() {
		return dao.findAll();
	}
	@Override
	public List<Vodpart> findIsName(Vodpart v) {
		// TODO Auto-generated method stub
//		return this.dao.findIsName(v);
		return this.dao.findByExample(v);
	}

}
