package com.lndp.model;

public class Userinfo {
	
	private String userId;
	
	private String username;
	
	private String password;
	
	private String userType;

	
	public Userinfo() {
		super();
	}

	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUsername() {
		return username;
	}

	public void setUsername(String username) {
		this.username = username;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getUserType() {
		return userType;
	}

	public void setUserType(String userType) {
		this.userType = userType;
	}

	public String toString(){
		return "User ID: " + userId + ", User Name : " + username + ", User Type :"
		+ userType;
	}
	
	
}
