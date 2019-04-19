package com.boyue.karaoke.util;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileWriter;
import java.io.InputStreamReader;
import java.io.LineNumberReader;

/**
 *
 * @author ben
 * @date   2012-12-21 下午01:55:51
 *
 */
public class HardInfoUtil {

	private static  String info;
	
	public synchronized static String getInfo() throws Exception {
		//c盘硬盘序列号_mac地址
		if (info == null) {
		 info = getHardDiskSN("c") + "_" + getMac();
		}
		return info;
	}
	
	/**
	 * 获取硬盘序列号
	 * 
	 * @param drive
	 *            盘符
	 * @return
	 * @throws Exception 
	 */
	private synchronized static String getHardDiskSN(String drive) throws Exception {
		String result = "";
		try {       
			File file = File.createTempFile("realhowto", ".vbs");
			FileWriter fw = new java.io.FileWriter(file);

			String vbs = "Set objFSO = CreateObject(\"Scripting.FileSystemObject\")\n"
					+ "Set colDrives = objFSO.Drives\n"
					+ "Set objDrive = colDrives.item(\""
					+ drive
					+ "\")\n"
					+ "Wscript.Echo objDrive.SerialNumber"; // see note
			fw.write(vbs);
			fw.close();
			Process p = Runtime.getRuntime().exec(
					"cscript //NoLogo " + file.getPath());
			BufferedReader input = new BufferedReader(new InputStreamReader(p
					.getInputStream()));
			String line;
			while ((line = input.readLine()) != null) {
				result += line;
			}
			input.close();
			file.delete();
		} catch (Exception e) {
			e.printStackTrace();
			throw new Exception("无法获取硬盘信息");
		}
		return result.trim();
	}

	/**
	 * 获取MAC地址
	 * @throws Exception 
	 */
	private static String getMac() throws Exception {
		String result = "";
		try {
			Process process = Runtime.getRuntime().exec("ipconfig /all");
			InputStreamReader ir = new InputStreamReader(process
					.getInputStream());
			LineNumberReader input = new LineNumberReader(ir);
			String line;
			while ((line = input.readLine()) != null)

				if (line.indexOf("Physical Address") > 0) {

					String MACAddr = line.substring(line.indexOf("-") - 2);

					result = MACAddr;
					return result;
				}
		} catch (java.io.IOException e) {
			System.err.println("IOException " + e.getMessage());
			throw new Exception("无法获取MAC地址");
		}
		return result;
	}
	
	public static void main(String[] args) throws Exception {
		System.out.println(getInfo());
	}
}
