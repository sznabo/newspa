/*
 * 文 件 名 : BaseAction.java
 * 版    权 : China Machi.Co.,Ltd.Copyright 2009-2011.All rights reserved
 * 描    述 : <描述>
 * 修 改 人 : lixg
 * 修改时间 : Aug 30, 2012
 * 跟踪单号 : <跟踪单号>
 * 修改单号 : <修改单号>
 * 修改内容 : <修改内容>
 */
package com.boyue.framework.web;

import java.util.Map;

import org.apache.log4j.LogManager;
import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;

import com.boyue.framework.common.PageBean;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.ValidationWorkflowAware;

/**
 *
 * @author ben
 * @date   2014-8-25 上午11:03:48
 *  //                        _ooOoo_
//                           o8888888o
//                           88" . "88
//                           (| -_- |)
//                            O\ = /O
//                        ____/`---'\____
//                      .   ' \\| |// `.
//                       / \\||| : |||// \
//                     / _||||| -:- |||||- \
//                       | | \\\ - /// | |
//                     | \_| ''\---/'' | |
//                      \ .-\__ `-` ___/-. /
//                   ___`. .' /--.--\ `. . __
//                ."" '< `.___\_<|>_/___.' >'"".
//               | | : `- \`.;`\ _ /`;.`/ - ` : | |
//                 \ \ `-. \_ __\ /__ _/ .-` / /
//         ======`-.____`-.___\_____/___.-`____.-'======
//                            `=---='
//
//         .............................................
//                  佛祖保佑               永无BUG

 */

public class BaseAction<T> extends ActionSupport implements ValidationWorkflowAware
{
	//全局json结果视图的名称
	protected static final String JSON_RESULT = "global_ajax_response";
	//验证错误要返回的视图名称
	protected String inputResultName;
	protected Response ajaxResponse = new Response();
	protected PageBean<T> pageBean;
	
	protected int pageSize = PageBean.DEFAULT_PAGE_SIZE;
	
	/**当前页码**/
	protected int pageNo = 1;
	
    /**
     * 配置日志
     */
    protected static final Logger logger = LogManager.getLogger(BaseAction.class);
    
    protected void setRequestAttr(String key, Object val) {
    	ServletActionContext.getRequest().setAttribute(key, val);
    }
    
    protected Object getRequestAttr(String key) {
    	return ServletActionContext.getRequest().getAttribute(key);
    }
    
    protected void setSessionAttr(String key, Object val) {
    	ActionContext.getContext().getSession().put(key, val);
    }
    
    protected Object getSessionAttr(String key) {
    	return ServletActionContext.getRequest().getSession().getAttribute(key);
    }
    
    protected int getLang() {
		return Integer.valueOf(this.getSessionAttr("language").toString()) ;
	}
    protected String getRequestParameter(String key) {
    	return ServletActionContext.getRequest().getParameter(key);
    }
    
    protected String[] getRequestParameterValues(String key) {
    	return ServletActionContext.getRequest().getParameterValues(key);
    }
    
    protected String getSessionId() {
    	return ServletActionContext.getRequest().getSession().getId();
    }

    protected void removeSession(String remObj) {
        ActionContext context = ServletActionContext.getContext();
        if(context != null){
            Map<String, Object> session = context.getSession();
            session.remove(remObj); 
        }
    }
    
    /**
     * 获取工程的网络路径 如: http://www.qq.com
     * @return
     */
    protected String getProjectWebPath() {
    	String path = ServletActionContext.getRequest().getContextPath();
        String basePath = ServletActionContext.getRequest().getScheme() 
        	+ "://" + ServletActionContext.getRequest().getServerName() + ":" 
        	+ ServletActionContext.getRequest().getServerPort() + path + "/";
        return basePath;
    }
    
	public Response getAjaxResponse() {
		return ajaxResponse;
	}

	public void setAjaxResponse(Response ajaxResponse) {
		this.ajaxResponse = ajaxResponse;
	}
	
	public PageBean<T> getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean<T> pageBean) {
		this.pageBean = pageBean;
	}


	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}
	
	/**
     * 获取工程绝对路径
     * 如: E:\Tomcat\webapps\TEST\ 
     * @return
     */
    protected String getProjectPath() {
        return ServletActionContext.getServletContext().getRealPath("") + "/";
    }

	@Override
	public String getInputResultName() {
		return null;
	}

	protected void setInputResultName(String resultName) {
		this.inputResultName = resultName;
	}

	public int getPageNo() {
		return pageNo;
	}

	public void setPageNo(int pageNo) {
		this.pageNo = pageNo;
	}
}
