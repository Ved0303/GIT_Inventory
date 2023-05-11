package com.kheti.Inventory.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class ManPower {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int id;
	String name;
	String email;
	String phone;
	String aadhar;
	String pan;
	String type; // Employee/ Contractor/ Individual
    private int ownerId;

	public ManPower() {
	}

	public ManPower(int id, String name, String email, String phone, String aadhar, String pan, String type, int ownerId) {
		super();
		this.id = id;
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.aadhar = aadhar;
		this.pan = pan;
		this.type = type;
		this.ownerId=ownerId;
	}

	public ManPower(String name, String email, String phone, String aadhar, String pan, String type, int ownerId) {
		super();
		this.name = name;
		this.email = email;
		this.phone = phone;
		this.aadhar = aadhar;
		this.pan = pan;
		this.type = type;
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

	public String getType() {
		return type;
	}

	public void setType(String type) {
		this.type = type;
	}

	public int getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}

	@Override
	public String toString() {
		return "ManPower [id=" + id + ", name=" + name + ", email=" + email + ", phone=" + phone + ", aadhar=" + aadhar
				+ ", pan=" + pan + ", type=" + type + ", ownerId=" + ownerId + "]";
	}
	

}
