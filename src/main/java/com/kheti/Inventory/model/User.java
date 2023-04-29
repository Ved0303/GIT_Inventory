package com.kheti.Inventory.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class User {

	 @Id
	 @GeneratedValue(strategy=GenerationType.AUTO)
	int id;
	String name;
	String password;
	int role;
	int ownerId;
	
	public User() {
		super();
	}
		
	public User(int id, String name, String password, int role, int ownerId) {
		super();
		this.id = id;
		this.name = name;
		this.password = password;
		this.role = role;
		this.ownerId=ownerId;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public int getRole() {
		return role;
	}
	public void setRole(int role) {
		this.role = role;
	}


	public String getPassword() {
		return password;
	}


	public void setPassword(String password) {
		this.password = password;
	}
	
	public int getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}

	@Override
	public String toString() {
		return "User [id=" + id + ", name=" + name + ", password=" + password + ", role=" + role + ", ownerId="
				+ ownerId + "]";
	}
	
	
}
