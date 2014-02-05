/**
 * 
 */
package com.lndp.exception;

/**
 * @author NetDemon
 *
 */
public class CompanyException extends Exception {

	/**
	 * 
	 */
	private static final long serialVersionUID = -918169752026980356L;

	/**
	 * 
	 */
	public CompanyException() {
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 */
	public CompanyException(String message) {
		super(message);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param cause
	 */
	public CompanyException(Throwable cause) {
		super(cause);
		// TODO Auto-generated constructor stub
	}

	/**
	 * @param message
	 * @param cause
	 */
	public CompanyException(String message, Throwable cause) {
		super(message, cause);
		// TODO Auto-generated constructor stub
	}

}
