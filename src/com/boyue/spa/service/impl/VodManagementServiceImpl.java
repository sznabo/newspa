package com.boyue.spa.service.impl;

import java.util.ArrayList;
import java.util.List;

import com.boyue.spa.domain.Vodvideo;
import com.boyue.spa.service.VodManagementService;



public class VodManagementServiceImpl implements VodManagementService {

	
	@Override
	public List<Vodvideo> browseVodByVodPartID(int vodpartid) {
		// TODO Auto-generated method stub
		String hql = "from Vodvideo as vod where vod.vodpartid = '"+vodpartid+"' order by vod.id desc";
		List<Vodvideo> list = new ArrayList<Vodvideo>();
//		List listhql = dao.query(hql);
//		if(listhql!=null&&!listhql.isEmpty()){
//			int siz=listhql.size();
//			Vodvideo vodpgram = null;
//			for(int i=0;i<siz;i++){
//				vodpgram = new Vodvideo();
//				vodpgram = (Vodvideo) listhql.get(i);
//				list.add(vodpgram);
//			}
//		}
		return list;
	}	
	
	/**保存视频*/
	@Override
	public boolean saveVoidprogram(Vodvideo model) {
		// TODO Auto-generated method stub
		boolean status =false;
		try {
		//	dao.save(model);
			status = true;
		} catch (Exception e) {
			// TODO: handle exception
		}
		return status;
	}	

	/**通过ID获得对象*/
	@Override
	public Vodvideo loadByID(int vodgramID) {
		// TODO Auto-generated method stub
		//return (Vodvideo) dao.loadById(Vodvideo.class, vodgramID);
		return null;
	}
	

//	public BaseDAO getDao() {
//		return dao;
//	}
//	public void setDao(BaseDAO dao) {
//		this.dao = dao;
//	}
}
