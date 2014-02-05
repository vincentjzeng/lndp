package com.lndp.action;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.lndp.constant.CompanyConst;
import com.lndp.model.Company;
import com.lndp.model.PageBean;
import com.lndp.service.ICompanyService;
import com.opensymphony.xwork2.ActionSupport;

public class CompanyAction extends ActionSupport implements ServletRequestAware, SessionAware {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8403224823186107070L;

	private String companyId;
	
	private String companyName;
	
	private String companyPicUrl;
	
	private List<String> companyPicUrlList;
	
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
	
	private String remark;
	
	private Integer recommendRate;
	
	private String categoryId;
	// message
	private String message;
	// target page
	private int targetPage;
	//page size
	private int pageSize;
	// page bean including the result list
	private PageBean pageBean;
	
	private String action;
	
	private ICompanyService service;
	
	private HttpServletRequest servletRequest;
	
	private Map session;
	// result type list
	private static String RESULT_LIST = "list";
	// result type show
	private static String RESULT_SHOW = "show";
	
	private static String COMPANY_CATEGORY_ALL = "0";
	
	private static Logger logger = Logger.getLogger(CompanyAction.class.getName());
	
	
	
	public String findById(){
		
		Company company = service.findById(companyId);
		if(company != null){
			this.getServletRequest().setAttribute("company", company);
			logger.debug("Company [" + company + "] has been found.");
		} else {
			logger.info("Company [" + company + "] does not exist.");
		}
		
		return RESULT_SHOW;
	}

	
	public String findForPage(){

		this.pageBean = service.queryForPage(CompanyConst.COMPANY_PAGE_SIZE, targetPage);
		
		if(pageSize != 0){
			this.pageBean = service.queryForPage(pageSize, targetPage);
		} else {
			this.pageBean = service.queryForPage(CompanyConst.COMPANY_PAGE_SIZE, targetPage);
		}
		
		
		List<Company> companyList = pageBean.getList();
		if(companyList != null && companyList.size() != 0){
			for(Company company : companyList){
				logger.info("Company" + company + "] has been found.");
			}
			this.getServletRequest().setAttribute("pageBean", pageBean);
		} else {
			logger.info("No company exist.");
		}
		
		return RESULT_LIST;
	}
	
	public String findForPageByCriteria(){
		
		Company tmpCompany = new Company();
		tmpCompany.setCategoryId(categoryId.trim());
		tmpCompany.setRecommendRate(recommendRate);
		tmpCompany.setCompanyName(companyName.trim());
		tmpCompany.setShopLocation(shopLocation.trim());
		
		if(pageSize != 0){
			this.pageBean = service.queryForPageByCriteria(pageSize, targetPage, tmpCompany);
		} else {
			this.pageBean = service.queryForPageByCriteria(CompanyConst.COMPANY_PAGE_SIZE, targetPage, tmpCompany);
		}
		
		List<Company> companyList = pageBean.getList();
		if(companyList != null && companyList.size() != 0){
			for(Company company : companyList){
				logger.info("Company" + company + "] has been found.");
			}
			this.getServletRequest().setAttribute("pageBean", pageBean);	
		} else {
			logger.info("No company exist.");
		}
		
		return RESULT_LIST;
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

	//@RequiredFieldValidator(type = ValidatorType.FIELD,
    //        shortCircuit = true, message = "Company name is required") 
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

	public String getRemark() {
		return remark;
	}

	public void setRemark(String remark) {
		this.remark = remark;
	}
	

	public Integer getRecommendRate() {
		return recommendRate;
	}

	public void setRecommendRate(Integer recommendRate) {
		this.recommendRate = recommendRate;
	}

	public String getCategoryId() {
		return categoryId;
	}

	public void setCategoryId(String categoryId) {
		this.categoryId = categoryId;
	}

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
	}
	
	public int getTargetPage() {
		return targetPage;
	}

	public void setTargetPage(int targetPage) {
		this.targetPage = targetPage;
	}

	public int getPageSize() {
		return pageSize;
	}

	public void setPageSize(int pageSize) {
		this.pageSize = pageSize;
	}

	public PageBean getPageBean() {
		return pageBean;
	}

	public void setPageBean(PageBean pageBean) {
		this.pageBean = pageBean;
	}
	
	public String getAction() {
		return action;
	}

	public void setAction(String action) {
		this.action = action;
	}
	
	public ICompanyService getService() {
		return service;
	}

	public void setService(ICompanyService service) {
		this.service = service;
	}

	public void setServletRequest(HttpServletRequest servletRequest) {
		this.servletRequest = servletRequest;
	}

	public HttpServletRequest getServletRequest() {
		return servletRequest;
	}
	
	public Map getSession() {
		return session;
	}

	public void setSession(Map session) {
		this.session = session;
	}

}
