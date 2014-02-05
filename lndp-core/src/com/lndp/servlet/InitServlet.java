package com.lndp.servlet;

import java.io.IOException;
import java.io.UnsupportedEncodingException;
import java.util.List;
import java.util.ResourceBundle;

import javax.servlet.ServletConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.apache.log4j.Logger;
import org.springframework.web.context.WebApplicationContext;
import org.springframework.web.context.support.WebApplicationContextUtils;

import com.lndp.cache.CompanyCategoryCache;
import com.lndp.model.CompanyCategory;
import com.lndp.model.Contact;
import com.lndp.service.ICompanyCategoryService;

/**
 * Servlet implementation class InitServlet
 */
public class InitServlet extends HttpServlet {
	
	private ICompanyCategoryService service;
	
	private static final long serialVersionUID = 1L;
	
	private static Logger logger = Logger.getLogger(InitServlet.class.getName());
       
	/* 
	 * Init
	 * @see javax.servlet.GenericServlet#init(javax.servlet.ServletConfig)
	 */
	public void init(ServletConfig config) throws ServletException{
        super.init(config);
        
        ServletContext application = this.getServletContext();
		
        WebApplicationContext ctx = WebApplicationContextUtils.getRequiredWebApplicationContext(application);
        
        initCompanyInfo(application, ctx);
		
		initContactInfo(application);
		
		logger.info("LNDP has started. Enjoy!");
		
		ServletContext w = config.getServletContext();
		String dir = w.getRealPath("/../"); 
		logger.info("LNDP root path! + " + dir);
	}

	private void initContactInfo(ServletContext application) {
		ResourceBundle resource = ResourceBundle.getBundle("contact");
		/// commonVariable.properties file will be in WEB-INF/classess  folder
		Contact contact = new Contact();
		
		try {
			String companyName = new String(resource.getString("contact.companyName").getBytes("ISO-8859-1"), "UTF-8");
			String companyTel = new String(resource.getString("contact.companyTel").getBytes("ISO-8859-1"), "UTF-8");
			String companyFax = new String(resource.getString("contact.companyFax").getBytes("ISO-8859-1"), "UTF-8");
			String companyAddress = new String(resource.getString("contact.companyAddress").getBytes("ISO-8859-1"), "UTF-8");
			String companyPost = new String(resource.getString("contact.companyPost").getBytes("ISO-8859-1"), "UTF-8");
			String clientServiceQQ = new String(resource.getString("contact.clientServiceQQ").getBytes("ISO-8859-1"), "UTF-8");
			String companyDeveloper = new String(resource.getString("contact.companyDeveloper").getBytes("ISO-8859-1"), "UTF-8");
			String companyEmail = new String(resource.getString("contact.companyEmail").getBytes("ISO-8859-1"), "UTF-8");
			String companyWebsite = new String(resource.getString("contact.companyWebsite").getBytes("ISO-8859-1"), "UTF-8");
			
			contact.setCompanyName(companyName);
			contact.setCompanyTel(companyTel);
			contact.setCompanyFax(companyFax);
			contact.setCompanyAddress(companyAddress);
			contact.setCompanyPost(companyPost);
			contact.setClientServiceQQ(clientServiceQQ);
			contact.setCompanyDeveloper(companyDeveloper);
			contact.setCompanyWebsite(companyWebsite);
			contact.setCompanyEmail(companyEmail);
			
			application.setAttribute("contact", contact);
			
		} catch (UnsupportedEncodingException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	private void initCompanyInfo(ServletContext application,
			WebApplicationContext ctx) {
		ICompanyCategoryService service = (ICompanyCategoryService)ctx.getBean("companyCategoryService");
        
		List<CompanyCategory> companyCategoryList = service.findAll();
		if(companyCategoryList != null && companyCategoryList.size() != 0){
			for(CompanyCategory companyCategory : companyCategoryList){
				logger.info("Company Category " + companyCategory + "] has been found.");
			}
			
			application.setAttribute("companyCategoryList", companyCategoryList);
			// put the companyCategoryList into CompanyCategoryCache
			CompanyCategoryCache companyCategoryCache = CompanyCategoryCache.getInstance();
			companyCategoryCache.setCompanyCategoryList(companyCategoryList);
		} else {
			logger.info("No company category exist.");
		}
	}
	
    /**
     * @see HttpServlet#HttpServlet()
     */
    public InitServlet() {
        super();
    }
    
    

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doGet(request, response);
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		super.doPost(request, response);
	}

	public ICompanyCategoryService getService() {
		return service;
	}

	public void setService(ICompanyCategoryService service) {
		System.out.println("pdczjv - set init service : " + service.toString());
		this.service = service;
	}
	
	

}
