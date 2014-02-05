package com.lndp.dao;

import java.util.List;

import com.lndp.model.News;

public interface INewsDAO {
	
	public abstract void save(News news);

	public abstract void delete(News news);
	
	public abstract void update(News news);

	public abstract News findById(String id);

	public abstract List<News> findAll();
	
	public abstract List<News> findByType(String newType);
	
	public abstract List<News> findForIndexByType(String newType, int recordCound);
	
	public abstract List<News> queryForPage(final String hql, final int offset, final int length);
	
	public abstract int getAllRowCount(String hql);
}
