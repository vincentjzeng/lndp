package com.lndp.dao;

import java.sql.SQLException;
import java.util.List;

import org.hibernate.HibernateException;
import org.hibernate.Query;
import org.hibernate.Session;
import org.springframework.orm.hibernate3.HibernateCallback;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.lndp.model.Company;

public class CompanyDAO extends HibernateDaoSupport implements ICompanyDAO {

	public void save(Company company) {
		if(company != null){
			this.getHibernateTemplate().save(company);
		}
	}
	
	public void delete(Company company) {
		this.getHibernateTemplate().delete(company);
	}
	
	public void update(Company company) {
		this.getHibernateTemplate().update(company);
	}

	public Company findById(String id) {
		Company company = (Company)this.getHibernateTemplate().get("com.lndp.model.Company", id);
		return company;
	}
	
	public List<Company> findAll() {
		List<Company> companyList = this.getHibernateTemplate().find("FROM Company company ORDER BY company.recommendRate DESC, company.updatedTime DESC");
		return companyList;
	}
	
	public List<Company> findByCategoryId(String categoryId) {
		List<Company> companyList = this.getHibernateTemplate().find("FROM Company company WHERE company.categoryId='" + categoryId 
				+ "' ORDER BY company.recommendRate DESC, company.updatedTime DESC");
		return companyList;
	}
	
	public List<Company> queryForPage(final String hql, final int offset, final int length){
		List<Company> list = getHibernateTemplate().executeFind(
				new HibernateCallback(){

					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						query.setFirstResult(offset);
						query.setMaxResults(length);
						List<Company> list = query.list();
						return list;
					}
					
				}
		);
		
		return list;
	}

	public int getAllRowCount(String hql){
		return getHibernateTemplate().find(hql).size();
	}
	
	public List<Company> findForIndexByRecommendRate(int recommendRate, int recordCound) {
		final String hql = "FROM Company company WHERE company.recommendRate ='" + recommendRate 
			+ "'  ORDER BY company.recommendRate DESC, company.updatedTime DESC";
		final int offset = 0;
		final int length = recordCound;
		
		List<Company> list = getHibernateTemplate().executeFind(
				new HibernateCallback(){

					public Object doInHibernate(Session session)
							throws HibernateException, SQLException {
						Query query = session.createQuery(hql);
						query.setFirstResult(offset);
						query.setMaxResults(length);
						List<Company> list = query.list();
						return list;
					}
					
				}
		);
		
		return list;
	}
}
