package com.kheti.Inventory.model;

import java.util.Date;

import jakarta.annotation.Nonnull;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;

@Entity
public class Payment {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int id;

	@ManyToOne(fetch = FetchType.LAZY)
	@Nonnull
	Expense expense;

	double amout;
	String paymentType;
	String comment;

	int enteredBy;
	Date enteredOn;
	int ownerId;


	public Payment() {
	}

	public Payment(int id, int enteredBy, Date enteredOn, int ownerId, Expense expense, double amout,
			String paymentType,String comment) {
		this.enteredBy=enteredBy;
		this.enteredOn=enteredOn;
		this.ownerId=ownerId;
		this.id = id;
		this.expense = expense;
		this.amout = amout;
		this.paymentType = paymentType;
		this.comment=comment;
	}

	public Payment(int enteredBy, Date enteredOn, int ownerId, Expense expense, double amout, String paymentType,String comment) {
		this.enteredBy=enteredBy;
		this.enteredOn=enteredOn;
		this.ownerId=ownerId;
		this.expense = expense;
		this.amout = amout;
		this.paymentType = paymentType;
		this.comment=comment;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public Expense getExpense() {
		return expense;
	}

	public void setExpense(Expense expense) {
		this.expense = expense;
	}

	public double getAmout() {
		return amout;
	}

	public void setAmout(double amout) {
		this.amout = amout;
	}

	public String getPaymentType() {
		return paymentType;
	}

	public void setPaymentType(String paymentType) {
		this.paymentType = paymentType;
	}

	public String getComment() {
		return comment;
	}

	public void setComment(String comment) {
		this.comment = comment;
	}
	
	

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

	@Override
	public String toString() {
		return "Payment [id=" + id + ", expense=" + expense + ", amout=" + amout + ", paymentType=" + paymentType
				+ ", comment=" + comment + ", enteredBy=" + enteredBy + ", enteredOn=" + enteredOn + ", ownerId="
				+ ownerId + "]";
	}

}
