package com.kheti.Inventory.model;

import java.util.Date;
import java.util.List;

import jakarta.annotation.Nullable;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.ManyToOne;
import jakarta.persistence.OneToMany;

@Entity
public class Expense  {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	int id;
	
	String taxApplied;//yes/no
	String fullPaid;//full/partial
	String transactionType;//purchase/sell

	@ManyToOne(fetch = FetchType.LAZY)
	Organization vender;
	
	double totalAmount; //Sum of Expense_Product_Mapping
	double totalPaid; 	//Sum of Expense_Payment_Mapping

	@OneToMany(fetch = FetchType.LAZY)
	@Nullable
	List<ProductItem> productList;
	
	@OneToMany(fetch = FetchType.LAZY)
	@Nullable
	List<Payment> paymentList;

	int enteredBy;
	Date enteredOn;
	Date modifiedOn;
	int ownerId;

	
	public Expense() {}
	
	public Expense(int id, int enteredBy, Date enteredOn, int ownerId,  String taxApplied, String fullPaid,
			String transactionType, Organization vender, double totalAmount, double totalPaid,
			List<ProductItem> productList, List<Payment> paymentList) {
		this.enteredBy=enteredBy;
		this.enteredOn=enteredOn;
		this.ownerId=ownerId;
	
		this.id = id;
		this.taxApplied = taxApplied;
		this.fullPaid = fullPaid;
		this.transactionType = transactionType;
		this.vender = vender;
		this.totalAmount = totalAmount;
		this.totalPaid = totalPaid;
		this.productList = productList;
		this.paymentList = paymentList;
	}
	
	public Expense(int enteredBy, Date enteredOn, int ownerId,  String taxApplied, String fullPaid,
			String transactionType, Organization vender, double totalAmount, double totalPaid,
			List<ProductItem> productList, List<Payment> paymentList) {
		this.enteredBy=enteredBy;
		this.enteredOn=enteredOn;
		this.ownerId=ownerId;
	
		this.taxApplied = taxApplied;
		this.fullPaid = fullPaid;
		this.transactionType = transactionType;
		this.vender = vender;
		this.totalAmount = totalAmount;
		this.totalPaid = totalPaid;
		this.productList = productList;
		this.paymentList = paymentList;
	}
	
	public Expense(int enteredBy, Date enteredOn, int ownerId,  String taxApplied, String fullPaid,
			String transactionType, Organization vender, double totalAmount, double totalPaid) {
		this.enteredBy=enteredBy;
		this.enteredOn=enteredOn;
		this.ownerId=ownerId;
	
		this.taxApplied = taxApplied;
		this.fullPaid = fullPaid;
		this.transactionType = transactionType;
		this.vender = vender;
		this.totalAmount = totalAmount;
		this.totalPaid = totalPaid;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}


	public Organization getVender() {
		return vender;
	}

	public void setVender(Organization vender) {
		this.vender = vender;
	}

	public double getTotalAmount() {
		return totalAmount;
	}

	public void setTotalAmount(double totalAmount) {
		this.totalAmount = totalAmount;
	}

	public double getTotalPaid() {
		return totalPaid;
	}

	public void setTotalPaid(double totalPaid) {
		this.totalPaid = totalPaid;
	}

	public List<ProductItem> getProductList() {
		return productList;
	}

	public void setProductList(List<ProductItem> productList) {
		this.productList = productList;
	}

	public List<Payment> getPaymentList() {
		return paymentList;
	}

	public void setPaymentList(List<Payment> paymentList) {
		this.paymentList = paymentList;
	}

	public String getTaxApplied() {
		return taxApplied;
	}

	public void setTaxApplied(String taxApplied) {
		this.taxApplied = taxApplied;
	}

	public String getFullPaid() {
		return fullPaid;
	}

	public void setFullPaid(String fullPaid) {
		this.fullPaid = fullPaid;
	}

	public String getTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
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
	

	public Date getModifiedOn() {
		return modifiedOn;
	}

	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}

	@Override
	public String toString() {
		return "Expense [id=" + id + ", taxApplied=" + taxApplied + ", fullPaid=" + fullPaid + ", transactionType="
				+ transactionType + ", vender=" + vender.getOrgName() + ", totalAmount=" + totalAmount + ", totalPaid=" + totalPaid
				+ ", enteredBy=" + enteredBy
				+ ", enteredOn=" + enteredOn + ", ownerId=" + ownerId + "]";
	}

	
	
	
	
}
