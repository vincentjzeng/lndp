package com.lndp.model;

public class CompanyCategory {

	private String categoryId;
	
	private String categoryName;
	
	private String categoryLevel;

	public CompanyCategory() {
		super();
		// TODO Auto-generated constructor stub
	}

	public CompanyCategory(String categoryId, String categoryLevel,
			String categoryName) {
		super();
		this.categoryId = categoryId;
		this.categoryLevel = categoryLevel;
		this.categoryName = categoryName;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public String getCategoryLevel() {
		return categoryLevel;
	}

	public void setCategoryLevel(String categoryLevel) {
		this.categoryLevel = categoryLevel;
	}
	
	public String toString(){
		return "Category ID: " + categoryId + ", Category Name : " + categoryName + ", Category Level :"
		+ categoryLevel;
	}
}
