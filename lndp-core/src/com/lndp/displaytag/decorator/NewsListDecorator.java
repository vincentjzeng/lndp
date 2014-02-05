package com.lndp.displaytag.decorator;

import java.text.SimpleDateFormat;
import java.util.Date;

import org.displaytag.decorator.TableDecorator;

import com.lndp.model.News;

public class NewsListDecorator extends TableDecorator {
	
	private static String NEWS_TYPE_LEASING = "1";
	private static String NEWS_TYPE_PLAZA_NEWS = "2";
	private static String NEWS_TYPE_NOTICE = "3";
	private static String NEWS_TYPE_RECRUITMENT = "4";
	private static String NEWS_TYPE_INDUSTRY_TREND = "5";
	
	private static String NEWS_TYPE_LEASING_STR = "物业租赁";
	private static String NEWS_TYPE_PLAZA_NEWS_STR = "广场新闻";
	private static String NEWS_TYPE_NOTICE_STR = "通知";
	private static String NEWS_TYPE_RECRUITMENT_STR = "人才招聘";
	private static String NEWS_TYPE_INDUSTRY_TREND_STR = "行业动态";
	
	public String getOperation()
	{
	        News news= (News)getCurrentRowObject();
	        String newsId = news.getNewsId();

	        return "<a href=\"news_admin_findById.action?action=view&newsId=" + newsId 
	        		+ 	"\"><img src=\"resource/style/backend/img/icons/user.png\" "
	        		+	"title=\"查看信息\"  /></a>"
					+ 	"<a href=\"news_admin_findById.action?action=update&newsId=" + newsId 
					+	"\"><img src=\"resource/style/backend/img/icons/user_edit.png\" title=\"更新信息\" "
					+	" /> </a> "
					+ 	"<a href=\"news_admin_delete.action?action=delete&newsId=" + newsId
					+ 	"\"><img src=\"resource/style/backend/img/icons/user_delete.png\""
					+	"title=\"删除信息\" /> </a>";
	}
	
	public String getNewsType(){
		News news= (News)getCurrentRowObject();
        String newsType = news.getNewsType();
        
        if(newsType.equalsIgnoreCase(NEWS_TYPE_LEASING)){
        	return NEWS_TYPE_LEASING_STR;
        } else if(newsType.equalsIgnoreCase(NEWS_TYPE_PLAZA_NEWS)){
        	return NEWS_TYPE_PLAZA_NEWS_STR;
        } else if(newsType.equalsIgnoreCase(NEWS_TYPE_NOTICE)){
        	return NEWS_TYPE_NOTICE_STR;
        } else if(newsType.equalsIgnoreCase(NEWS_TYPE_RECRUITMENT)){
        	return NEWS_TYPE_RECRUITMENT_STR;
        } else if(newsType.equalsIgnoreCase(NEWS_TYPE_INDUSTRY_TREND)) {
        	return NEWS_TYPE_INDUSTRY_TREND_STR;
        } 
        
        return "";
	}
	
	public String getUpdatedTime(){
		News news = (News)getCurrentRowObject();
        Date updatedTime = news.getUpdatedTime();
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm");  
        String rsDateTime = dateformat.format(updatedTime);
        return rsDateTime;
        
	}
}
