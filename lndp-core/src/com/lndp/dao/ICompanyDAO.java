package com.lndp.dao;

import java.util.List;

import com.lndp.model.Company;

public interface ICompanyDAO {

	public abstract void save(Company company);

	public abstract void delete(Company company);
	
	public abstract void update(Company company);

	public abstract Company findById(String id);

	public abstract List<Company> findAll();
	
	public abstract List<Company> findByCategoryId(String categoryId);
	
	public abstract List<Company> findForIndexByRecommendRate(int recommendRate, int recordCound);
	
	public abstract List<Company> queryForPage(final String hql, final int offset, final int length);
	
	public abstract int getAllRowCount(String hql);
}
