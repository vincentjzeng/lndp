package com.lndp.model;

import java.util.Date;

public class News {
	
	private String newsId;
	
	private String newsType;
	
	private String newsTitle;
	
	private String newsContent;
	
	private Double clickCount;
	
	private String updatedUser;
	
	private Date updatedTime;

	public News() {
		super();
		// TODO Auto-generated constructor stub
	}

	public News(Double clickCount, String newsContent, String newsId,
			String newsTitle, String newsType, Date updatedTime,
			String updatedUser) {
		super();
		this.clickCount = clickCount;
		this.newsContent = newsContent;
		this.newsId = newsId;
		this.newsTitle = newsTitle;
		this.newsType = newsType;
		this.updatedTime = updatedTime;
		this.updatedUser = updatedUser;
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
	
	public String toString(){
		return "News ID: " + newsId + ", News Type : " + newsType + ", News Title :"
		+ newsTitle + ", Click Count : " + clickCount
		+ ", Updated User : " + updatedUser + ", Updated Time : " + updatedTime;
	}
}
