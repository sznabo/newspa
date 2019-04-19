package com.boyue.spa.web.serveraction;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.spa.utils.NBConfig;
import com.boyue.spa.utils.ReceiveThread;
import com.opensymphony.xwork2.ActionSupport;

//捷信达服务接口
@Controller("GsInterfaceAction")
@Scope(value = "prototype")
public class GsInterfaceAction extends ActionSupport{

	public void test2() {
		//获取请求参数
		
		//调用内部方法进行处理
		
		//把获取的数据转换成JSON，配置stuts2的配置文件，更改返回数据的类型
	}
	
	public void reception() {
		//通过socket接收udp请求
		ReceiveThread rece=new ReceiveThread(NBConfig.PROT);
		rece.start();
	}
	
}
