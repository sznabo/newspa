package com.boyue.karaoke.web.interceptor;

import java.io.IOException;
import java.util.Date;
import java.util.Enumeration;

import javax.servlet.http.HttpServletRequest;

import org.apache.commons.lang.StringUtils;
import org.apache.struts2.ServletActionContext;
import org.codehaus.jackson.JsonGenerationException;
import org.codehaus.jackson.map.JsonMappingException;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.boyue.karaoke.common.Constants;
import com.boyue.karaoke.model.Admin;
import com.boyue.karaoke.model.Syslog;
import com.boyue.karaoke.service.SyslogService;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.interceptor.AbstractInterceptor;

public class LogInterceptor extends AbstractInterceptor {

	private  SyslogService getLogService(){
		return WebApplicationContextUtils.getWebApplicationContext(ServletActionContext.getServletContext()).getBean(SyslogService.class);
	}

	@Override
	public String intercept(ActionInvocation invocation) throws Exception {
		HttpServletRequest request = ServletActionContext.getRequest();
		String url = ServletActionContext.getRequest().getRequestURL().toString();
		Object action = invocation.getAction();
		String method = invocation.getProxy().getMethod();
		String result = invocation.invoke();
		Object loginUserObj = request.getSession().getAttribute(Constants.MANAGE_USERINFO_SESSION_KEY);
		try {
			String key = action.getClass().getName()+"." + method;
			if ((loginUserObj != null) && LogConfig.isBeLog(key)) {
				Syslog log = new Syslog();
				Admin admin = (Admin)loginUserObj;
				log.setOperator(admin.getUserName());
				log.setOperate(LogConfig.getLogValue(key));
				log.setType(Syslog.USER_OPERATE);
				log.setTime(new Date());
				log.setIp(request.getRemoteAddr());
				log.setRemark(getPostParameter(request));
				this.getLogService().save(log);
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return result;
	}
	
	/**
	 * 获取表单提交的数据,以json的格式组织 
	 * 如果长度大于1024,后面的废弃 
	 * @param request
	 * @return
	 * @throws IOException 
	 * @throws JsonMappingException 
	 * @throws JsonGenerationException 
	 */
	private String getPostParameter(HttpServletRequest request) throws  Exception {
		Enumeration parameterNames = request.getParameterNames();
		StringBuilder sb = new StringBuilder();
		while (parameterNames.hasMoreElements() ) {
			String key = parameterNames.nextElement().toString();
			if (key.equals("pageNo") || key.equals("actionName")) {
				continue;
			}
			sb.append(key + ":[");
			String[] parameterValues = request.getParameterValues(key);
			sb.append(StringUtils.join(parameterValues));
			sb.append("],");
		}
		return sb.substring(0, sb.length()>1024?1023:sb.length()-1);
	}

}
