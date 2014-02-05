package com.lndp.security;

import com.lndp.dao.IUserinfoDAO;
import com.lndp.exception.UserinfoException;
import com.lndp.model.Userinfo;

public class SecurityManager implements ISecurityManager {

	private IUserinfoDAO dao;
	
	public IUserinfoDAO getDao() {
		return dao;
	}
	
	public void setDao(IUserinfoDAO dao) {
		this.dao = dao;
	}
	
	public Userinfo login(String username, String password)
			throws UserinfoException {
		Userinfo userinfo = dao.login(username, password);
		return userinfo;
	}

}
