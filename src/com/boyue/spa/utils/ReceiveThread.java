package com.boyue.spa.utils;

import java.io.IOException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.SocketException;


//接收
public class ReceiveThread extends Thread {

	public Integer port;// 端口

	public ReceiveThread(Integer port) {

		this.port = port;
	}

	@Override
	public void run() {
		getsss();

		/*
		 * User abc=new User(); abc.setUserName("12"); abc.setPassword("as"); String
		 * datad = XMLUtil.convertToXml(abc);
		 */

		/*
		 * 接收端的使用步骤 1. 建立udp的服务 2. 准备空 的数据 包接收数据。 3. 调用udp的服务接收数据。 4. 关闭资源
		 */
	}

	public synchronized void getsss() {

		DatagramSocket socket = null;
		try {
			// 建立udp的服务 ，并且要监听一个端口。
			socket = new DatagramSocket(port);

			// 准备空的数据包用于存放数据。
			byte[] buf = new byte[1024];
			DatagramPacket datagramPacket = new DatagramPacket(buf, buf.length);

			// 调用udp的服务接收数据
			socket.receive(datagramPacket);// receive是一个阻塞型的方法，没有接收到数据包之前会一直等待。 数据实际上就是存储到了byte的自己数组中了。

			String backMes = new String(datagramPacket.getData(), "utf-8");
			System.out.println("接收的数据：" + backMes);

			// 调用发送方法
			ReceiveThread sddd=new ReceiveThread(port);
			sddd.start();
		} catch (SocketException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			socket.close();// 关闭资源
		}
	}

}

//String a=iReceivedata.receivedata(backMes.trim());
//UserBean userTest =(UserBean)XMLUtil.convertXmlStrToObject(UserBean.class,
//backMes.trim());//trim()处理数据中的空字符串
//System.out.println("将XML转换后的数据:\n
//姓名:"+userTest.getName()+"年龄:"+userTest.getAge());