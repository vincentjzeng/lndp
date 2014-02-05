package com.lndp.poc.action;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;

import com.lndp.action.UserinfoAction;
import com.opensymphony.xwork2.ActionSupport;

public class FCKEditorAction extends ActionSupport implements ServletRequestAware {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = 1L;

	private String fckeditor;
	
	private String message;
	
	private HttpServletRequest request;
	
	static Logger logger = Logger.getLogger(UserinfoAction.class.getName());
	
	public String execute() {
		logger.info("FCK Editor Content : " + fckeditor);
		
		return SUCCESS;
	}

	public String getFckeditor() {
		return fckeditor;
	}

	public void setFckeditor(String fckeditor) {
		this.fckeditor = fckeditor;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public void setServletRequest(HttpServletRequest request) {
		this.request = request;
	}
}
