/**
 * 
 */
package com.lndp.service;

import java.util.List;

import com.lndp.dao.ICompanyCategoryDAO;
import com.lndp.model.CompanyCategory;

/**
 * @author NetDemon
 *
 */
public class CompanyCategoryService implements ICompanyCategoryService {

	private ICompanyCategoryDAO dao;
	
	public ICompanyCategoryDAO getDao() {
		return dao;
	}

	public void setDao(ICompanyCategoryDAO dao) {
		this.dao = dao;
	}
	
	/* (non-Javadoc)
	 * @see com.lndp.service.ICompanyCategoryService#findAll()
	 */
	public List<CompanyCategory> findAll() {
		// TODO Auto-generated method stub
		List<CompanyCategory> companyCategoryList = dao.findAll();
		return companyCategoryList;
	}

	/* (non-Javadoc)
	 * @see com.lndp.service.ICompanyCategoryService#findById(java.lang.String)
	 */
	public CompanyCategory findById(String id) {
		// TODO Auto-generated method stub
		CompanyCategory companyCategory = dao.findById(id);
		return companyCategory;
	}

}
