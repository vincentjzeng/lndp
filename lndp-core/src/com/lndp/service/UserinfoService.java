package com.lndp.service;

import java.util.List;

import com.lndp.dao.IUserinfoDAO;
import com.lndp.model.Userinfo;


public class UserinfoService implements IUserinfoService {

	private IUserinfoDAO dao;
	
	public IUserinfoDAO getDao() {
		return dao;
	}

	public void setDao(IUserinfoDAO dao) {
		this.dao = dao;
	}

	public void save(Userinfo userinfo) {
		dao.save(userinfo);
	} 
	
	public void delete(Userinfo userinfo) {
		dao.delete(userinfo);
		
	}
	
	public void update(Userinfo userinfo) {
		dao.update(userinfo);
		
	}

	public List<Userinfo> findAll() {
		List<Userinfo> userinfoList = dao.findAll();
		return userinfoList;
	}

	public Userinfo findById(String id) {
		Userinfo userinfo = dao.findById(id);
		return userinfo;
	}

}
