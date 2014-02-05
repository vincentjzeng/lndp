package com.lndp.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.lndp.model.Userinfo;
import com.lndp.service.IUserinfoService;
import com.opensymphony.xwork2.ActionSupport;

public class UserinfoAction extends ActionSupport implements ServletRequestAware, SessionAware {

	/**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -1930867231968162901L;

	private String userId;
	
	private String username;
	
	private String password;
	
	private String userType;
	
	private String message;
	
	private IUserinfoService service;
	
	private HttpServletRequest servletRequest;
	
	private Map session;
	
	private static Logger logger = Logger.getLogger(UserinfoAction.class.getName());
	
	
	public String add(){
		
		Userinfo userinfo = new Userinfo();
		userinfo.setUsername(username);
		userinfo.setPassword(password);
		userinfo.setUserType(userType);
		
		service.save(userinfo);
		logger.info("User [" + userinfo + "] has been saved.");
		
		return SUCCESS;
	}
	
	public String delete(){
		
		Userinfo userinfo = service.findById(userId);
		if(userinfo != null){
			service.delete(userinfo);
		} else {
			logger.info("User [" + userinfo + "] does not exist.");
		}
		
		return SUCCESS;
	}
	
	public String update(){
		
		Userinfo userinfo = service.findById(userId);
		if(userinfo != null){
			userinfo.setUsername(username);
			userinfo.setPassword(password);
			userinfo.setUserType(userType);
			service.update(userinfo);
			logger.info("User [" + userinfo + "] has been updated.");
		} else {
			logger.info("User [" + userinfo + "] does not exist.");
		}
		
		return SUCCESS;
	}
	
	public String findById(){
		
		Userinfo userinfo = service.findById(userId);
		if(userinfo != null){
			logger.info("User [" + userinfo + "] has been found.");
		} else {
			logger.info("User [" + userinfo + "] does not exist.");
		}
		
		return SUCCESS;
	}
	
	public String findAll(){
		
		List<Userinfo> userinfoList = service.findAll();
		if(userinfoList != null && userinfoList.size() != 0){
			for(Userinfo userinfo : userinfoList){
				logger.info("User [" + userinfo + "] has been found.");
			}
			this.getServletRequest().setAttribute("userinfoList", userinfoList);
		} else {
			logger.info("No user exist.");
		}
		
		return SUCCESS;
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

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public IUserinfoService getService() {
		return service;
	}

	public void setService(IUserinfoService service) {
		this.service = service;
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
