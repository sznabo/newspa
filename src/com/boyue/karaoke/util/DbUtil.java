package com.boyue.karaoke.util;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.sql.*;
import java.util.Properties;

import com.boyue.karaoke.model.CloudsManage;
import com.boyue.karaoke.web.interceptor.LogConfig;





public class DbUtil {
 public	static CloudsManage cloudsManage = new CloudsManage();
	   static{ 
	        try {   
	        	Properties p =  new Properties();
				InputStream in = DbUtil.class.getResourceAsStream("/config.properties");
				p.load(in);
				cloudsManage.setNodeIp(p.getProperty("ip"));
				cloudsManage.setDataPort(Integer.valueOf(p.getProperty("port")));
				cloudsManage.setDataName(p.getProperty("data_name"));
				cloudsManage.setDataUser(p.getProperty("data_user")) ;
				cloudsManage.setDataPass(p.getProperty("data_pass"));
				cloudsManage.setStartLine(Integer.valueOf(p.getProperty("start_line")));
				cloudsManage.setEndLine(Integer.valueOf(p.getProperty("end_line")));
	        } catch (FileNotFoundException e) {   
	            e.printStackTrace();   
	           
	        } catch (IOException e) {          
	            
	        }   
	        
	    } 
    public static Connection getConnection() throws Exception{
        //查找出云端服务器信息
        Connection conn=null;
        try{
        	if(cloudsManage != null){
            //  获取驱动
//        	jdbc:mysql://192.168.0.199:3306/dbadapter?useUnicode=true&amp;characterEncoding=utf8
            String jdbcName= "com.mysql.jdbc.Driver";
//            String url= SystemConfig.getConfig("url");
            String userName=  cloudsManage.getDataUser();
            String pasaaword= cloudsManage.getDataPass();
            String ip = cloudsManage.getNodeIp() ;
            Integer port = cloudsManage.getDataPort();
            String database = cloudsManage.getDataName();
            String url= "jdbc:mysql://"+ip+":"+port+"/"+database+"?useUnicode=true&amp;characterEncoding=utf8";
            Class.forName(jdbcName);
            conn= DriverManager.getConnection(url, userName, pasaaword);
    		
        	}
        }catch(Exception e){
            e.printStackTrace();
        //    System.out.print(e.getMessage());
        }
        return conn;
    }


    // 关闭无结果集(添加、修改、删除)
    public static void close(Statement stat,Connection conn)throws Exception{
        try {
            if(stat != null){
                stat.close();
            }
            if(conn!=null){
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("关闭失败");
        }
    }

    // 关闭有结果集(查询)
    public static void close(ResultSet rs,Statement stat,Connection conn){

        try {
            if(rs !=null){
                rs.close();
            }
            if(stat != null){
                stat.close();
            }
            if(conn != null){
                conn.close();
            }
        } catch (SQLException e) {
            e.printStackTrace();
            throw new RuntimeException("关闭失败");
        }

    }

    public static void close(Connection conn){

        if(conn != null){
            try {
                conn.close();
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
          //      System.out.print(e.getMessage());
            }
        }
    }
    
    public static void main (String args[]) {
//    	getconfig();
	}


}
