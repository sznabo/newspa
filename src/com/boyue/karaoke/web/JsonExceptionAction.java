package com.boyue.karaoke.web;

import org.springframework.context.annotation.Scope;
import org.springframework.stereotype.Controller;

import com.boyue.framework.web.Response;
import com.opensymphony.xwork2.ActionContext;

/**
 *
 * @author ben
 * @date   2013-3-27 上午11:17:01
 *
 */
@Controller("JsonExceptionAction")
@Scope(value = "prototype")
public class JsonExceptionAction extends DefaultBaseAction {

	/**
	 * 程序异常
	 * @return
	 */
	public String jsonException() {
		String msg = ActionContext.getContext().getValueStack().findString("exception.message");
		this.ajaxResponse.setDesc("程序异常");
		this.ajaxResponse.setMsgCode(Response.EXCEPTION);
		return JSON_RESULT;
	}
	
	/**
	 * 会话超时 
	 * @return
	 */
	public String sessionTimeout() {
		this.ajaxResponse.setDesc("Session超时,请重新登陆");
		this.ajaxResponse.setMsgCode(Response.SESSION_TIMEOUT);
		return JSON_RESULT;
	}
	
	/**
	 * 非法访问
	 * @return
	 */
	public String illegalRequest() {
		this.ajaxResponse.setDesc("没有访问权限");
		this.ajaxResponse.setMsgCode(Response.NO_PERMISSION);
		return JSON_RESULT;
	}
	
}
