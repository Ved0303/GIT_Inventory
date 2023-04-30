package com.kheti.Inventory.model;

import java.util.Date;
import java.util.List;

import jakarta.annotation.Nullable;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Expense extends BaseTransaction {

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	int id;
	
	String isTaxApplied;//yes/no
	String isFullPaid;//full/partial
	String transactionType;//purchase/sell

	Organization vender;
	
	double totalAmount; //Sum of Expense_Product_Mapping
	double totalPaid; 	//Sum of Expense_Payment_Mapping

	@OneToMany(fetch = FetchType.LAZY)
	@Nullable
	List<ProductItem> productList;
	
	@OneToMany(fetch = FetchType.LAZY)
	@Nullable
	List<Payment> paymentList;

	public Expense() {}
	
	public Expense(int id, int enteredBy, Date enteredOn, int ownerId,  String isTaxApplied, String isFullPaid,
			String transactionType, Organization vender, double totalAmount, double totalPaid,
			List<ProductItem> productList, List<Payment> paymentList) {
		super(enteredBy, enteredOn, ownerId);
		this.id = id;
		this.isTaxApplied = isTaxApplied;
		this.isFullPaid = isFullPaid;
		this.transactionType = transactionType;
		this.vender = vender;
		this.totalAmount = totalAmount;
		this.totalPaid = totalPaid;
		this.productList = productList;
		this.paymentList = paymentList;
	}
	
	public Expense(int enteredBy, Date enteredOn, int ownerId,  String isTaxApplied, String isFullPaid,
			String transactionType, Organization vender, double totalAmount, double totalPaid,
			List<ProductItem> productList, List<Payment> paymentList) {
		super(enteredBy, enteredOn, ownerId);
		this.isTaxApplied = isTaxApplied;
		this.isFullPaid = isFullPaid;
		this.transactionType = transactionType;
		this.vender = vender;
		this.totalAmount = totalAmount;
		this.totalPaid = totalPaid;
		this.productList = productList;
		this.paymentList = paymentList;
	}
	
	public Expense(int enteredBy, Date enteredOn, int ownerId,  String isTaxApplied, String isFullPaid,
			String transactionType, Organization vender, double totalAmount, double totalPaid) {
		super(enteredBy, enteredOn, ownerId);
		this.isTaxApplied = isTaxApplied;
		this.isFullPaid = isFullPaid;
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

	public String isTaxApplied() {
		return isTaxApplied;
	}

	public void setTaxApplied(String isTaxApplied) {
		this.isTaxApplied = isTaxApplied;
	}

	public String isFullPaid() {
		return isFullPaid;
	}

	public void setFullPaid(String isFullPaid) {
		this.isFullPaid = isFullPaid;
	}

	public String isTransactionType() {
		return transactionType;
	}

	public void setTransactionType(String transactionType) {
		this.transactionType = transactionType;
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
	
}
