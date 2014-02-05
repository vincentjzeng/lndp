package com.lndp.action;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.lndp.exception.UserinfoException;
import com.lndp.model.Userinfo;
import com.lndp.security.ISecurityManager;
import com.opensymphony.xwork2.ActionSupport;

public class SecurityManagerAction extends ActionSupport implements ServletRequestAware, SessionAware{

	/**
	 * 
	 */
	private static final long serialVersionUID = -3150160689664007715L;

	private ISecurityManager securityManager;
	
	private String username;
	
	private String password;
	
	private String message;
	
	private HttpServletRequest servletRequest;
	
	private static final String RESULT_COMPANY_FIND_ALL_ACTION = "company_find_all_action";
	
	private static String RESULT_ADMIN_LOGIN = "admin_login";
	
	private static Logger logger = Logger.getLogger(SecurityManagerAction.class.getName());
	
	private Map session;
	
	public String login(){
		Userinfo userinfo = null;
		try {
			userinfo = securityManager.login(username, password);
		} catch (UserinfoException e) {
			logger.error("Login failed.");
			setMessage("用户 [" + userinfo + "] 登录失败！");
			return INPUT;
		}
		
		if(userinfo != null){
			logger.info("User [" + userinfo + "] has been found.");
			session.put("userinfo", userinfo);
			setMessage("User: " + username + " login successfully.");
		} else {
			logger.info("User [" + userinfo + "] does not exist.");
			setMessage("用户不存在或用户名，密码错误！");
			return INPUT;
		}
		
		return RESULT_COMPANY_FIND_ALL_ACTION;
	}
	
	public String logout(){
		
		Userinfo userinfo = (Userinfo)session.get("userinfo");
		if(userinfo != null){
			String tmpUsername = userinfo.getUsername();
			session.remove("userinfo");
			setMessage("用户: " + tmpUsername + " 退出成功.");
		} else {
			setMessage("退出失败！");
		}
		
		return RESULT_ADMIN_LOGIN;
	}
	
	
	
	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public ISecurityManager getSecurityManager() {
		return securityManager;
	}

	public void setSecurityManager(ISecurityManager securityManager) {
		this.securityManager = securityManager;
	}
	
	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}

	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}
	
	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}
}
