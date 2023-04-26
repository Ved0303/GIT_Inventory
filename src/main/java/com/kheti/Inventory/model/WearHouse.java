package com.kheti.Inventory.model;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class WearHouse {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)	
	int id;
	
	String wearHouseName;
	String wearHouseAddress;
	String wearHouseContact;
	
	public WearHouse() {}
	
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public String getWearHouseName() {
		return wearHouseName;
	}
	public void setWearHouseName(String wearHouseName) {
		this.wearHouseName = wearHouseName;
	}
	public String getWearHouseAddress() {
		return wearHouseAddress;
	}
	public void setWearHouseAddress(String wearHouseAddress) {
		this.wearHouseAddress = wearHouseAddress;
	}
	public String getWearHouseContact() {
		return wearHouseContact;
	}
	public void setWearHouseContact(String wearHouseContact) {
		this.wearHouseContact = wearHouseContact;
	}
	
	

}
