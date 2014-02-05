package com.lndp.cache;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import com.lndp.model.CompanyCategory;

public class CompanyCategoryCache {

	private static CompanyCategoryCache companyCategoryCache;
	
	private List<CompanyCategory> companyCategoryList;
	
	private Map<String, CompanyCategory> companyCategoryMap;
	
	private CompanyCategoryCache()
	{
		
	}
	
	public static synchronized CompanyCategoryCache getInstance(){
		if(companyCategoryCache == null){
			companyCategoryCache = new CompanyCategoryCache();
		}
		return companyCategoryCache;
	}
	
	private void updateListMap(){
		List<CompanyCategory> companyCategoryList = getCompanyCategoryList();
		if(companyCategoryList != null && getCompanyCategoryList().size() > 0){
			Map<String, CompanyCategory> companyCategoryMap = new HashMap<String, CompanyCategory>();
			
			for(CompanyCategory companyCategory : companyCategoryList){
				
				companyCategoryMap.put(companyCategory.getCategoryId(), companyCategory);
			}
			
			setCompanyCategoryMap(companyCategoryMap);
		}
	}

	public List<CompanyCategory> getCompanyCategoryList() {
		return companyCategoryList;
	}

	public void setCompanyCategoryList(List<CompanyCategory> companyCategoryList) {
		this.companyCategoryList = companyCategoryList;
		// update map after updating the list
		updateListMap();
	}

	public Map<String, CompanyCategory> getCompanyCategoryMap() {
		return companyCategoryMap;
	}

	public void setCompanyCategoryMap(
			Map<String, CompanyCategory> companyCategoryMap) {
		this.companyCategoryMap = companyCategoryMap;
	}

	

}
