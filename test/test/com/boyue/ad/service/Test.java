package test.com.boyue.ad.service;

import java.io.File;
import java.io.IOException;
import java.util.HashMap;
import java.util.Map;

import org.apache.commons.io.FileUtils;

public class Test {

	static Map<String, String> cities = new HashMap<String, String>();
	
	public static void main(String[] args) throws IOException {
//		String ss = FileUtils.readFileToString(new File("E://city.txt"), "UTF-8");
//		System.out.println(ss);
//		String[] arr = ss.split(":");
//		
//		
//		int cnt = 0;
//		for (String s : arr) {
//			if ("北京".equals(s)) {
//				continue;
//			}
//			String code = s.substring(0, 9);
//			String name = s.substring(9);
//			System.out.println("\"" + code + "\");");
//			
//			System.out.print("cities.put(\"" + name + "\",");
//			System.out.println(cnt ++);
//		}
//		System.out.println(0/0);
		
		File f = new File("F:/art_img/a.jpg");
		for (int i = 0; i < 1000; i++) {
			FileUtils.copyFile(f, new File("F:/art_img/" + (i+1) + ".jpg"));
		}
		
	}
}
