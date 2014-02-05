package com.lndp.dao;

import java.util.List;

import org.springframework.orm.hibernate3.support.HibernateDaoSupport;

import com.lndp.exception.UserinfoException;
import com.lndp.model.Userinfo;


public class UserinfoDAO extends HibernateDaoSupport implements IUserinfoDAO {

	public void save(Userinfo userinfo) {
		if(userinfo != null){
			this.getHibernateTemplate().save(userinfo);
		}
	}
	
	public void delete(Userinfo userinfo) {
		this.getHibernateTemplate().delete(userinfo);
	}
	
	public void update(Userinfo userinfo) {
		this.getHibernateTemplate().update(userinfo);
	}

	public List<Userinfo> findAll() {
		List<Userinfo> userinfoList = this.getHibernateTemplate().find("FROM Userinfo");
		return userinfoList;
	}

	public Userinfo findById(String id) {
		Userinfo userinfo = (Userinfo)this.getHibernateTemplate().get("com.lndp.model.Userinfo", id);
		return userinfo;
	}

	public Userinfo login(String username, String password) throws UserinfoException {
		List<Userinfo> userinfoList = this.getHibernateTemplate().find("FROM Userinfo userinfo WHERE userinfo.username='" 
				+ username + "' AND userinfo.password='" + password + "'");
		
		Userinfo userinfo = null;
		if(userinfoList != null & userinfoList.size() > 0){
			if(userinfoList.size() > 1){
				throw new UserinfoException("Userinfo does not unique");
			} else {
				userinfo =  userinfoList.get(0);
			}
		} else {
			throw new UserinfoException("User does not exist.");
		}
		
		return userinfo;
	}
}
