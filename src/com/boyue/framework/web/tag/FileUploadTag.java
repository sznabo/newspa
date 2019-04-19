package com.boyue.framework.web.tag;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.Component;
import org.apache.struts2.views.jsp.ComponentTagSupport;
import org.apache.struts2.views.jsp.ui.AbstractUITag;

import com.opensymphony.xwork2.util.ValueStack;

/**
 *
 * @author ben
 * @date   2014-6-26 上午9:21:05
 *
 */
public class FileUploadTag extends AbstractUITag {

	private String uploadSavePath;
	
	@Override  
    protected void populateParams() {  
        super.populateParams();  
        FileUploadComponent f = (FileUploadComponent) getComponent();
        f.setUploadSavePath(getUploadSavePath());
    }

	public String getUploadSavePath() {
		return uploadSavePath;
	}

	public void setUploadSavePath(String uploadSavePath) {
		this.uploadSavePath = uploadSavePath;
	}

	/* (non-Javadoc)
	 * @see org.apache.struts2.views.jsp.ComponentTagSupport#getBean(com.opensymphony.xwork2.util.ValueStack, javax.servlet.http.HttpServletRequest, javax.servlet.http.HttpServletResponse)
	 */
	@Override
	public Component getBean(ValueStack stack, HttpServletRequest request,
			HttpServletResponse response) {
		return new FileUploadComponent(stack, request, response);
	} 

}
