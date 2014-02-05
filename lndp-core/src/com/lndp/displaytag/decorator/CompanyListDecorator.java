package com.lndp.displaytag.decorator;


import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Map;

import javax.servlet.ServletContext;

import org.displaytag.decorator.TableDecorator;
import org.springframework.web.context.ServletContextAware;

import com.lndp.cache.CompanyCategoryCache;
import com.lndp.model.Company;
import com.lndp.model.CompanyCategory;
import com.lndp.service.ICompanyCategoryService;

public class CompanyListDecorator extends TableDecorator implements ServletContextAware {
	
	private ICompanyCategoryService service;
	
	private ServletContext servletContext;
	
	public String getOperation()
	{
			Company company = (Company)getCurrentRowObject();
	        String companyId = company.getCompanyId();

	        return "<a href=\"company_admin_findById.action?action=view&companyId=" + companyId 
	        		+ 	"\"><img src=\"resource/style/backend/img/icons/user.png\" "
	        		+	"title=\"查看公司\"  /></a>"
					+ 	"<a href=\"company_admin_findById.action?action=update&companyId=" + companyId 
					+	"\"><img src=\"resource/style/backend/img/icons/user_edit.png\" title=\"更新公司\" "
					+	" /> </a> "
					+ 	"<a href=\"company_admin_delete.action?action=delete&companyId=" + companyId
					+ 	"\"><img src=\"resource/style/backend/img/icons/user_delete.png\""
					+	"title=\"删除公司\" /> </a>";
	}
	
	public String getCategoryId(){
		Company company = (Company)getCurrentRowObject();
        String categoryId = company.getCategoryId();
        
        CompanyCategoryCache companyCategoryCache = CompanyCategoryCache.getInstance();
        Map<String, CompanyCategory> companyCategoryMap = companyCategoryCache.getCompanyCategoryMap();
        
		CompanyCategory companyCategory = companyCategoryMap.get(categoryId);
		return companyCategory.getCategoryName();
	}
	
	public String getUpdatedTime(){
		Company company = (Company)getCurrentRowObject();
        Date updatedTime = company.getUpdatedTime();
        SimpleDateFormat dateformat = new SimpleDateFormat("yyyy-MM-dd HH:mm");  
        String rsDateTime = dateformat.format(updatedTime);
        return rsDateTime;
        
	}

	public ICompanyCategoryService getService() {
		return service;
	}

	public void setService(ICompanyCategoryService service) {
		this.service = service;
	}

	public ServletContext getServletContext() {
		return servletContext;
	}

	public void setServletContext(ServletContext servletContext) {
		this.servletContext = servletContext;
	}
	
	
}
