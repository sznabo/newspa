package com.boyue.karaoke.util;

import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


public class PropertiesUtil {
	public static String Path = new String();
	   static{ 
	        try {   
	        	Properties p =  new Properties();
				InputStream in = DbUtil.class.getResourceAsStream("/config.properties");
				p.load(in);
				Path= p.getProperty("music_path");
	        } catch (FileNotFoundException e) {   
	            e.printStackTrace();   
	           
	        } catch (IOException e) {          
	            
	        }   
	        
	    } 
	   

}
