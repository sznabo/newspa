package com.boyue.karaoke.web.mobileaction;

import java.io.DataOutputStream;
import java.io.IOException;
import java.io.OutputStream;
import java.io.PrintWriter;
import java.net.Socket;
import java.net.UnknownHostException;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.web.BaseAction;

@Controller("weixinAction")
@Scope(value = "prototype")
public class WeixinAction extends BaseAction{
	String serverIp;
	String msg;
	public static Socket socket = null;
	String ip;
	public String checkIp(){
		try {  
            //创建Socket对象
			socket = new Socket(serverIp,9999); 
            //根据输入输出流和服务端连接
            OutputStream outputStream=socket.getOutputStream();//获取一个输出流，向服务端发送信息
            PrintWriter printWriter=new PrintWriter(outputStream);//将输出流包装成打印流
            printWriter.print("1");
            printWriter.flush();
            socket.shutdownOutput();//关闭输出流
            printWriter.close();
            outputStream.close();
            socket.close();
        } catch (UnknownHostException e) {
            e.printStackTrace();
            this.addActionError("连接失败，请检查ip是否正确");
            return "ip";
        } catch (IOException e) {
            e.printStackTrace();
            this.addActionError("连接失败，请检查ip是否正确");
            return "ip";
        }
		
		return "remote";
	}
	
	public String getServer(){
		try {
			   
            //创建Socket对象
			socket = new Socket(ip,9999); 
//            socket.setSoTimeout(5000);
            //根据输入输出流和服务端连接
            OutputStream outputStream=socket.getOutputStream();//获取一个输出流，向服务端发送信息
            DataOutputStream dos = new DataOutputStream(socket.getOutputStream()); //获取Socket对象的输出流，并且在外边包一层
//            System.out.println(msg);
            dos.writeUTF(msg); //DataOutputStream对象的writeUTF()方法可以输出数据，并且支持中文  
            dos.flush();
            socket.shutdownOutput();//关闭输出流
            outputStream.close();
            socket.close();
        } catch (UnknownHostException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
        return JSON_RESULT; 
	}
	
	
	public String getServerIp() {
		return serverIp;
	}
	public void setServerIp(String serverIp) {
		this.serverIp = serverIp;
	}
	public String getMsg() {
		return msg;
	}
	public void setMsg(String msg) {
		this.msg = msg;
	}

	public String getIp() {
		return ip;
	}

	public void setIp(String ip) {
		this.ip = ip;
	}

	
}
