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
public class ProductItem extends BaseTransaction{

	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)
	int id;
	
	@ManyToOne(fetch = FetchType.LAZY) 
	@Nonnull
	Expense expense;
	
	Category category;
	
	String productName;
	String brandName;
	
	String unitType;
	String subUnitType;
	double quantity;
	double unitPrice;	
	double taxPercentage;//max 100
	Date expiryDate;
	
	public ProductItem() {}
	
	public ProductItem(int id, int enteredBy, Date enteredOn, int ownerId,  Expense expense, Category category,
			String productName, String brandName, String unitType, String subUnitType, double quantity,
			double unitPrice, double taxPercentage, Date expiryDate) {
		super(enteredBy, enteredOn, ownerId);
		this.id = id;
		this.expense = expense;
		this.category = category;
		this.productName = productName;
		this.brandName = brandName;
		this.unitType = unitType;
		this.subUnitType = subUnitType;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.taxPercentage = taxPercentage;
		this.expiryDate = expiryDate;
	}
	
	public ProductItem(int enteredBy, Date enteredOn, int ownerId, Expense expense, Category category,
			String productName, String brandName, String unitType, String subUnitType, double quantity,
			double unitPrice, double taxPercentage, Date expiryDate) {
		super(enteredBy, enteredOn, ownerId);
		this.expense = expense;
		this.category = category;
		this.productName = productName;
		this.brandName = brandName;
		this.unitType = unitType;
		this.subUnitType = subUnitType;
		this.quantity = quantity;
		this.unitPrice = unitPrice;
		this.taxPercentage = taxPercentage;
		this.expiryDate = expiryDate;
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

	public Category getCategory() {
		return category;
	}

	public void setCategory(Category category) {
		this.category = category;
	}

	public String getProductName() {
		return productName;
	}

	public void setProductName(String productName) {
		this.productName = productName;
	}

	public String getBrandName() {
		return brandName;
	}

	public void setBrandName(String brandName) {
		this.brandName = brandName;
	}

	public String getUnitType() {
		return unitType;
	}

	public void setUnitType(String unitType) {
		this.unitType = unitType;
	}

	public String getSubUnitType() {
		return subUnitType;
	}

	public void setSubUnitType(String subUnitType) {
		this.subUnitType = subUnitType;
	}

	public double getQuantity() {
		return quantity;
	}

	public void setQuantity(double quantity) {
		this.quantity = quantity;
	}

	public double getUnitPrice() {
		return unitPrice;
	}

	public void setUnitPrice(double unitPrice) {
		this.unitPrice = unitPrice;
	}

	public double getTaxPercentage() {
		return taxPercentage;
	}

	public void setTaxPercentage(double taxPercentage) {
		this.taxPercentage = taxPercentage;
	}

	public Date getExpiryDate() {
		return expiryDate;
	}

	public void setExpiryDate(Date expiryDate) {
		this.expiryDate = expiryDate;
	}

	
	

	
	
}
