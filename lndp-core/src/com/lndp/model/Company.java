package com.lndp.model;

import java.util.Date;

public class Company {
	
	private String companyId;
	
	private String companyName;
	
	private String companyPicUrl;
	
	private String companyDesc;
	
	private String companyAddress;
	
	private String shopLocation;
	
	private String phone;
	
	private String mobile;
	
	private String fax;
	
	private String email;
	
	private String contactPerson;
	
	private String qq;
	
	private String msn;
	
	private String aliTalk;
	
	private String googleTalk;
	
	private String im;
	
	private String websiteAddress;
	
	private String taobao;
	
	private String businessScope;
	
	private Integer recommendRate;
	
	private String remark;
	
	private String categoryId;
	
	private Double clickCount;
	
	private String updatedUser;
	
	private Date updatedTime;

	public Company() {
		super();
		// TODO Auto-generated constructor stub
	}


	public String getCompanyId() {
		return companyId;
	}

	public void setCompanyId(String companyId) {
		this.companyId = companyId;
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyPicUrl() {
		return companyPicUrl;
	}

	public void setCompanyPicUrl(String companyPicUrl) {
		this.companyPicUrl = companyPicUrl;
	}

	public String getCompanyDesc() {
		return companyDesc;
	}

	public void setCompanyDesc(String companyDesc) {
		this.companyDesc = companyDesc;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public String getShopLocation() {
		return shopLocation;
	}

	public void setShopLocation(String shopLocation) {
		this.shopLocation = shopLocation;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getFax() {
		return fax;
	}

	public void setFax(String fax) {
		this.fax = fax;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}
	
	public String getContactPerson() {
		return contactPerson;
	}

	public void setContactPerson(String contactPerson) {
		this.contactPerson = contactPerson;
	}

	public String getQq() {
		return qq;
	}

	public void setQq(String qq) {
		this.qq = qq;
	}

	public String getMsn() {
		return msn;
	}

	public void setMsn(String msn) {
		this.msn = msn;
	}

	public String getAliTalk() {
		return aliTalk;
	}

	public void setAliTalk(String aliTalk) {
		this.aliTalk = aliTalk;
	}

	public String getGoogleTalk() {
		return googleTalk;
	}

	public void setGoogleTalk(String googleTalk) {
		this.googleTalk = googleTalk;
	}

	public String getIm() {
		return im;
	}

	public void setIm(String im) {
		this.im = im;
	}

	public String getWebsiteAddress() {
		return websiteAddress;
	}

	public void setWebsiteAddress(String websiteAddress) {
		this.websiteAddress = websiteAddress;
	}
	
	

	public String getTaobao() {
		return taobao;
	}

	public void setTaobao(String taobao) {
		this.taobao = taobao;
	}

	public String getBusinessScope() {
		return businessScope;
	}

	public void setBusinessScope(String businessScope) {
		this.businessScope = businessScope;
	}

	public Integer getRecommendRate() {
		return recommendRate;
	}

	public void setRecommendRate(Integer recommendRate) {
		this.recommendRate = recommendRate;
	}

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}
	
	public Double getClickCount() {
		return clickCount;
	}

	public void setClickCount(Double clickCount) {
		this.clickCount = clickCount;
	}

	public String getUpdatedUser() {
		return updatedUser;
	}

	public void setUpdatedUser(String updatedUser) {
		this.updatedUser = updatedUser;
	}

	public Date getUpdatedTime() {
		return updatedTime;
	}

	public void setUpdatedTime(Date updatedTime) {
		this.updatedTime = updatedTime;
	}

	public String toString(){
		return "Company ID: " + companyId + ", Company Name : " + companyName + ", Company Pic URL :"
		+ companyPicUrl + ", Company Desc : " + companyDesc + ", Company Address : " + companyAddress
		+ ", Shop Location : " + shopLocation + ", Phone : " + phone + ", Mobile : " + mobile + ", Fax : "
		+ fax + ", Email : " + email + ", Contact Person : " + contactPerson + ", QQ : " + qq + ", MSN :"
		+ msn + ", Ali Talk : " + aliTalk + ", Google Talk : " + googleTalk + ", Instance Message : "		
		+ im + ", WebSite Address : " + websiteAddress + ", Taobao : " + taobao
		+ ", Business Scope : " + businessScope + ", Recommend Rate : " + recommendRate + ", Remark : " 
		+ remark + ", Category ID :" + categoryId + ", Click Count : " + clickCount + ", Updated User :"
		+ updatedUser + ", Updated Time : " + updatedTime;
	}

}

