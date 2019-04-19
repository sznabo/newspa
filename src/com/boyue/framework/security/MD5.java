

/*
 * 文 件 名 : MD5.java
 * 版    权 : China Machi.Co.,Ltd.Copyright 2009-2011.All rights reserved
 * 描    述 : <描述>
 * 修 改 人 : 许洋
 * 修改时间 : 2011-2-11
 * 跟踪单号 : <跟踪单号>
 * 修改单号 : <修改单号>
 * 修改内容 : <修改内容>
 */

package com.boyue.framework.security;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.security.SecureRandom;
import java.util.Arrays;


/**
 * MD5加密解密类
 * <功能详细描述>
 *
 * @author  许洋
 * @version [版本号,2011-2-11]
 * @see     [相关类/方法]
 * @since   [产品/模块]
 */
public final class MD5
{
    
	private final static String HEX_NUMS_STR = "0123456789ABCDEF";
	private final static Integer SALT_LENGTH = 8;

	/**
	 * 将16进制字符串转换成数组
	 * 
	 * @return byte[]
	 * @author jacob
	 * */
	private static byte[] hexStringToByte(String hex) {
		/* len为什么是hex.length() / 2 ?
		 * 首先，hex是一个字符串，里面的内容是像16进制那样的char数组
		 * 用2个16进制数字可以表示1个byte，所以要求得这些char[]可以转化成什么样的byte[]，首先可以确定的就是长度为这个char[]的一半
		 */
		int len = (hex.length() / 2);
		byte[] result = new byte[len];
		char[] hexChars = hex.toCharArray();
		for (int i = 0; i < len; i++) {
			int pos = i * 2;
			result[i] = (byte) (HEX_NUMS_STR.indexOf(hexChars[pos]) << 4 | HEX_NUMS_STR
					.indexOf(hexChars[pos + 1]));
		}
		return result;
	}
	
	/**
	 * 将数组转换成16进制字符串
	 * 
	 * @return String
	 * @author jacob
	 *
	 * */
	private static String byteToHexString(byte[] salt){
		StringBuffer hexString = new StringBuffer();
		for (int i = 0; i < salt.length; i++) {
			String hex = Integer.toHexString(salt[i] & 0xFF);
			if(hex.length() == 1){
				hex = '0' + hex;
			}
			hexString.append(hex.toUpperCase());
		}
		return hexString.toString();
	}
	
	/**
	 * 比较是否一致
	 * @param input 输入的明文
	 * @param encryptStr 密文
	 * @return
	 */
	public static boolean valid(String input, String encryptStr) {
		try {
			byte[] pwIndb =  hexStringToByte(encryptStr);
			//定义salt
			byte[] salt = new byte[SALT_LENGTH];
			System.arraycopy(pwIndb, 0, salt, 0, SALT_LENGTH);
			//创建消息摘要对象
			MessageDigest md = MessageDigest.getInstance("MD5");
			//将盐数据传入消息摘要对象
			md.update(salt);
			md.update(input.getBytes("UTF-8"));
			byte[] digest = md.digest();
			//声明一个对象接收数据库中的口令消息摘要
			byte[] digestIndb = new byte[pwIndb.length - SALT_LENGTH];
			//获得数据库中口令的摘要
			System.arraycopy(pwIndb, SALT_LENGTH, digestIndb, 0,digestIndb.length);
			//比较根据输入口令生成的消息摘要和数据库中的口令摘要是否相同
			if(Arrays.equals(digest, digestIndb)){
				//口令匹配相同
				return true;
			}else{
				return false;
			}
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	/**
	 * 获得md5之后的16进制字符
	 * @param input 用户输入密码字符
	 * @return String md5加密后密码字符
	 * @throws NoSuchAlgorithmException
	 * @throws UnsupportedEncodingException
	 */
	public static String encrypt2Str(String input) {
		try {
			//拿到一个随机数组，作为盐
			byte[] pwd = null;
			SecureRandom sc= new SecureRandom();
			byte[] salt = new byte[SALT_LENGTH];
			sc.nextBytes(salt);
			
			//声明摘要对象，并生成
			MessageDigest md = MessageDigest.getInstance("MD5");
			md.update(salt);
			md.update(input.getBytes("UTF-8"));
			byte[] digest = md.digest();
			
			pwd = new byte[salt.length + digest.length];
			System.arraycopy(salt, 0, pwd, 0, SALT_LENGTH);
			System.arraycopy(digest, 0, pwd, SALT_LENGTH, digest.length);
			return byteToHexString(pwd);
		} catch (Exception e) {
			e.printStackTrace();
			throw new RuntimeException(e);
		}
	}
	
	public static void main(String[] args) throws Exception {
		String a = encrypt2Str("123456");
		System.out.println(a.length());
		System.out.println(valid("123456", a));
		System.out.println(a);
	}

}
