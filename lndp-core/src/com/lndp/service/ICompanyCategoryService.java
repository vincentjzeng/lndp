package com.lndp.service;

import java.util.List;

import com.lndp.model.CompanyCategory;

public interface ICompanyCategoryService {

	public abstract CompanyCategory findById(java.lang.String id);

	public abstract List<CompanyCategory> findAll();
}
