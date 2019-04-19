package com.boyue.spa.service;

import java.util.List;

import org.hibernate.criterion.Criterion;

import com.boyue.framework.common.PageBean;
import com.boyue.spa.domain.Vodvideo;




public interface VodManagementService {
	
	/**加载某一栏目（类型）下的所有视频 */
	public List<Vodvideo> browseVodByVodPartID(int vodpartid);
	/**保存视频*/
	public boolean saveVoidprogram(Vodvideo model);
	/**通过VodprogramID获得该对象*/
	public Vodvideo loadByID(int vodgramID);
}
