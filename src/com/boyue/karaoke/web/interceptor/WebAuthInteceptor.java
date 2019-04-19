package com.boyue.karaoke.web.interceptor;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.boyue.karaoke.common.Constants;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 *
 * @author ben
 * @date   2013-8-20 上午10:12:12
 *
 */
public class WebAuthInteceptor  extends AbstractInterceptor {
	
	public static final String LOGIN_URL = "web_login";
	
	private static final Logger LOG = LogManager.getLogger(WebAuthInteceptor.class);
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		//请求的资源
		String requestResource = ServletActionContext.getRequest().getRequestURI();
		
		Object adminObject = invocation.getInvocationContext().getSession().get(Constants.MANAGE_USERINFO_SESSION_KEY);
		if (adminObject == null) {
			return LOGIN_URL;
		}
		return invocation.invoke();
	}
	
}
