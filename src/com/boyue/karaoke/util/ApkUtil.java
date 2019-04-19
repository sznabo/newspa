package com.boyue.karaoke.util;

import java.io.File;
import java.util.Enumeration;
import java.util.Set;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import org.xmlpull.v1.XmlPullParser;

import com.boyue.framework.exception.IllegalDataException;
import com.boyue.karaoke.model.AppInfo;

import brut.androlib.AndrolibException;
import brut.androlib.ApkDecoder;
import brut.androlib.res.data.ResPackage;
import brut.androlib.res.decoder.AXmlResourceParser;

/**
 *
 * @author ben
 * @date   2014-7-28 下午2:36:24
 *
 */
public class ApkUtil {
	
	private static final String SPLIT_REGEX = "(: )|(=')|(' )|'";
	
	public static String getAPKPackageName(String apkpath) {
		ApkDecoder d = new ApkDecoder();
		d.setApkFile(new File(apkpath));
		try {
			Set<ResPackage> p = d.getResTable().listMainPackages();
			for (ResPackage r : p) {// 这里set最大只会等于1
				return r.getName();
			}
		} catch (AndrolibException e) {
			throw new IllegalDataException("获取APK包名失败。");
		}
		return null;
	}
	
	public static String getAPKPackageName1(String apkpath) {
		int length;
	    ZipFile zipFile;
	    try {   //
	        zipFile = new ZipFile(new File(apkpath));
	        Enumeration enumeration = zipFile.entries();
	        ZipEntry zipEntry = zipFile.getEntry(("AndroidManifest.xml"));
	            AXmlResourceParser parser = new AXmlResourceParser();
	            parser.open(zipFile.getInputStream(zipEntry));
	            boolean flag = true;
	            while (flag) {
	 
	                int type = parser.next();
	 
	                if (type == XmlPullParser.START_TAG) {
	                    int count = parser.getAttributeCount();
	                    for (int i = 0; i < count; i++) {
	                        String name = parser.getAttributeName(i);
	                        String value = parser.getAttributeValue(i);
	                        if (value.contains("MAIN")) {
//	                            System.out.println(name + "-----------" + value);
	                            flag = false;
	                            break;
	                        }else if("package".equals(name)){
//	                            System.out.println(name+"   "+value);
	                            return value;
	                         }
	                        else{
//	                             System.out.println(name+" aa  "+value); 
	                         }
	                    }//end for
	                }
	            }// end while       
	    } catch (Exception e) {
	    	e.printStackTrace();
	    }
	    
	    return "0";
//		ApkDecoder d = new ApkDecoder();
//		d.setApkFile(new File(apkpath));
//		try {
//			d.getResTable();
//			Set<ResPackage> p = d.getResTable().listMainPackages();
//			for (ResPackage r : p) {// 这里set最大只会等于1
//				return r.getName();
//			}
//		} catch (AndrolibException e) {
//			e.printStackTrace();
//			throw new IllegalDataException("获取APK包名失败。");
//		}
//		return null;
	}
//	 //获取当前版本号
//	  private  String getAppVersionName(Context context) {
//			String versionName = "";
//			try {
//				PackageManager packageManager = context.getPackageManager();
//				PackageInfo packageInfo = packageManager.getPackageInfo("cn.testgethandsetinfo", 0);
//				versionName = packageInfo.versionName;
//				if (TextUtils.isEmpty(versionName)) {
//					return "";
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//			}
//			return versionName;
//	  }

	
	/**
      * 分离出包名、版本等信息。
      * 
      * @param apkInfo
      * @param packageSource
      */
     public static String splitPackageInfo(AppInfo appInfo, String packageSource) {
         String[] packageInfo = packageSource.split(SPLIT_REGEX);
//         appInfo.setPackageName(packageInfo[2]);
//         appInfo.setVersionCode(packageInfo[4]);
//         appInfo.setVersionName(packageInfo[6]);
         appInfo.setVersion(packageInfo[0]);
         return appInfo.getVersion();
     }
	public static void main(String[] args) {
//		System.out.println(SystemConfig.getProjectBasePath());
		System.err.println("apk包名: "+ ApkUtil.getAPKPackageName("F:/ben/win8/超力显游戏APK/dadishutv_v1.0_【www.znds.com】.apk"));
//		System.out.println("apk包名: "+ ApkUtil.splitPackageInfo(new AppInfo(),"F:/ben/win8/超力显游戏APK/dadishutv_v1.0_【www.znds.com】.apk"));
	}
}
