package com.lndp.service;

import java.util.List;

import com.lndp.model.Company;
import com.lndp.model.PageBean;

public interface ICompanyService {

	public abstract void save(Company news);

	public abstract void delete(Company news);
	
	public abstract void update(Company news);

	public abstract Company findById(java.lang.String id);

	public abstract List<Company> findAll();
	
	public abstract List<Company> findByCategoryId(String categoryId);
	
	public abstract List<Company> findForIndexByRecommendRate(int recommendRate, int recoudCount);
	
	public abstract PageBean queryForPage(int pageSize, int currentPage);
	
	public abstract PageBean queryForPageByCriteria(int pageSize, int targetPage, Company company);
}
