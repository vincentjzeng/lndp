package com.lndp.intercepter;

import java.io.IOException;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang.xwork.StringUtils;
import org.apache.log4j.Logger;
import org.apache.struts2.StrutsStatics;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.lndp.constant.CommonConst;
import com.lndp.exception.UserinfoException;
import com.lndp.model.Userinfo;
import com.lndp.security.DESPlus;
import com.lndp.security.ISecurityManager;
import com.lndp.utils.PropertiesUtil;
import com.opensymphony.xwork2.ActionContext;
import com.opensymphony.xwork2.ActionInvocation;
import com.opensymphony.xwork2.ValidationAware;
import com.opensymphony.xwork2.interceptor.Interceptor;


public class LoginIntercepter implements Interceptor{

	/**
	 * 
	 */
	private ISecurityManager securityManager;
	
	private static final long serialVersionUID = -7022074171300129713L;
	
	private static String USERNAME = "username";
	
	private static String PASSWORD = "password";
	
	private static String IDENTIFYING_CODE = "identifying_code";
	
	private static String LOGIN_ATTEMPT = "loginAttempt";
	
	private static String RESULT_ADMIN_LOGIN = "admin_login";
	
	private static final String RESULT_COMPANY_FIND_ALL_ACTION = "company_find_all_action";
	
	private static Logger logger = Logger.getLogger(LoginIntercepter.class.getName());
	
	public void destroy() {
		// TODO Auto-generated method stub
		
	}

	public void init() {
		// TODO Auto-generated method stub
		
	}

	public String intercept(ActionInvocation invocation) throws Exception {
		// TODO Auto-generated method stub
		 // Get the action context from the invocation so we can access the
	    // HttpServletRequest and HttpSession objects.
	    final ActionContext context = invocation.getInvocationContext ();
	    HttpServletRequest request = (HttpServletRequest) context.get(StrutsStatics.HTTP_REQUEST);
	    HttpSession session =  request.getSession (true);
	    
	    // Is there a "userinfo" object stored in the user's HttpSession?
	    Object userinfo = session.getAttribute ("userinfo");

	    if (userinfo == null) {
	        // The user has not logged in yet.

	        // Is the user attempting to log in right now?
	        String loginAttempt = request.getParameter (LOGIN_ATTEMPT);
	        if (! StringUtils.isBlank (loginAttempt) ) { // The user is attempting to log in.

	            // Process the user's login attempt.
	            if (processLoginAttempt (request, session) ) {
	                // The login succeeded send them the login-success page.
	                return RESULT_COMPANY_FIND_ALL_ACTION;
	            } else {
	                // The login failed. Set an error if we can on the action.
	                Object action = invocation.getAction ();
	                if (action instanceof ValidationAware) {
	                    ((ValidationAware) action).addActionError ("Username or password incorrect.");
	                }
	            }
	        }

	        // Either the login attempt failed or the user hasn't tried to login yet, 
	        // and we need to send the login form.
	        return RESULT_ADMIN_LOGIN;
	    } else {
	        return invocation.invoke ();
	    }

	}
	
	/**
	 * Attempt to process the user's login attempt delegating the work to the 
	 * SecurityManager.
	 */
	public boolean processLoginAttempt (HttpServletRequest request, HttpSession session) {
	    // Get the username and password submitted by the user from the HttpRequest.
	    String username = request.getParameter (USERNAME);
	    String password = request.getParameter (PASSWORD);
	    String identifyingCode = request.getParameter(IDENTIFYING_CODE);
	    
	    String sessionIdCode = (String)session.getAttribute("identifying_code");
	    
	    if(sessionIdCode == null || !sessionIdCode.equalsIgnoreCase(identifyingCode)){
	    	String errMsg = "验证码错误或不存在!";
	    	logger.error("Identifying code doesn't exist or incorrect.");
			request.setAttribute("errorInfo", errMsg);
			return false;
	    }

	    // Use the security manager to validate the user's username and password.
	    ServletContext servletContext = request.getSession().getServletContext();
	    WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(servletContext);
		
	    ISecurityManager securityManager = (ISecurityManager) ctx.getBean("securityManager");
		
		Userinfo userinfo = null;
		String encryptedPwd = null;
		
		try {
			// DESPlus des = new DESPlus();//默认密钥
			DESPlus des = new DESPlus(getDefaultDESKey());// 自定义密钥
			encryptedPwd = des.encrypt(password);
		} catch (Exception e) {
			logger.error("Encrypt password error.");
			request.setAttribute("errorInfo", "加密数据错误！");
			return false;
		}
		
		try {
			userinfo = securityManager.login(username, encryptedPwd);
		} catch (UserinfoException e) {
			logger.error("User [" + userinfo + "] failed to login.");
			request.setAttribute("errorInfo", "用户登录失败！");
			return false;
		}
		
		if(userinfo != null){
			logger.info("User [" + userinfo + "] has been found.");
			session.setAttribute("userinfo", userinfo);
			return true;
		} else {
			logger.info("User [" + userinfo + "] does not exist.");
			return false;
		}
	}

	public ISecurityManager getSecurityManager() {
		return securityManager;
	}

	public void setSecurityManager(ISecurityManager securityManager) {
		this.securityManager = securityManager;
	}

	private static String getDefaultDESKey() throws IOException {
		PropertiesUtil propertiesUtil = new PropertiesUtil(CommonConst.LNDP_PROPERTIES);
		return propertiesUtil.getString("default.des.key");
	}
}
