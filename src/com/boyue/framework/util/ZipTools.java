package com.boyue.framework.util;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileOutputStream;
import java.util.zip.ZipEntry;
import java.util.zip.ZipFile;
import java.util.zip.ZipInputStream;
import java.util.zip.ZipOutputStream;

/**
 * author: luoweibin date:2012-1-10 description:
 * 
 */
public class ZipTools {
	/**
	 * 压缩文件
	 * 
	 * @param zipFileName
	 *            保存的压缩包文件路径
	 * @param inputFile
	 *            需要压缩的文件夹或者文件路径
	 * @throws Exception
	 */
	public void zip(String zipFileName, String filePath, boolean isDelete)
			throws Exception {

		zip(zipFileName, new File(filePath), isDelete);
	}

	public void zip(String zipFileName, File inputFile, boolean isDelete)
			throws Exception {

		ZipOutputStream out = new ZipOutputStream(new FileOutputStream(
				zipFileName));

		if (!inputFile.exists()) {
			throw new FileNotFoundException("在指定路径未找到需要压缩的文件！");
		}

		zip(out, inputFile, "", isDelete);// 递归压缩方法
	//	System.out.println("Zip Done.");
		out.close();
	}

	/**
	 * 递归压缩方法
	 * 
	 * @param out
	 *            压缩包输出流
	 * @param f
	 *            需要压缩的文件
	 * @param base
	 *            压缩的路径
	 * @throws Exception
	 */
	private void zip(ZipOutputStream out, File f, String base, boolean isDelete)
			throws Exception {

	//	System.out.println("Zipping : " + f.getPath()); // 记录日志，开始压缩
		if (f.isDirectory()) { // 如果是文件夹，则获取下面的所有文件
			File[] fl = f.listFiles();
			out.putNextEntry(new ZipEntry(base + "/"));
			base = base.length() == 0 ? "" : base + "/";
			for (int i = 0; i < fl.length; i++) {
				zip(out, fl[i], base + fl[i].getName(), isDelete);
			}
		} else { // 如果是文件，则压缩
			out.putNextEntry(new ZipEntry(base)); // 生成下一个压缩节点
			FileInputStream in = new FileInputStream(f); // 读取文件内容
			byte[] buffer = new byte[1024 * 8];
			 int readLen = 0;
			 while ((readLen = in.read(buffer, 0, 1024 * 8)) != -1) {
				 out.write(buffer, 0, readLen);
			 }
			in.close();
			out.flush();
		}
		if (isDelete) {
			f.delete();
		}
	}

	public void unZip(String zipFilePath, String fileSavePath, boolean isDelete)
			throws Exception {

		if (!fileSavePath.endsWith("//")) {
			fileSavePath += "//";
		}

		File file = new File(zipFilePath);
		ZipFile zipFile = null;
		File savePath = new File(fileSavePath);

		// 验证待解压文件是否存在
		if (!file.exists()) {
			throw new FileNotFoundException("在指定路径未找到ZIP压缩文件！");
		}
		zipFile = new ZipFile(file);

		// 创建解压缩目录
		if (!savePath.exists()) {
			savePath.mkdirs();
		}

		ZipInputStream zis = new ZipInputStream(new FileInputStream(file));
		FileOutputStream fos = null;
		ZipEntry entry = null;
		int b;

		while ((entry = zis.getNextEntry()) != null) {
			file = new File(fileSavePath + entry.getName());
			if (entry.isDirectory()) {
				// 目录
		//		System.out.println("create dir : " + file.getPath());
				file.mkdirs();
			} else {
				// 文件
		//		System.out.println("create file: " + file.getPath());
				fos = new FileOutputStream(file);
				while ((b = zis.read()) != -1) {
					fos.write(b);
				}
				fos.close();
			}
		}

		zis.close();
		if (isDelete) {
			new File(zipFilePath).delete();
		}

	//	System.out.println("unZip Done.");

	}

	public static void main(String[] args) {

		ZipTools cpr = new ZipTools();
		try {
			cpr.zip("D:/apache-tomcat-6.0.32/webapps/adserver/download/program_update_tmp/test.zip", "D:/apache-tomcat-6.0.32/webapps/adserver/download/program_update_tmp/test", false);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
