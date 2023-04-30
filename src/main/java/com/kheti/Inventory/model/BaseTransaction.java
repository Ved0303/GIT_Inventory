package com.kheti.Inventory.model;

import java.util.Date;

public abstract class BaseTransaction {

	int enteredBy;
	Date enteredOn;
	int ownerId;
	public int getEnteredBy() {
		return enteredBy;
	}
	public void setEnteredBy(int enteredBy) {
		this.enteredBy = enteredBy;
	}
	public Date getEnteredOn() {
		return enteredOn;
	}
	public void setEnteredOn(Date enteredOn) {
		this.enteredOn = enteredOn;
	}
	public int getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}
	public BaseTransaction(int enteredBy, Date enteredOn, int ownerId) {
		super();
		this.enteredBy = enteredBy;
		this.enteredOn = enteredOn;
		this.ownerId = ownerId;
	}
	
	public BaseTransaction() {}
	

}
