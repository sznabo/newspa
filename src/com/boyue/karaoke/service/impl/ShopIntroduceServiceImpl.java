package com.boyue.karaoke.service.impl;

import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.apache.commons.io.FileUtils;
import org.apache.struts2.ServletActionContext;
import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.MatchMode;
import org.hibernate.criterion.Restrictions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.common.Constants;
import com.boyue.karaoke.common.SystemConfig;
import com.boyue.karaoke.dao.AdDAO;
import com.boyue.karaoke.dao.IShopIntroduceDAO;
import com.boyue.karaoke.model.ShopIntroduce;
import com.boyue.karaoke.service.IShopIntroduceService;
@Service
public class ShopIntroduceServiceImpl implements IShopIntroduceService {

	@Autowired
	private IShopIntroduceDAO shopIntroduceDAO;
	@Autowired
	private AdDAO adDAO;
	private Integer pos;
	/**
	 * @Name: findShopIntroduceList
	 * @Description: 分页查询本店介绍信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-01（创建日期）
	 * @Parameters: ShopIntroduce model 分页中用到的对象
	 * 				int pageNo 分页中的当前页
	 * 				int pageSize 分页中的页数
	 * @Return: PageBean<ShopIntroduce> 返回分页后的pageBean
	 */
	@Override
	public PageBean<ShopIntroduce> findShopIntroduceList(ShopIntroduce model,int pageNo, 
			int pageSize){
		
		List<Criterion> params = new ArrayList<Criterion>();
		if(model.getLv() != null){
			params.add(Restrictions.eq("lv", model.getLv()));
//			if(model.getLv() == 1){
////				params.add(Restrictions.eq("id", model.getId()));
//			}
			if(model.getLv() == 2){
				params.add(Restrictions.eq("parentID", model.getParentID()));
			}
		}
		if(model.getName() != null && !model.getName().trim().equals("")){
			params.add(Restrictions.like("name", model.getName().trim(),MatchMode.ANYWHERE));
		}
		if(model.getNamee() != null && !model.getNamee().trim().equals("")){
			params.add(Restrictions.like("namee", model.getNamee().trim(),MatchMode.ANYWHERE));
		}
		return shopIntroduceDAO.findPage(ShopIntroduce.class, pageNo, pageSize,params);
		
	}
	/**
	 * @Name: saveShopIntroduce
	 * @Description: 保存本店介绍信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-04（创建日期）
	 * @Parameters: ShopIntroduce model 分页中用到的对象
	 * 				File img 大图片
	 * 				File logo_img logo图片
	 * @Return: 无
	 * @throws Exception 有异常抛出
	 */
	@Override
	public void saveShopIntroduce(ShopIntroduce model,File logo_img,String imgFileName)throws Exception {

		if(model.getLv() != null && model.getLv() == 1){
			//设置位置
			if (model.getPosition() == null) {
				model.setPosition(obtainPositionlv1(model.getLv()));
			} else {
				updateOtherPostionlv1(model.getPosition(),model.getLv());
			}
		}else if(model.getLv() != null && model.getLv() == 2){
			//设置位置
			if (model.getPosition() == null) {
				model.setPosition(obtainPositionlv2(model.getParentID(),model.getLv()));
			} else {
				updateOtherPostionlv2(model.getPosition(), model.getParentID(),model.getLv());
			}
		}
		//设置logo图片在数据库中存储的路径和文件名
		String logoImgPath = Constants.SHOPINTRODUCE_LOGO_IMG_PATH;
		String logoPath = this.setImgPath(logo_img,logoImgPath,imgFileName);	
		model.setLogo(logoPath);
//		//设置img图片在数据库中存储的路径和文件名

		shopIntroduceDAO.save(model);
	}
	private int updateOtherPostionlv1(int position, int lv) {
//		return programDao.executeSql("update vodprogram set position=position+1 where position>=" + position + " and vodpartid=" + partid, null);
		return shopIntroduceDAO.executeSql("UPDATE intro SET position=position+1 WHERE position>=" + position + " AND lv = " + lv, null);
	}
	private int updateOtherPostionlv2(Integer position, int gramid,int lv) {
//		return programDao.executeSql("update vodprogram set position=position+1 where position>=" + position + " and vodpartid=" + partid, null);
		return shopIntroduceDAO.executeSql("UPDATE intro SET position=position+1 WHERE position>=" + position + " AND parent_id =" + gramid + " AND lv = " + lv, null);
	}
	private int obtainPositionlv1(int lv) {
//		List list = programDao.findByHql("select max(position) FROM Vodprogram where vodpartid=" + vodpartid);
		List list = shopIntroduceDAO.findByHql("SELECT MAX(position) FROM ShopIntroduce WHERE lv = " + lv);
		if (list == null || list.isEmpty() || list.get(0) == null) {//如果没有记录，从1开始
			return 1;
		} else { 
			return Integer.valueOf(list.get(0).toString()) + 1;
		}
	}
	private int obtainPositionlv2(int gramid,int lv) {
//		List list = programDao.findByHql("select max(position) FROM Vodprogram where vodpartid=" + vodpartid);
		List list = shopIntroduceDAO.findByHql("SELECT MAX(position) FROM ShopIntroduce WHERE parentID = " + gramid + " AND lv = " + lv);
		if (list == null || list.isEmpty() || list.get(0) == null) {//如果没有记录，从1开始
			return 1;
		} else { 
			return Integer.valueOf(list.get(0).toString()) + 1;
		}
	}
	/**
	 * @Name: setImgPath
	 * @Description: 组合图片的真实路径，路径+文件名
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-04（创建日期）
	 * @Parameters: File img 图片文件
	 * 				String ImgPath 图片的相对路径
	 * @Return: String 图片的真实路径，路径+文件名
	 * @throws Exception 有异常抛出
	 */
	private String setImgPath(File img,String ImgPath,String imgFileName) throws IOException {
		String imgType = imgFileName.substring(imgFileName.lastIndexOf("."));
		String imgName = new Date().getTime()+imgType;
		String imgPathReal  = ImgPath +imgName;		
		FileUtils.copyFile(img, new File(ServletActionContext.getServletContext().getRealPath("/") + imgPathReal));
		return imgPathReal;
	}
	/**
	 * @Name: findShopIntroduceByID
	 * @Description: 根据ID查询本店介绍信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-04（创建日期）
	 * @Parameters: Integer id 本店介绍ID
	 * @Return: ShopIntroduce 本店介绍对象
	 */
	@Override
	public ShopIntroduce findShopIntroduceByID(Integer id) {
		return shopIntroduceDAO.findById(id);
	}
	/**
	 * @Name: updateShopIntroduce
	 * @Description: 保存更新本店介绍信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-04（创建日期）
	 * @Parameters: ShopIntroduce model 本店介绍对象
	 * 				File img 大图片文件
	 * 				File logo_img logo图片文件
	 * @Return: 无
	 */
	@Override
	public void updateShopIntroduce(ShopIntroduce model, File img, File logo_img,String imgFileName)throws Exception {
		
		
		//获取旧图片的路径
		ShopIntroduce oldShopIntroduce = shopIntroduceDAO.findById(model.getId());
		
		//设置位置
		if(model.getLv() != null && model.getLv() == 1){
			//设置位置
			if (model.getPosition() != null) {//null表示不变
				if (model.getPosition().intValue() == 0) {//0 是变成最后一个
					int position = obtainPositionlv1(model.getLv());
					oldShopIntroduce.setPosition(position);
				} else {//指定位置
					oldShopIntroduce.setPosition(model.getPosition());
					updateOtherPostionlv1(model.getPosition(), model.getLv());
				}
			}
		}else if(model.getLv() != null && model.getLv() == 2){
			//设置位置
			if (model.getPosition() != null) {//null表示不变
				if (model.getPosition().intValue() == 0) {//0 是变成最后一个
					int position = obtainPositionlv2(model.getParentID(),model.getLv());
					oldShopIntroduce.setPosition(position);
				} else {//指定位置
					oldShopIntroduce.setPosition(model.getPosition());
					updateOtherPostionlv2(model.getPosition(), model.getParentID(),model.getLv());
				}
			}
		}
		//
		String oldLogo = null;
		String oldImg = null;
		//设置logo图片在数据库中存储的路径和文件名
		if(logo_img != null){
			String logoImgPath = Constants.SHOPINTRODUCE_LOGO_IMG_PATH;
			String logoPath = this.setImgPath(logo_img,logoImgPath,imgFileName);	
			oldLogo = oldShopIntroduce.getLogo();
			oldShopIntroduce.setLogo(logoPath);
		}
		//设置img图片在数据库中存储的路径和文件名
		if(img != null){
			String imgPath = Constants.SHOPINTRODUCE_IMG_PATH;
			String imgImgPath = this.setImgPath(img,imgPath,imgFileName);
			oldImg = oldShopIntroduce.getImg();
			oldShopIntroduce.setImg(imgImgPath);
		}
		oldShopIntroduce.setName(model.getName());
		oldShopIntroduce.setNamee(model.getNamee());
		oldShopIntroduce.setDescription(model.getDescription());
		oldShopIntroduce.setDescriptione(model.getDescriptione());
		oldShopIntroduce.setAdid(model.getAdid());
		
		//在更新本店介绍前先更新广告
//		Ad ad = this.adDAO.findById(model.getAdid());
//		ad.setName(model.getName());
//		ad.setPosition(0);
//		ad.setContentType(Ad.PIC);
//		ad.setCategory(Ad.INTRO_CONTENT);
//		
//		//更新广告对象信息
////		adDAO.save(ad);
//		adDAO.update(ad);
		
		//保存更新的内容
		if(model.getId() != null && !model.getId().equals("")){
			shopIntroduceDAO.update(oldShopIntroduce);
			if(oldImg != null && !oldImg.equals("") && oldLogo != null && !oldLogo.equals("")){
				new File(SystemConfig.getProjectBasePath() + oldImg).delete();
				new File(SystemConfig.getProjectBasePath() + oldLogo).delete();
			}else if(oldImg != null && !oldImg.equals("")){
				new File(SystemConfig.getProjectBasePath() + oldImg).delete();
			}else if(oldLogo != null && !oldLogo.equals("")){
				new File(SystemConfig.getProjectBasePath() + oldLogo).delete();
			}
		}
	}
	/**
	 * @Name: delByIDs
	 * @Description: 根据ID或ID集合删除本店介绍信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-04（创建日期）
	 * @Parameters: List<Integer> idList 本店介绍对象
	 * @Return: 无
	 */
	@Override
	public void delByIDs(List<Integer> idList) {
		if(idList == null){
			return ;
		}
		for(Integer id : idList){
			//获取旧图片的路径
			ShopIntroduce oldShopIntroduce = shopIntroduceDAO.findById(id);
			String oldImg = oldShopIntroduce.getImg();
			String oldLogo = oldShopIntroduce.getLogo();
			//先删除数据库中数据
			shopIntroduceDAO.deleteById(id);
			//再删除图片文件
			if(oldImg != null && !oldImg.equals("") && oldLogo != null && !oldLogo.equals("")){
				new File(SystemConfig.getProjectBasePath() + oldImg).delete();
				new File(SystemConfig.getProjectBasePath() + oldLogo).delete();
			}else if(oldImg != null && !oldImg.equals("")){
				new File(SystemConfig.getProjectBasePath() + oldImg).delete();
			}else if(oldLogo != null && !oldLogo.equals("")){
				new File(SystemConfig.getProjectBasePath() + oldLogo).delete();
			}
		}
		
	}
	/**
	 * @Name: findAllShopIntroduce
	 * @Description: 查询本店介绍对象集合信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-06（创建日期）
	 * @Parameters: 无
	 * @Return: List<ShopIntroduce> idList 本店介绍对象集合
	 */
	@Override
	public List<ShopIntroduce> findAllShopIntroduce() {
		// TODO Auto-generated method stub
//		return shopIntroduceDAO.findByExample(new ShopIntroduce());
		return this.shopIntroduceDAO.findAllShopIntroduce();
	}
	/**
	 * @Name: findAllShopIntroduceByLv
	 * @Description: 查询本店介绍对象集合信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-10-31（创建日期）
	 * @Parameters: ShopIntroduce si 本店介绍对象
	 * @Return: List<ShopIntroduce> idList 本店介绍对象集合
	 */
	@Override
	public List<ShopIntroduce> findAllShopIntroduceByLv(ShopIntroduce si) {
		// TODO Auto-generated method stub
		return this.shopIntroduceDAO.findAllShopIntroduceByLv(si);
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopIntroduce> findShopIntroduce(Integer lv,Integer id) {
		// TODO Auto-generated method stub
		if(id != null){
			return shopIntroduceDAO.findByHql("FROM ShopIntroduce WHERE lv =  " + lv + " AND id NOT IN (" +  id  +  ",1,2,3,4) ORDER BY position ASC");
		}
		return shopIntroduceDAO.findByHql("FROM ShopIntroduce WHERE lv =  " + lv + " AND id NOT IN (1,2,3,4) ORDER BY position ASC");
	}
	@SuppressWarnings("unchecked")
	@Override
	public List<ShopIntroduce> findShopIntroduceByParentID(Integer parentID,
			Integer lv,Integer id) {
		// TODO Auto-generated method stub
		if(id != null){
			return shopIntroduceDAO.findByHql("FROM ShopIntroduce WHERE lv =  " + lv + " AND parentID = " + parentID + " AND id NOT IN (" + id + ") ORDER BY position ASC");
		}
		return shopIntroduceDAO.findByHql("FROM ShopIntroduce WHERE lv =  " + lv + " AND parentID = " + parentID + " ORDER BY position ASC");
	}
	
	
	
	@Override
	public PageBean<ShopIntroduce> findShopIntroduceByParentIsNull(ShopIntroduce shopIntroduce, Integer pageNo, Integer pageSize)
	   {
	     return this.shopIntroduceDAO.findPage(shopIntroduce, pageNo.intValue(), pageSize.intValue());
	   }
	
	
	
	
	
	public Integer getPos() {
		return pos;
	}
	public void setPos(Integer pos) {
		this.pos = pos;
	}
	/* (non-Javadoc)  
	
	 * <p>Title: findShopIntroduceByParentIsNull</p>  
	
	 * <p>Description: </p>  
	
	 * @param paramShopIntroduce
	 * @param paramInteger1
	 * @param paramInteger2
	 * @return  
	
	 * @see com.boyue.karaoke.service.IShopIntroduceService#findShopIntroduceByParentIsNull(com.boyue.karaoke.model.ShopIntroduce, java.lang.Integer, java.lang.Integer)  
	
	 */

}
