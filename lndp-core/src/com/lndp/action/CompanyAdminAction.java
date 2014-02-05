package com.lndp.action;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.InputStream;
import java.io.OutputStream;
import java.net.InetAddress;
import java.net.UnknownHostException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;
import org.apache.struts2.interceptor.ServletRequestAware;
import org.apache.struts2.interceptor.SessionAware;

import com.lndp.constant.CommonConst;
import com.lndp.model.Company;
import com.lndp.service.ICompanyService;
import com.opensymphony.xwork2.ActionSupport;
import com.opensymphony.xwork2.ValidationAware;
import com.opensymphony.xwork2.interceptor.annotations.InputConfig;

/**
 * @author NetDemon
 *
 */
/**
 * @author NetDemon
 *
 */
/**
 * @author NetDemon
 *
 */
public class CompanyAdminAction extends ActionSupport implements ServletRequestAware, SessionAware, ValidationAware {
	
	/**
	 * 
	 */
	private static final long serialVersionUID = -8403224823186107070L;

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
	
	private String message;
	
	private String action;

	private ICompanyService service;
	
	private HttpServletRequest servletRequest;
	
	private Map session;
	// upload file properties
	// Upload DIR
	// private static final String UPLOAD_DIR="/upload";
    private String savePath;
    // app name such as 'lndp'
    private final static String APP_NAME = "lndp";
    // the prefix of the save path, to replace the /lndp
    private final static String COMMON_LOCATION = "/common";
    
    private final static String BACKSPACE = "..";
	// Upload file list
    private List<File> file;   
    // Upload file name list
    private List<String> fileFileName;   
    // Upload file content type list
    private List<String> fileContentType;
	// Result string list
	private static final String RESULT_LIST = "list";
	// Result string show
	private static final String RESULT_SHOW = "show";
	// Result strng update
	private static final String RESULT_UPDATE = "update";
	
	private static final String RESULT_ADD_INPUT = "add_input";
	
	private static final String RESULT_UPDATE_INPUT = "update_input";
	
	private static final String RESULT_COMPANY_FIND_ALL_ACTION = "company_find_all_action";
	// action type - view
	private static final String ACTION_VIEW = "view";
	// action type - update
	private static final String ACTION_UPDATE = "update";
	// default value for all company
	private static final String COMPANY_CATEGORY_ALL = "0";
	
	private static Logger logger = Logger.getLogger(CompanyAdminAction.class.getName());
	
	
	private List<String> getCompanyPicUrlList(){
		List<String> companyPicUrlList = new ArrayList<String>();
		List<String> fileNameList = null;
		
		if(file != null && file.size() > 0){
			for (int i = 0; i < file.size(); i++) {   
	            //for loop upload all the file
				fileNameList = uploadFile(i);
	            
				if(fileNameList != null && fileNameList.size() > 0){
					String tmpPath = BACKSPACE + COMMON_LOCATION + savePath + fileNameList.get(i);
					companyPicUrlList.add(tmpPath);
				}
	        }
		}
		
		return companyPicUrlList;
	}
	
	@InputConfig(resultName=RESULT_ADD_INPUT)
	public String add(){
		
		logger.info("Add company info start...");
		
		List<String> companyPicUrlList = getCompanyPicUrlList();
		
		if(companyPicUrlList != null && companyPicUrlList.size() > 0){
			companyPicUrl = companyPicUrlList.get(0);
		}
		/* company pic can be null.
		else{
			message = "No company pic exist in the list.";
			return ERROR;
		}
		*/
		
		Company company = new Company();
		company.setCompanyName(companyName);
		company.setCompanyPicUrl(companyPicUrl);
		company.setCompanyDesc(companyDesc);
		company.setCompanyAddress(companyAddress);
		company.setShopLocation(shopLocation);
		company.setPhone(phone);
		company.setMobile(mobile);
		company.setFax(fax);
		company.setEmail(email);
		company.setContactPerson(contactPerson);
		company.setQq(qq);
		company.setMsn(msn);
		company.setAliTalk(aliTalk);
		company.setGoogleTalk(googleTalk);
		company.setIm(im);
		company.setWebsiteAddress(websiteAddress);
		company.setTaobao(taobao);
		company.setBusinessScope(businessScope);
		company.setRecommendRate(recommendRate);
		company.setRemark(remark);
		company.setCategoryId(categoryId);
		company.setClickCount(clickCount);
		company.setUpdatedTime(new Date());
		company.setUpdatedUser("*SYSTEM");
		
		service.save(company);
		logger.info("Company [" + company + "] has been saved.");
		
		return RESULT_COMPANY_FIND_ALL_ACTION;
	}
	
