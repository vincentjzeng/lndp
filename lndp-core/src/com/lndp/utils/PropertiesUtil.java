
package com.lndp.utils;

import java.io.IOException;
import java.io.InputStream;
import java.util.Properties;


/**
 * Property Settings storage 
 *
 */

public class PropertiesUtil {

	private static Properties prop = new Properties();

	/**
	 * Constructor
	 * @throws IOException 
	 * @throws FacadeException 
	 */
	public PropertiesUtil(String filename) throws IOException {
		InputStream is = PropertiesUtil.class.getClassLoader().getResourceAsStream(filename);
		this.load(is);
	}

	/**
	 * @param key
	 * @return
	 */
	public String getString(String key) {
		return prop.getProperty(key);
	}

    /**
     * Read properties file.
     * @param is
     * @throws IOException 
     */
    private void load(InputStream is) throws IOException {
    	prop.load(is); 	 	
    }
	
}
