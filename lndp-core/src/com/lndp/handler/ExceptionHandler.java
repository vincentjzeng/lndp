/**
 * 
 */
package com.lndp.handler;

import java.lang.reflect.Method;

import org.apache.log4j.Level;
import org.apache.log4j.Logger;
import org.springframework.aop.ThrowsAdvice;

/**
 * @author NetDemon
 *
 */
public class ExceptionHandler implements ThrowsAdvice {

	private Logger logger = Logger.getLogger(this.getClass().getName()); 
	
	/**
	 * 
	 */
	public ExceptionHandler() {
		// TODO Auto-generated constructor stub
	}
	
	public void afterThrowing(Method method, Object[] args, Object target, Throwable subclass) throws Throwable {

        //logger.log(Level.INFO, args[0] + " when method " + method.getName() + " executed, throws exception - " + subclass);
		logger.log(Level.INFO, method.getName() + " executed, throws exception - " + subclass);
}

}
