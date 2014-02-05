package com.lndp.poc.action;   

import java.io.File;   
import java.io.FileInputStream;   
import java.io.FileOutputStream;   
import java.io.InputStream;   
import java.io.OutputStream;   
import java.util.List;   

import org.apache.log4j.Logger;
import org.apache.struts2.ServletActionContext;   

import com.lndp.poc.action.UploadAction;
import com.opensymphony.xwork2.ActionSupport;


public class UploadAction extends ActionSupport{   
    /**
	 * serialVersionUID
	 */
	private static final long serialVersionUID = -6176331774794405508L;
	
	//  Upload DIR
	//private static final String UPLOAD_DIR="/upload";
    private String savePath;
	//  Upload file list
    private List<File> file;   
    //  Upload file name list
    private List<String> fileFileName;   
    //  Upload file content type list
    private List<String> fileContentType;
    
    static Logger logger = Logger.getLogger(UploadAction.class.getName());
       
    public String form(){   
           
        return SUCCESS;   
    }   
       
    public String execute(){   
        for (int i = 0; i < file.size(); i++) {   
            //for loop upload all the file
            uploadFile(i);   
        }
        return SUCCESS;   
    }   
    // Upload file
    private void uploadFile(int i){   
        try {   
            InputStream is = new FileInputStream(file.get(i));   
               
            String dir = ServletActionContext.getServletContext().getRealPath(savePath);
            logger.info("Save Path : " + dir);
               
            File uploadFile = new File(dir, this.getFileFileName().get(i));   
               
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
