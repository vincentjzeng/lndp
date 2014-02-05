package com.lndp.handler;

import org.aopalliance.intercept.MethodInterceptor;
import org.aopalliance.intercept.MethodInvocation;
import org.apache.log4j.Level;
import org.apache.log4j.Logger;

public class TimeHandler implements MethodInterceptor {

	private Logger logger = Logger.getLogger(this.getClass().getName()); 
	
	 public Object invoke(MethodInvocation methodInvocation) throws Throwable {

		long procTime = System.currentTimeMillis();

		/*
		logger.log(Level.INFO, methodInvocation.getArguments()[0] + " start to execute "
				+ methodInvocation.getMethod() + " method");
		*/
		logger.log(Level.INFO, methodInvocation.getMethod() + " method");

		try {

			Object result = methodInvocation.proceed();
			return result;

		} finally {

			// calculate the execution time
			procTime = System.currentTimeMillis() - procTime;

			/*
			logger.log(Level.INFO, methodInvocation.getArguments()[0] + " has executed method "
					+ methodInvocation.getMethod() + " successfully.");
			*/
			logger.log(Level.INFO, methodInvocation.getMethod() + " successfully.");

			logger.log(Level.INFO, "Execute method "
					+ methodInvocation.getMethod().getName() + " has costed "
					+ procTime + " millisecond");

		}

	}

}
