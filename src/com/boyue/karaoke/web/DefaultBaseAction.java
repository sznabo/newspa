package com.boyue.karaoke.web;

import com.boyue.framework.web.BaseAction;
import com.boyue.karaoke.common.Constants;
import com.boyue.karaoke.model.Admin;

/**
 *
 * @author ben
 * @date   2013-8-29 上午10:03:52
 *
 */
public abstract class DefaultBaseAction<T> extends BaseAction<T> {

	//<!-- JSON程序异常 -->
	public static final String EXCEPTION_JSON_RESULT = "jsonException";
	//<!-- JSON会话超时 -->
	public static final String SESSION_TIMEOUT_JSON_RESULT = "sessionTimeout";
	//<!-- JSON没权限的非法访问 -->
	public static final String NO_PERM_JSON_RESULT = "illegalRequest";
	
	protected Admin getSessionAdmin() {
		return (Admin) this.getSessionAttr(Constants.MANAGE_USERINFO_SESSION_KEY);
	}
	
	protected void setSessionAdmin(Admin admin) {
		this.setSessionAttr(Constants.MANAGE_USERINFO_SESSION_KEY, admin);
	}
	
	protected int getLang() {
		return Integer.valueOf(this.getSessionAttr("language").toString()) ;
	}
	
}
