package com.boyue.karaoke.util;

import java.io.File;
import java.text.ParseException;
import java.util.ArrayList;
import java.util.List;

import org.apache.commons.codec.binary.Base64;
import org.apache.commons.io.FileUtils;
import org.apache.commons.lang.ArrayUtils;
import org.apache.commons.lang.time.DateUtils;

/**
 *
 * @author ben
 * @date   2012-12-21 下午06:39:09
 *
 */
public class DecodeUtil {
	private static final int BLOCK_SIZE = 128;
	//rsa公钥
	public static byte[] PUBLIC_KEY = Base64.decodeBase64("MIGfMA0GCSqGSIb3DQEBAQUAA4GNADCBiQKBgQC5xTKobHyZLDGzW4uFzLSwot7x7r9CyxmVCgyKfc2bc/V+DukKh1w4d+El00jCtQx+D8bGalt7/Z3wwfSS/1Wtif+anVxo5GTA9rhRldGvdDlfiSa88b9MEmfnGbGF9gao8y7fKUel4Ji6fAOjbXdPPQTJSFqVBU9TyynYn2+g8wIDAQAB");
	
	public static LicenceInfo getInfoFromKey(String file) throws Exception {
		List<String> infoStrList = new ArrayList<String>();
		byte[] all = FileUtils.readFileToByteArray(new File(file));
		//加密处理每一段数据是128个字节
		int len = all.length/BLOCK_SIZE;
		for (int i = 0; i < len; i++) {
			byte[] block = ArrayUtils.subarray(all, i * BLOCK_SIZE, (i+1) * BLOCK_SIZE);
			byte[] deBytes = RSACoder.decryptByPublicKey(block, PUBLIC_KEY);
			infoStrList.add(new String(deBytes));
		}
		
		return strListToInfo(infoStrList);
	}
	
	/**
	 * 顺序是 version, num, dateFrom, dateTo, hardInfo, sn
	 * @param infoStrList
	 * @return
	 * @throws ParseException 
	 */
	private static LicenceInfo strListToInfo(List<String> infoStrList) throws ParseException {
		LicenceInfo info = new LicenceInfo();
		info.setVersion(infoStrList.get(0));
		info.setNum(Integer.valueOf(infoStrList.get(1)));
		info.setDateTo(DateUtils.parseDate(infoStrList.get(2), new String[]{"yyyy-MM-dd"}));
		info.setHardInfo(infoStrList.get(3));
		info.setSn(infoStrList.get(4));
		info.setNotLimitMemberNum(Boolean.valueOf(infoStrList.get(5)));
		info.setNotLimitUserTime(Boolean.valueOf(infoStrList.get(6)));
		return info;
	}
	
	public static void main(String[] args) throws Exception {
		LicenceInfo info = new DecodeUtil().getInfoFromKey("D:/web_project_myeclipse/EncryptTools/bin/boyue.sn");
		System.out.println(info.getVersion());
		System.out.println(info.getNum());
		System.out.println(info.getDateTo());
		System.out.println(info.getHardInfo());
		System.out.println(info.getSn());
		System.out.println(info.isNotLimitMemberNum());
		System.out.println(info.isNotLimitUserTime());
	}
}
