package com.lndp.service;

import java.util.List;

import com.lndp.model.News;
import com.lndp.model.PageBean;

public interface INewsService {

	public abstract void save(News news);

	public abstract void delete(News news);
	
	public abstract void update(News news);

	public abstract News findById(java.lang.String id);

	public abstract List<News> findAll();
	
	public abstract List<News> findByType(String newsType);
	
	public abstract List<News> findForIndexByType(String newsType, int recoudCount);
	
	public abstract PageBean queryForPage(int pageSize, int currentPage);
	
	public abstract PageBean queryForPageByType(int pageSize, int targetPage, String newsType);
	
}
