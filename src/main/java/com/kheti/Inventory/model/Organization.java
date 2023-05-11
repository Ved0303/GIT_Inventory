package com.kheti.Inventory.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Organization {
	
	 @Id
	 @GeneratedValue(strategy=GenerationType.AUTO)
	int orgID;
	String orgName;
	String email;
	String phone;
	String aadhar;
	String pan;
	String orgType; //Customer/Supplier
	int ownerId;


	public Organization() {}

	public Organization(int orgID, String orgName, String email, String phone, String aadhar, String pan,
			String orgType, int ownerId) {
		super();
		this.orgID = orgID;
		this.orgName = orgName;
		this.email = email;
		this.phone = phone;
		this.aadhar = aadhar;
		this.pan = pan;
		this.orgType = orgType;
		this.ownerId=ownerId;
		
	}
	
	public Organization(String orgName, String email, String phone, String aadhar, String pan,
			String orgType, int ownerId) {
		super();
		this.orgName = orgName;
		this.email = email;
		this.phone = phone;
		this.aadhar = aadhar;
		this.pan = pan;
		this.orgType = orgType;
		this.ownerId=ownerId;
	}

	public int getOrgID() {
		return orgID;
	}

	public void setOrgID(int orgID) {
		this.orgID = orgID;
	}

	public String getOrgName() {
		return orgName;
	}

	public void setOrgName(String orgName) {
		this.orgName = orgName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getPhone() {
		return phone;
	}

	public void setPhone(String phone) {
		this.phone = phone;
	}

	public String getAadhar() {
		return aadhar;
	}

	public void setAadhar(String aadhar) {
		this.aadhar = aadhar;
	}

	public String getPan() {
		return pan;
	}

	public void setPan(String pan) {
		this.pan = pan;
	}

	public String getOrgType() {
		return orgType;
	}

	public void setOrgType(String orgType) {
		this.orgType = orgType;
	}

	public int getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}
	

}
