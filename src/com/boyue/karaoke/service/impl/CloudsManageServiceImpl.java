package com.boyue.karaoke.service.impl;

import java.io.IOException;
import java.io.InputStream;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.util.List;
import java.util.Properties;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.boyue.framework.common.PageBean;
import com.boyue.karaoke.dao.CloudsManageDao;
import com.boyue.karaoke.model.CloudsManage;
import com.boyue.karaoke.service.CloudsManageService;
import com.boyue.karaoke.util.DbUtil;

@Service
public class CloudsManageServiceImpl implements CloudsManageService{
	@Autowired
	private CloudsManageDao cloudsManageDao;

	@Override
	public PageBean<CloudsManage> findPage(CloudsManage model, int pageNo,
			int pageSize) {
		
		return cloudsManageDao.findPage(model, pageNo, pageSize);
	}

	@Override
	public boolean updateClounds(CloudsManage model) {
		boolean status = false;
		try{
			cloudsManageDao.update(model);
			status = true;
			
		}catch (Exception e) {
			e.printStackTrace();
		}
		return status;
	}

	@Override
	public CloudsManage findById(Integer id) {
		
		return cloudsManageDao.findById(id);
	}

	@Override
	public void changeOnline() {
		Connection conn = null;
		
	      try{
	            conn=DbUtil.getConnection();
	           CloudsManage cloudsManage = DbUtil.cloudsManage;
	            if(cloudsManage != null){
	            String sql="update nodemanage set last_connect=now(),online=1 where id in (select t.id from(select * from nodemanage limit ?,?) as t )";
	                PreparedStatement ps=conn.prepareStatement(sql) ;
	                //设置从第几条开始
	                if(cloudsManage != null){
	                	ps.setInt(1, cloudsManage.getStartLine());
	                	ps.setInt(2, cloudsManage.getEndLine());
	                }else{
	                	ps.setInt(1, 0);
	 	                ps.setInt(2, 1);
					}
	               
	                ps.executeUpdate();
	                if(ps !=null){
	                    ps.close();
	                    ps=null;
	                }
	            }
    
	        }

	        catch (Exception e){
	            e.printStackTrace();
	            
	        }  finally {
	            try{
	                DbUtil.close(conn);
	            }   catch (Exception e){
	                e.printStackTrace();
//	            return;        //出现异常马上停止
	            }
	           
	        }
		
	}
	
	
	public String read(){
		InputStream inputStream = this.getClass().getClassLoader().getResourceAsStream("config.properties");   
		  Properties p = new Properties();   
		  try {   
		   p.load(inputStream);   
		  } catch (IOException e1) {   
		   e1.printStackTrace();   
		  }   
		return p.getProperty("end_line");  
		
	}
	
	@Override
	public CloudsManage findClouds() {
		CloudsManage c = new CloudsManage();
		List<CloudsManage> lists = cloudsManageDao.findPage(c, 1, 10).getElements();
		if(lists != null && lists.size()>0){
			return lists.get(0);
		}else{
			return null;
		}
		
	}
	

}
