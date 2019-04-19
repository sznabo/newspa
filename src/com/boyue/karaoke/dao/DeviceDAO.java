package com.boyue.karaoke.dao;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.DAO;
import com.boyue.karaoke.model.Calling;
import com.boyue.karaoke.model.Device;

/**
 *  
 *  
 *
 */
public abstract interface DeviceDAO extends DAO<Device>  {

	public void updateRunStatus(int runStatus);

	/**
	 * @param productId
	 * @return
	 */
	 public abstract List<Device> findByProduct(int productId);

	 public abstract PageBean<Device> findPage(Device device, int pageNumber,
			int pageSize, List<Criterion> params);

	 public abstract Device findDeviveById(Integer id);

	 public abstract PageBean<Device> findPage(Device device, int pageNo, int pageSize,
			List<Criterion> params, Order asc, Order desc);
		
	 public abstract Integer findByMaxCount();
}
