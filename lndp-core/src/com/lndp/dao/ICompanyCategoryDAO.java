package com.lndp.dao;

import java.util.List;

import com.lndp.model.CompanyCategory;

public interface ICompanyCategoryDAO {

	public abstract CompanyCategory findById(String id);
	
	public abstract List<CompanyCategory> findAll();
}
