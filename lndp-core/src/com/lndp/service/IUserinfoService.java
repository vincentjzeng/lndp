package com.lndp.service;

import java.util.List;

import com.lndp.model.Userinfo;

public interface IUserinfoService {

	public abstract void save(Userinfo userinfo);

	public abstract void delete(Userinfo userinfo);
	
	public abstract void update(Userinfo userinfo);

	public abstract Userinfo findById(java.lang.String id);

	public abstract List<Userinfo> findAll();

}