	public String delete(){
		
		logger.info("Delete company info start...");
		
		Company company = service.findById(companyId);
		if(company != null){
			service.delete(company);
			// Try to delete the previous uploaded file.
			deleteUploadedFile(company);
		} else {
			logger.info("Company [" + company + "] does not exist.");
		}
		
		return RESULT_COMPANY_FIND_ALL_ACTION;
	}
	
	@InputConfig(resultName=RESULT_UPDATE_INPUT)  
	public String update(){
		
		logger.info("Update company info start...");

		Company company = service.findById(companyId);
		if(company != null){
			
			company.setCompanyName(companyName);
			
			List<String> companyPicUrlList = getCompanyPicUrlList();
			
			if(companyPicUrlList != null && companyPicUrlList.size() > 0){
				companyPicUrl = companyPicUrlList.get(0);
			}
			
			if(companyPicUrl != null){
				// Try to delete the previous uploaded file.
				deleteUploadedFile(company);
				// set the new company pic url in the company object
				company.setCompanyPicUrl(companyPicUrl);
				logger.info("Company Pic has updated to " + companyPicUrl);
			} else {
				logger.info("Company Pic will not be updated");
			}
			company.setCompanyDesc(companyDesc);
			company.setCompanyAddress(companyAddress);
			company.setShopLocation(shopLocation);
			company.setPhone(phone);
			company.setMobile(mobile);
			company.setFax(fax);
			company.setEmail(email);
			company.setContactPerson(contactPerson);
			company.setQq(qq);
			company.setMsn(msn);
			company.setAliTalk(aliTalk);
			company.setGoogleTalk(googleTalk);
			company.setIm(im);
			company.setWebsiteAddress(websiteAddress);
			company.setTaobao(taobao);
			company.setBusinessScope(businessScope);
			company.setRecommendRate(recommendRate);
			company.setRemark(remark);
			company.setCategoryId(categoryId);
			company.setClickCount(clickCount);
			company.setUpdatedTime(new Date());
			company.setUpdatedUser("*SYSTEM");
			
			service.update(company);
			logger.info("Company [" + company + "] has been updated.");
		} else {
			logger.info("Company [" + company + "] does not exist.");
		}
		
		return RESULT_COMPANY_FIND_ALL_ACTION;
	}
	
	
	public String findById(){
		
		Company company = service.findById(companyId);
		if(company != null){
			this.getServletRequest().setAttribute("company", company);
			logger.debug("Company [" + company + "] has been found.");
		} else {
			logger.info("Company [" + company + "] does not exist.");
		}
		
		if(ACTION_VIEW.equalsIgnoreCase(action)){
			return RESULT_SHOW;
		} else if(ACTION_UPDATE.equalsIgnoreCase(action)){
			return RESULT_UPDATE;
		}
		return SUCCESS;
	}
	
	public String findAll(){
		
		List<Company> companyList = service.findAll();
		if(companyList != null && companyList.size() != 0){
			for(Company company : companyList){
				logger.info("Company" + company + "] has been found.");
			}
			this.getServletRequest().setAttribute("companyList", companyList);
		} else {
			logger.info("No company exist.");
		}
		
		return RESULT_LIST;
	}
	
