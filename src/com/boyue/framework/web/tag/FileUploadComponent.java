package com.boyue.framework.web.tag;

import java.io.IOException;
import java.io.Writer;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.struts2.components.UIBean;

import com.opensymphony.xwork2.util.ValueStack;
/**
 *
 * @author ben
 * @date   2014-6-26 上午9:25:53
 *
 */
public class FileUploadComponent  extends UIBean  {
	

	/**
	 * @param stack
	 * @param request
	 * @param response
	 */
	public FileUploadComponent(ValueStack stack, HttpServletRequest request,
			HttpServletResponse response) {
		super(stack, request, response);
	}

	private String uploadSavePath;
	
	public String getUploadSavePath() {
		return uploadSavePath;
	}

	public void setUploadSavePath(String uploadSavePath) {
		this.uploadSavePath = uploadSavePath;
	}

	/* (non-Javadoc)
	 * @see org.apache.struts2.components.UIBean#getDefaultTemplate()
	 */
	@Override
	protected String getDefaultTemplate() {
		return "fileupload_basic";  
	}


	 @Override  
     protected void evaluateExtraParams() {  
        super.evaluateExtraParams();  
        addParameter("uploadSavePath", uploadSavePath);  
    } 
	
}
