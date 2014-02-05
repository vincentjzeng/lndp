package com.lndp.dao;

import java.util.List;

import com.lndp.exception.UserinfoException;
import com.lndp.model.Userinfo;

public interface IUserinfoDAO {

	public abstract void save(Userinfo userinfo);

	public abstract void delete(Userinfo userinfo);
	
	public abstract void update(Userinfo userinfo);

	public abstract Userinfo findById(String id);

	public abstract List<Userinfo> findAll();

	public abstract Userinfo login(String username, String password) throws UserinfoException;
}
