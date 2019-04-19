/*
 * 文 件 名 : Response.java
 * 版    权 : China Machi.Co.,Ltd.Copyright 2009-2011.All rights reserved
 * 描    述 : <描述>
 * 修 改 人 : lixg
 * 修改时间 : Aug 29, 2012
 * 跟踪单号 : <跟踪单号>
 * 修改单号 : <修改单号>
 * 修改内容 : <修改内容>
 */
package com.boyue.framework.web;

import java.io.Serializable;


/**
 * <一句话功能简介><br>
 * <功能详细描述>
 *
 * @author  lixg
 * @version [版本号,Aug 29, 2012]
 * @see     [相关类/方法]
 * @since   [产品/模块]
 */
public class Response<T>  implements Serializable
{
	//成功
	public final static String SUCCESS="OK";
	//异常
	public final static String EXCEPTION ="exception";
	//失败
	public final static String FAIL="fail";
	//没有权限
	public final static String NO_PERMISSION ="no_permission";
	//session超时
	public final static String SESSION_TIMEOUT ="sessionTimeOut";
	
	
    private String msgId;//消息ID[UUID，不可重复][暂无实际用处]
    private String serverCode;//服务名称
    private String time;//时间(转成毫秒数)
    private String msgCode = SUCCESS;//消息状态码
    private String desc;//提示内容
    
    private T msgBody;//消息体，可以是一个对象，也可以是一个对象列表，也可以是一个hashmap
   // private List<T> list;
    
    public Response() {
    	//this.msgCode = SUCCESS;
    }
    
	public String getMsgId() {
		return msgId;
	}
	public void setMsgId(String msgId) {
		this.msgId = msgId;
	}
	public String getServerCode() {
		return serverCode;
	}
	public void setServerCode(String serverCode) {
		this.serverCode = serverCode;
	}
	public String getTime() {
		return time;
	}
	public void setTime(String time) {
		this.time = time;
	}
	public String getMsgCode() {
		return msgCode;
	}
	
	/**
	 * 参照 MsgCode 类里面的常量
	 * @param msgCode
	 */
	public void setMsgCode(String msgCode) {
		this.msgCode = msgCode;
	}
	public String getDesc() {
		return desc;
	}
	public void setDesc(String desc) {
		this.desc = desc;
	}
    /**
     * getter
     * @return 返回 msgBody
     */
    public T getMsgBody()
    {
        return msgBody;
    }
    /**
     * setter
     * @param msgBody 进行赋值
     */
    public void setMsgBody(T msgBody)
    {
        this.msgBody = msgBody;
    }
	
}
