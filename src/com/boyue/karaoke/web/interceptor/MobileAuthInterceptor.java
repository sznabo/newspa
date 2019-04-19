package com.boyue.karaoke.web.interceptor;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.boyue.karaoke.web.DefaultBaseAction;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

/**
 *
 * @author ben
 * @date   2013-8-20 上午10:12:40
 *
 */
public class MobileAuthInterceptor  extends AbstractInterceptor  {
	
	private static final Logger LOG = LogManager.getLogger(MobileAuthInterceptor.class);
	
	
	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
//		String token = ServletActionContext.getRequest().getHeader("Authorization");
//		System.out.println("token:" + token);
//		WebApplicationContext wac = WebApplicationContextUtils.getWebApplicationContext(ServletActionContext.getServletContext());
//		if (StringUtils.isBlank(token) || wac.getBean(UserInfoService.class).getUserByToken(token) == null) {
//			return PbaniAction.NO_PERM_JSON_RESULT;
//		}
		if (ServletActionContext.getRequest().getSession().getAttribute("mobileSessionUser") == null) {
			return DefaultBaseAction.NO_PERM_JSON_RESULT;
		}
		return invocation.invoke();
	}
	
}
