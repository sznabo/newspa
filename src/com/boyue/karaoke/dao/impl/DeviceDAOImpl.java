package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.DeviceDAO;
import com.boyue.karaoke.model.Calling;
import com.boyue.karaoke.model.Device;

/**
 *  
 *  
 *
 */
@Repository
public class DeviceDAOImpl extends BaseDAOImpl<Device> implements DeviceDAO {

	/**
	 * @Name: updateRunStatus
	 * @Description: 组织SQL语句根据设备运行状态更新设备对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-12（创建日期）
	 * @Parameters: int runStatus 设备运行状态
	 * @Return: 无
	 */
	@Override
	public void updateRunStatus(int runStatus) {
		this.executeSql("update device set run_status=" + runStatus);
	}

	/**
	 * @Name: findByProduct
	 * @Description: 组织HQL语句根据产品ID查询设备对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-12（创建日期）
	 * @Parameters: int productId 产品ID
	 * @Return: List<Device> 设备对象集合
	 */
	@Override
	public List<Device> findByProduct(int productId) {
		return this.findByHql("FROM Device WHERE product.id=" + productId);
	}

	/**
	 * @Name: findPage
	 * @Description: 分页查询对象信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-12（创建日期）
	 * @Parameters: Device device 分页中用到的对象 int pageNumber 分页中的当前页 int pageSize
	 *              分页中的页数 List<Criterion> params 分页用到的参数
	 * @Return: PageBean<Device> 对象分页后的PageBean
	 */
	@Override
	public PageBean<Device> findPage(Device device, int pageNumber, int pageSize, List<Criterion> params) {
		// TODO Auto-generated method stub
		return super.findPage(pageNumber, pageSize, Device.class, params, Order.desc("id"));
	}

	/**
	 * @Name: findDeviveById
	 * @Description: 根据ID查询设备信息
	 * @Author: 罗建波（作者）
	 * @Version: V1.00（版本号）
	 * @Create Date: 2014-08-21（创建日期）
	 * @Parameters: Integer id 设备ID
	 * @Return: PageBean<Device> 对象分页后的PageBean
	 */
	@Override
	public Device findDeviveById(Integer id) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public PageBean<Device> findPage(Device dev, int pageNo, int pageSize, List<Criterion> params, Order asc,
			Order desc) {
		// TODO Auto-generated method stub
		return super.findPage(pageNo, pageSize, Device.class, params,
				Order.asc(dev.getCalling().getStatus().toString()), Order.desc(dev.getCalling().getTime().toString()));
	}

	public Integer findByMaxCount() {
		return Integer.valueOf(getSessionFactory().getCurrentSession().createSQLQuery("select count(*) from device")
				.list().get(0).toString());
	}

}
