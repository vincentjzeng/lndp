package com.lndp.security;

import com.lndp.exception.UserinfoException;
import com.lndp.model.Userinfo;

public interface ISecurityManager {

	public abstract Userinfo login(String username, String password) throws UserinfoException;
}
