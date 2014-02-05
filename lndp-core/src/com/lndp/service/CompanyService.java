package com.lndp.service;

import java.util.List;

import com.lndp.dao.ICompanyDAO;
import com.lndp.model.Company;
import com.lndp.model.News;
import com.lndp.model.PageBean;

public class CompanyService implements ICompanyService {

	
private ICompanyDAO dao;
	
	public ICompanyDAO getDao() {
		return dao;
	}

	public void setDao(ICompanyDAO dao) {
		this.dao = dao;
	}

	public void save(Company company) {
		dao.save(company);
	} 
	
	public void delete(Company company) {
		dao.delete(company);
		
	}
	
	public void update(Company company) {
		dao.update(company);
		
	}

	public Company findById(String id) {
		Company company = dao.findById(id);
		return company;
	}
	
	public List<Company> findAll() {
		List<Company> companyList = dao.findAll();
		return companyList;
	}

	public List<Company> findByCategoryId(String categoryId){
		List<Company> companyList = dao.findByCategoryId(categoryId);
		return companyList;
	}
	
	public List<Company> findForIndexByRecommendRate(int recommendRate, int recoudCount) {
		List<Company> companyList = dao.findForIndexByRecommendRate(recommendRate, recoudCount);
		return companyList;
	}
	
	public PageBean queryForPage(int pageSize, int targetPage){
		final String hql = "FROM Company company ORDER BY company.recommendRate DESC, company.updatedTime DESC";
		int allRow = dao.getAllRowCount(hql);
		int totalPage = PageBean.countTotalPage(pageSize, allRow);
		final int offset = PageBean.countOffset(pageSize, targetPage);
		final int length = pageSize;
		final int currentPage = PageBean.countCurrentPage(targetPage);
		List<Company> list = dao.queryForPage(hql, offset, length);
		
		PageBean pageBean = new PageBean();
		pageBean.setPageSize(pageSize);
		pageBean.setCurrentPage(currentPage);
		pageBean.setAllRow(allRow);
		pageBean.setTotalPage(totalPage);
		pageBean.setList(list);
		pageBean.init();
		return pageBean;
	}
	
	public PageBean queryForPageByCriteria(int pageSize, int targetPage, Company company){
		String categoryId = null;
		int recommendRate = 0;
		String companyName = null;
		String shopLocation = null;
		
		if(company.getCategoryId() != null && !"".equalsIgnoreCase(company.getCategoryId())){
			categoryId = company.getCategoryId();
		}
		
		if(company.getRecommendRate() != null && company.getRecommendRate() != 0){
			recommendRate = company.getRecommendRate();
		}
		
		if(company.getCompanyName() != null && !"".equalsIgnoreCase(company.getCompanyName())){
			companyName = company.getCompanyName();
		}
		
		if(company.getShopLocation() != null && !"".equalsIgnoreCase(company.getShopLocation())){
			shopLocation = company.getShopLocation();
		}
		
		int andCounter = 0;
		int whereCounter = 0;
		
		StringBuilder hqlBuilder = new StringBuilder("FROM Company company ");
		
		if(categoryId != null && !"".equalsIgnoreCase(categoryId)){
			if(whereCounter == 0){
				hqlBuilder.append(" WHERE ");
			}
			whereCounter++;
			if(andCounter > 0){
				hqlBuilder.append(" AND ");
			}
			andCounter++;
			
			hqlBuilder.append(" company.categoryId = '" + categoryId + "' ");
			
		}
			
		if(recommendRate != 0){
			if(whereCounter == 0){
				hqlBuilder.append(" WHERE ");
			}
			whereCounter++;
			if(andCounter > 0){
				hqlBuilder.append(" AND ");
			}
			andCounter++;
			
			hqlBuilder.append(" company.recommendRate >= " + recommendRate);
			
		}
		
		if(companyName != null && !"".equalsIgnoreCase(companyName)){
			if(whereCounter == 0){
				hqlBuilder.append(" WHERE ");
			}
			whereCounter++;
			if(andCounter > 0){
				hqlBuilder.append(" AND ");
			}
			andCounter++;
			
			hqlBuilder.append(" company.companyName LIKE '%" + companyName + "%' ");
			
		}
		
		if(shopLocation != null && !"".equalsIgnoreCase(shopLocation)){
			if(whereCounter == 0){
				hqlBuilder.append(" WHERE ");
			}
			whereCounter++;
			if(andCounter > 0){
				hqlBuilder.append(" AND ");
			}
			andCounter++;
			
			hqlBuilder.append(" company.shopLocation LIKE '%" + shopLocation + "%' ");
			
		}
		
		hqlBuilder.append(" ORDER BY company.recommendRate DESC, company.updatedTime DESC");
		final String hql = hqlBuilder.toString();
		
		int allRow = dao.getAllRowCount(hql);
		int totalPage = PageBean.countTotalPage(pageSize, allRow);
		final int offset = PageBean.countOffset(pageSize, targetPage);
		final int length = pageSize;
		final int currentPage = PageBean.countCurrentPage(targetPage);
		List<Company> list = dao.queryForPage(hql, offset, length);
		
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
