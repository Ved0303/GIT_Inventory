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
public class Payment extends BaseTransaction {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	int id;

	@ManyToOne(fetch = FetchType.LAZY)
	@Nonnull
	Expense expense;

	double amout;
	String paymentType;

	public Payment() {
	}

	public Payment(int id, int enteredBy, Date enteredOn, int ownerId, Expense expense, double amout,
			String paymentType) {
		super(enteredBy, enteredOn, ownerId);
		this.id = id;
		this.expense = expense;
		this.amout = amout;
		this.paymentType = paymentType;
	}

	public Payment(int enteredBy, Date enteredOn, int ownerId, Expense expense, double amout, String paymentType) {
		super(enteredBy, enteredOn, ownerId);
		this.expense = expense;
		this.amout = amout;
		this.paymentType = paymentType;
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

}
