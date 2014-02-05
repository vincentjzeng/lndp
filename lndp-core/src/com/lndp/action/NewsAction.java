package com.lndp.action;

import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.lndp.constant.CommonConst;
import com.lndp.constant.NewsConst;
import com.lndp.model.News;
import com.lndp.model.PageBean;
import com.lndp.service.INewsService;
import com.opensymphony.xwork2.ActionSupport;

public class NewsAction extends ActionSupport implements ServletRequestAware, SessionAware {

	/**
	 * 
	 */
	private static final long serialVersionUID = 2407753982118458007L;

	private String newsId;
	
	private String newsType;
	
	private String newsTitle;
	
	private String newsContent;
	
	private String updatedUser;
	
	private Date updatedTime;
	// message
	private String message;
	// target page
	private int targetPage;
	// pageSize
	private int pageSize;
	// page bean including the result list
	private PageBean pageBean;
	// action type
	private String action;
	// view type - 1. Property leasing, 2. News center (Plaza news and Notice), 3. Recruitment
	private String viewType;

	private INewsService service;
	// http service request
	private HttpServletRequest servletRequest;
	// session map
	private Map session;
	// result type index
	private static String RESULT_INDEX = "index";
	// result type list
	private static String RESULT_LIST = "list";
	// result type show
	private static String RESULT_SHOW = "show";
	// news type for all
	private static String NEWS_TYPE_ALL = "0";
	// view type for property leasing center
	private static String VIEW_TYPE_PROPERTY_LEASING_CENTER = "1";
	// view type for news center
	private static String VIEW_TYPE_NEWS_CENTER = "2";
	// view type for recruitment center
	private static String VIEW_TYPE_RECRUITMENT_CENTER = "3";
	
	// log4j logger
	private static Logger logger = Logger.getLogger(NewsAction.class.getName());
	
	public NewsAction(){
		super();
	}
	
	public String findById(){

		News news = service.findById(newsId);
		if(news != null){
			this.getServletRequest().setAttribute("news", news);
			logger.info("News [" + news + "] has been found.");
		} else {
			logger.info("News [" + news + "] does not exist.");
		}
		
		return RESULT_SHOW;
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
	
	
	public String findForIndexByType(){		
		
		if(VIEW_TYPE_PROPERTY_LEASING_CENTER.equalsIgnoreCase(viewType)){
			
			List<News> leasingList = service.findForIndexByType(NewsConst.NEWS_TYPE_PROPERTY_LEASING, CommonConst.INDEX_NEWS_RECORD_COUNT);
			if(leasingList != null && leasingList.size() != 0){
				for(News news : leasingList){
					logger.info("News" + news + "] has been found.");
				}
				this.getServletRequest().setAttribute("leasingList", leasingList);
			} else {
				logger.info("No news exist.");
			}
		} else if(VIEW_TYPE_NEWS_CENTER.equalsIgnoreCase(viewType)){
			
			List<News> plazaList = service.findForIndexByType(NewsConst.NEWS_TYPE_PLAZA, CommonConst.INDEX_NEWS_RECORD_COUNT);
			if(plazaList != null && plazaList.size() != 0){
				for(News news : plazaList){
					logger.info("News" + news + "] has been found.");
				}
				this.getServletRequest().setAttribute("plazaList", plazaList);
			} else {
				logger.info("No news exist.");
			}
			
			List<News> noticeList = service.findForIndexByType(NewsConst.NEWS_TYPE_NOTICE, CommonConst.INDEX_NEWS_RECORD_COUNT);
			if(noticeList != null && noticeList.size() != 0){
				for(News news : noticeList){
					logger.info("News" + news + "] has been found.");
				}
				this.getServletRequest().setAttribute("noticeList", noticeList);
			} else {
				logger.info("No news exist.");
			}
			
			List<News> industTrendList = service.findForIndexByType(NewsConst.NEWS_TYPE_INDUSTRY_TREND, CommonConst.INDEX_NEWS_RECORD_COUNT);
			if(industTrendList != null && industTrendList.size() != 0){
				for(News news : industTrendList){
					logger.info("News" + news + "] has been found.");
				}
				this.getServletRequest().setAttribute("industTrendList", industTrendList);
			} else {
				logger.info("No news exist.");
			}
		} else if(VIEW_TYPE_RECRUITMENT_CENTER.equalsIgnoreCase(viewType)){
			
			List<News> recruitmentList = service.findForIndexByType(NewsConst.NEWS_TYPE_RECRUITMENT, CommonConst.INDEX_NEWS_RECORD_COUNT);
			if(recruitmentList != null && recruitmentList.size() != 0){
				for(News news : recruitmentList){
					logger.info("News" + news + "] has been found.");
				}
				this.getServletRequest().setAttribute("recruitmentList", recruitmentList);
			} else {
				logger.info("No news exist.");
			}
		} else{
			logger.info("Not support view type : " + viewType);
		}
		
		return RESULT_INDEX;
	}
	
	public String findForPage(){
		
		this.pageBean = service.queryForPage(NewsConst.NEWS_PAGE_SIZE, targetPage);
		
		if(pageSize != 0){
			this.pageBean = service.queryForPage(pageSize, targetPage);
		} else {
			this.pageBean = service.queryForPage(NewsConst.NEWS_PAGE_SIZE, targetPage);
		}
		
		List<News> newsList = pageBean.getList();
		if(newsList != null && newsList.size() != 0){
			for(News news : newsList){
				logger.info("News" + news + "] has been found.");
			}
			this.getServletRequest().setAttribute("pageBean", pageBean);
		} else {
			logger.info("No news exist.");
		}
		
		return RESULT_LIST;
	}
	
	public String findForPageByType(){
		
		if(pageSize != 0){
			this.pageBean = service.queryForPageByType(pageSize, targetPage, newsType);
		} else {
			this.pageBean = service.queryForPageByType(NewsConst.NEWS_PAGE_SIZE, targetPage, newsType);
		}
		List<News> newsList = pageBean.getList();
		if(newsList != null && newsList.size() != 0){
			for(News news : newsList){
				logger.info("News" + news + "] has been found.");
			}
			this.getServletRequest().setAttribute("pageBean", pageBean);	
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

	public int getTargetPage() {
		return targetPage;
	}

	public void setTargetPage(int targetPage) {
		this.targetPage = targetPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}

	public String getAction() {
		return action;
	}

	public String getViewType() {
		return viewType;
	}

	public void setViewType(String viewType) {
		this.viewType = viewType;
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
