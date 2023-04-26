package com.kheti.Inventory.model;

import org.springframework.stereotype.Component;
import org.springframework.web.context.annotation.SessionScope;

//@Component
//@SessionScope
public class LoginDetail {
	
	String userName;
	int userId;
	int role;
	public String getUserName() {
		return userName;
	}
	public void setUserName(String userName) {
		this.userName = userName;
	}
	public int getUserId() {
		return userId;
	}
	public void setUserId(int userId) {
		this.userId = userId;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}
	
	

}
