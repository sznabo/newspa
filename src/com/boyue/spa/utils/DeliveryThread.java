package com.boyue.spa.utils;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.net.DatagramPacket;
import java.net.DatagramSocket;
import java.net.InetAddress;
import java.net.SocketException;
import java.net.UnknownHostException;
//发送
public class DeliveryThread extends Thread{
	
	public InetAddress ip;  //接收方地址ַ
	public Integer port;   //端口
	public String data; //数据
	
	public DeliveryThread( String ip, Integer port, String data) {
		try {
			this.ip = InetAddress.getByName(ip);
		} catch (UnknownHostException e) {
			e.printStackTrace();
		}
		this.port = port;
		this.data = data;
	}
	
@Override
public void run() {
	//发送			
	getsd();
}

public synchronized void getsd() {
	
	
	DatagramSocket socket;
	try {
			socket = new DatagramSocket();
	    	byte[] buf = data.getBytes();
	        DatagramPacket packet = new DatagramPacket(buf, buf.length,ip,port);
	   //     System.out.println("发送的：");
	    //    System.out.println(new String(packet.getData(),"GBK"));
	        socket.send(packet);
	        socket.close();
	        
	} catch (SocketException e) {
		e.printStackTrace();
	} catch (UnsupportedEncodingException e) {
		e.printStackTrace();
	} catch (IOException e) {
		e.printStackTrace();
	} 
}

}
