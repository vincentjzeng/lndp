package com.lndp.model;

import java.util.List;

public class ContactInfo {

	private String companyName;
	
	private String companyAddress;
	
	private List<String> contactPersion;
	
	private List<String> phone;
	
	private String postalCode;
	
	private String website;
	
	private String email;
	
	private List<String> im;

	public ContactInfo() {
		super();
		// TODO Auto-generated constructor stub
	}

	public String getCompanyName() {
		return companyName;
	}

	public void setCompanyName(String companyName) {
		this.companyName = companyName;
	}

	public String getCompanyAddress() {
		return companyAddress;
	}

	public void setCompanyAddress(String companyAddress) {
		this.companyAddress = companyAddress;
	}

	public List<String> getContactPersion() {
		return contactPersion;
	}

	public void setContactPersion(List<String> contactPersion) {
		this.contactPersion = contactPersion;
	}

	public List<String> getPhone() {
		return phone;
	}

	public void setPhone(List<String> phone) {
		this.phone = phone;
	}

	public String getPostalCode() {
		return postalCode;
	}

	public void setPostalCode(String postalCode) {
		this.postalCode = postalCode;
	}

	public String getWebsite() {
		return website;
	}

	public void setWebsite(String website) {
		this.website = website;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public List<String> getIm() {
		return im;
	}

	public void setIm(List<String> im) {
		this.im = im;
	}
	
	
	
}