	public String findByCategoryId(){
		
		if(categoryId.equalsIgnoreCase(COMPANY_CATEGORY_ALL)){
			return RESULT_COMPANY_FIND_ALL_ACTION;
		}
		
		List<Company> companyList = service.findByCategoryId(categoryId);
		if(companyList != null && companyList.size() != 0){
			for(Company company : companyList){
				logger.info("Company " + company + "] has been found.");
			}
			this.getServletRequest().setAttribute("companyList", companyList);
		} else {
			logger.info("No company exist.");
		}
		
		return RESULT_LIST;
	}
	
	
    /**
     * Upload files according to the file index and return the uploaded file list
     * @param i: index of the file list
     * @return: List<String>
     */
    private List<String> uploadFile(int i){
    	
    	List<String> fileNameList = null;
        try {   
            InputStream is = new FileInputStream(file.get(i));
               
            String rootDir = ServletActionContext.getServletContext().getRealPath("/");
            logger.info("Application root path - " + rootDir);
            String dir = rootDir.substring(0, rootDir.lastIndexOf(APP_NAME) - 1) + COMMON_LOCATION + savePath;
            logger.info("Save file path - " + dir);
            // File uploadFile = new File(dir, this.getFileFileName().get(i));            
            fileNameList = new ArrayList<String>();
            int extPosn = this.getFileFileName().get(i).lastIndexOf('.'); 
            String extension = this.getFileFileName().get(i).substring(extPosn + 1);
            fileNameList.add(i, genFileName() + "." + extension);
            
            File uploadFile = new File(dir, fileNameList.get(i));
               
            OutputStream os = new FileOutputStream(uploadFile);
               
            byte [] buffer = new byte[1024*1024];   
               
            int length;   
            while ((length = is.read(buffer)) > 0) {   
                os.write(buffer, 0, length);   
            }   
               
            is.close();   
            os.close();   
        } catch (Exception e) {   
            e.printStackTrace();   
            logger.error("File [" + this.getFileFileName().get(i) + "] fail to upload.");
        }
        
        return fileNameList;
    }
    
    /**
     * Delete the file according to the file location and name.
     * @param company
     */
    private void deleteUploadedFile(Company company) {

    	 String rootDir = ServletActionContext.getServletContext().getRealPath("/");
         logger.info("Root path of application - " + rootDir);
         String dir = rootDir.substring(0, rootDir.lastIndexOf(APP_NAME) - 1) + COMMON_LOCATION + savePath;
         logger.info("Save file path - " + dir);

		int fileNamePosn = company.getCompanyPicUrl().lastIndexOf("/");
		String fileName = company.getCompanyPicUrl().substring(fileNamePosn + 1);
		logger.info("File name - " + fileName);

		File file = new File(dir + "/"  + fileName);
		if (file.exists() && file.isFile()){
			file.delete();
			logger.info("File " + file.getName() + " has been deleted.");
		} else {
			logger.info("File " + file.getName() + " does not exist.");
		}
	}
    
    /**
     * Generate file name according to the timestamp and hostname.
     * @return: String
     */
    private static String genFileName(){
    	
    	String fileName = null;
    	String timestamp = null;
    	String hostname = null;
    	
    	SimpleDateFormat dateformat = new SimpleDateFormat(CommonConst.DATETIME_FORMAT_WITH_TIMESTAMP);
        timestamp = dateformat.format(new Date());
        
        try { 
        	InetAddress addr = InetAddress.getLocalHost(); 
	        // Get IP Address 
        	byte[] ipAddr = addr.getAddress(); 
	        // Get hostname 
	        hostname = addr.getHostName(); 
        } catch (UnknownHostException e) { 
        	e.printStackTrace();
        	return ERROR;
        } 
        
        fileName = timestamp + "-" + hostname;
        
    	return fileName;
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

	public String getMessage() {
		return message;
	}

	public void setMessage(String message) {
		this.message = message;
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

	 public List<File> getFile() {   
	        return file;   
    }
    
    public void setFile(List<File> file) {   
        this.file = file;   
    }
    
    public List<String> getFileContentType() {   
        return fileContentType;   
    }
    
    public void setFileContentType(List<String> fileContentType) {   
        this.fileContentType = fileContentType;   
    }
    
    public List<String> getFileFileName() {   
        return fileFileName;   
    }
    
    public void setFileFileName(List<String> fileFileName) {   
        this.fileFileName = fileFileName;   
    }   
    
    public String getSavePath() {
		return savePath;
	}

	public void setSavePath(String savePath) {
		this.savePath = savePath;
	}
}
