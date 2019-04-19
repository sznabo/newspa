package com.boyue.karaoke.dao.impl;

import java.util.List;

import org.hibernate.criterion.Criterion;
import org.hibernate.criterion.Order;
import org.springframework.stereotype.Repository;

import com.boyue.framework.common.PageBean;
import com.boyue.framework.dao.BaseDAOImpl;
import com.boyue.karaoke.dao.TechnicianDao;
import com.boyue.karaoke.model.Technician;

@Repository
public class TechnicianDaoImpl extends BaseDAOImpl<Technician> implements TechnicianDao{

	@Override
	public PageBean<Technician> findPage(Technician model, int pageNo,
			int pageSize, List<Criterion> params) {
		return super.findPage(pageNo, pageSize, Technician.class, params, Order.desc("id"));
	}

	@Override
	public Integer findBianhao() {
		String hql = "from Technician order by number desc";
		List<Technician> lists = super.findByHql(hql);
		if(lists != null && lists.size() > 0){
			return lists.get(0).getNumber()+1;
		}else {
			return 100;
		}
		
	}

	@Override
	public boolean findByLevel(Integer id) {
		List<Technician> lists = super.findByHql("from Technician where levelId ="+id);
		return lists!=null&&lists.size()>0?false:true;
	}

	@Override
	public boolean findByType(Integer id) {
		List<Technician> lists = super.findByHql("from Technician where typeId ="+id);
		return lists!=null&&lists.size()>0?false:true;
	}

	@Override
	public List<Technician> findByTypeId(Integer TypeId) {
		List<Technician> lists = super.findByHql("from Technician where typeId ="+TypeId);
		if(lists != null && lists.size() > 0){
			for(Technician t:lists){
				
			}
		}
		return lists;
	}


	
	
}
