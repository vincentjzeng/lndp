package com.lndp.service;

import java.util.List;

import com.lndp.dao.INewsDAO;
import com.lndp.model.News;
import com.lndp.model.PageBean;

public class NewsService implements INewsService {

	
	private INewsDAO dao;
	
	public INewsDAO getDao() {
		return dao;
	}

	public void setDao(INewsDAO dao) {
		this.dao = dao;
	}

	public void save(News news) {
		dao.save(news);
	} 
	
	public void delete(News news) {
		dao.delete(news);
		
	}
	
	public void update(News news) {
		dao.update(news);
		
	}

	public News findById(String id) {
		News news = dao.findById(id);
		return news;
	}
	
	public List<News> findAll() {
		List<News> newsList = dao.findAll();
		return newsList;
	}
	
	public List<News> findByType(String newsType) {
		List<News> newsList = dao.findByType(newsType);
		return newsList;
	}
	
	public List<News> findForIndexByType(String newsType, int recoudCount) {
		List<News> newsList = dao.findForIndexByType(newsType, recoudCount);
		return newsList;
	}
	
	public PageBean queryForPage(int pageSize, int targetPage){
		final String hql = "FROM News news ORDER BY news.updatedTime DESC";
		int allRow = dao.getAllRowCount(hql);
		int totalPage = PageBean.countTotalPage(pageSize, allRow);
		final int offset = PageBean.countOffset(pageSize, targetPage);
		final int length = pageSize;
		final int currentPage = PageBean.countCurrentPage(targetPage);
		List<News> list = dao.queryForPage(hql, offset, length);
		
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		return pageBean;
	}
	
	public PageBean queryForPageByType(int pageSize, int targetPage, String newsType){
		final String hql = "FROM News news WHERE news.newsType = " + newsType + " ORDER BY news.updatedTime DESC";
		int allRow = dao.getAllRowCount(hql);
		int totalPage = PageBean.countTotalPage(pageSize, allRow);
		final int offset = PageBean.countOffset(pageSize, targetPage);
		final int length = pageSize;
		final int currentPage = PageBean.countCurrentPage(targetPage);
		List<News> list = dao.queryForPage(hql, offset, length);
		
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		return pageBean;
	}
}
