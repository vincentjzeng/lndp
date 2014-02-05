package com.lndp.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.lndp.model.News;
import com.lndp.service.INewsService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

public class NewsAdminAction extends ActionSupport implements ServletRequestAware, SessionAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2407753982118458007L;

	private String newsId;
	
	private String newsType;
	
	private String newsTitle;
	
	private String newsContent;
	
	private Double clickCount;
	
	private String updatedUser;
	
	private Date updatedTime;
	// mesage
	private String message;
	// action type
	private String action;

	private INewsService service;
	// http service request
	private HttpServletRequest servletRequest;
	// session map
	private Map session;
	// result type
	private static final String RESULT_LIST = "list";
	
	private static final String RESULT_SHOW = "show";
	
	private static final String RESULT_UPDATE = "update";
	
	private static final String RESULT_ADD_INPUT = "add_input";
	
	private static final String RESULT_UPDATE_INPUT = "update_input";
	// action type - view
	private static final String ACTION_VIEW = "view";
	// action type - update
	private static final String ACTION_UPDATE = "update";
	// news type for all
	private static final String NEWS_TYPE_ALL = "0";
	// log4j logger
	private static Logger logger = Logger.getLogger(NewsAdminAction.class.getName());
	
	
	@InputConfig(resultName=RESULT_ADD_INPUT)
	public String add(){
		
		News news = new News();
		news.setNewsType(newsType);
		news.setNewsTitle(newsTitle);
		news.setNewsContent(newsContent);
		news.setUpdatedTime(new Date());
		news.setUpdatedUser("*SYSTEM");
		
		service.save(news);
		logger.info("News [" + news + "] has been saved.");
		
		return findAll();
	}
	
	public String delete(){
		
		News news = service.findById(newsId);
		if(news != null){
			service.delete(news);
		} else {
			logger.info("News [" + news + "] does not exist.");
		}
		
		return findAll();
	}
	
	@InputConfig(resultName=RESULT_UPDATE_INPUT)
	public String update(){
		
		News news = service.findById(newsId);
		if(news != null){
			news.setNewsType(newsType);
			news.setNewsTitle(newsTitle);
			news.setNewsContent(newsContent);
			news.setUpdatedTime(new Date());
			news.setUpdatedUser("*SYSTEM");
			
			service.update(news);
			logger.info("News [" + news + "] has been updated.");
		} else {
			logger.info("News [" + news + "] does not exist.");
		}
		
		return findAll();
	}
	
	
	public String findById(){
		
		News news = service.findById(newsId);
		if(news != null){
			this.getServletRequest().setAttribute("news", news);
			logger.info("News [" + news + "] has been found.");
		} else {
			logger.info("News [" + news + "] does not exist.");
		}
		
		if(ACTION_VIEW.equalsIgnoreCase(action)){
			return RESULT_SHOW;
		} else if(ACTION_UPDATE.equalsIgnoreCase(action)){
			return RESULT_UPDATE;
		}
		return SUCCESS;
	}
	
	
	public String findAll(){
		
		List<News> newsList = service.findAll();
		if(newsList != null && newsList.size() != 0){
			for(News news : newsList){
				logger.info("News" + news + "] has been found.");
			}
			this.getServletRequest().setAttribute("newsList", newsList);
		} else {
			logger.info("No news exist.");
		}
		
		return RESULT_LIST;
	}
	
	
	public String findByType(){
		if(newsType.equalsIgnoreCase(NEWS_TYPE_ALL)){
			return findAll();
		}
		
		List<News> newsList = service.findByType(newsType);
		if(newsList != null && newsList.size() != 0){
			for(News news : newsList){
				logger.info("News" + news + "] has been found.");
			}
			this.getServletRequest().setAttribute("newsList", newsList);
		} else {
			logger.info("No news exist.");
		}
		
		return RESULT_LIST;
	}
	
	
	public String getNewsId() {
		return newsId;
	}

	public void setNewsId(String newsId) {
		this.newsId = newsId;
	}

	public String getNewsType() {
		return newsType;
	}

	public void setNewsType(String newsType) {
		this.newsType = newsType;
	}

	public String getNewsTitle() {
		return newsTitle;
	}

	public void setNewsTitle(String newsTitle) {
		this.newsTitle = newsTitle;
	}

	public String getNewsContent() {
		return newsContent;
	}

	public void setNewsContent(String newsContent) {
		this.newsContent = newsContent;
	}

	public Double getClickCount() {
		return clickCount;
	}

	public void setClickCount(Double clickCount) {
		this.clickCount = clickCount;
	}

	public String getUpdatedUser() {
		return updatedUser;
	}

	public void setUpdatedUser(String updatedUser) {
		this.updatedUser = updatedUser;
	}

	public Date getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}
	
	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}

	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}

	public INewsService getService() {
		return service;
	}

	public void setService(INewsService service) {
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
