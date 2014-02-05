/**
 * 
 */
package com.lndp.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.lndp.model.CompanyCategory;

/**
 * @author NetDemon
 *
 */
public class CompanyCategoryDAO extends HibernateDaoSupport implements ICompanyCategoryDAO {

	/* (non-Javadoc)
	 * @see com.lndp.dao.ICompanyCategoryDAO#findAll()
	 */
	public List<CompanyCategory> findAll() {
		// TODO Auto-generated method stub
		List<CompanyCategory> companyCategoryList = this.getHibernateTemplate().find("FROM CompanyCategory companyCategory ORDER BY companyCategory.categoryId DESC");
		return companyCategoryList;
	}

	/* (non-Javadoc)
	 * @see com.lndp.dao.ICompanyCategoryDAO#findById(java.lang.String)
	 */
	public CompanyCategory findById(String id) {
		// TODO Auto-generated method stub
		CompanyCategory companyCategory = (CompanyCategory)this.getHibernateTemplate().get("com.lndp.model.CompanyCategory", id);
		return companyCategory;
	}

}
