package com.lndp.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.lndp.model.News;

public class NewsDAO extends HibernateDaoSupport implements INewsDAO{

	public void save(News news) {
		if(news != null){
			this.getHibernateTemplate().save(news);
		}
	}
	
	public void delete(News news) {
		this.getHibernateTemplate().delete(news);
	}
	
	public void update(News news) {
		this.getHibernateTemplate().update(news);
	}

	public News findById(String id) {
		News news = (News)this.getHibernateTemplate().get("com.lndp.model.News", id);
		return news;
	}
	
	public List<News> findAll() {
		List<News> newsList = this.getHibernateTemplate().find("FROM News news ORDER BY news.updatedTime DESC");
		return newsList;
	}

	public List<News> findByType(String newsType) {
		List<News> newsList = this.getHibernateTemplate().find("FROM News news WHERE news.newsType='" 
				+ newsType + "' ORDER BY news.updatedTime DESC");
		return newsList;
	}
	
	public List<News> queryForPage(final String hql, final int offset, final int length){
		List<News> list = getHibernateTemplate().executeFind(
				new HibernateCallback(){

					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						query.setFirstResult(offset);
						query.setMaxResults(length);
						List<News> list = query.list();
						return list;
					}
					
				}
		);
		
		return list;
	}

	public int getAllRowCount(String hql){
		return getHibernateTemplate().find(hql).size();
	}
	
	public List<News> findForIndexByType(String newsType, int recordCound) {
		final String hql = "FROM News news WHERE news.newsType='" + newsType + "' ORDER BY news.updatedTime DESC";
		final int offset = 0;
		final int length = recordCound;
		
		List<News> list = getHibernateTemplate().executeFind(
				new HibernateCallback(){

					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						query.setFirstResult(offset);
						query.setMaxResults(length);
						List<News> list = query.list();
						return list;
					}
					
				}
		);
		
		return list;
	}
}
