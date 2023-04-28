package com.kheti.Inventory.model;

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
public class Category {
	@Id
	@GeneratedValue(strategy=GenerationType.AUTO)	
	int id;
	
	String equipmentType;
	String inboundOutbound;
	String categoryName;
	int ownerId;
	
	@ManyToOne(fetch = FetchType.LAZY) 
	@Nullable
	Category parentCategory;
	
	@OneToMany(fetch = FetchType.LAZY)
	@Nullable
	List<Category> childCategories;

	
	public Category() {}
	
	public Category(int id, String equipmentType, String inboundOutbound, String categoryName, int ownerId) {
		super();
		this.id = id;
		this.equipmentType = equipmentType;
		this.inboundOutbound = inboundOutbound;
		this.categoryName = categoryName;
		this.ownerId = ownerId;
	}

	public Category(String equipmentType, String inboundOutbound, String categoryName, int ownerId) {
		super();
		this.equipmentType = equipmentType;
		this.inboundOutbound = inboundOutbound;
		this.categoryName = categoryName;
		this.ownerId = ownerId;
	}



	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}

	public String getEquipmentType() {
		return equipmentType;
	}

	public void setEquipmentType(String equipmentType) {
		this.equipmentType = equipmentType;
	}

	public String getInboundOutbound() {
		return inboundOutbound;
	}

	public void setInboundOutbound(String inboundOutbound) {
		this.inboundOutbound = inboundOutbound;
	}

	public String getCategoryName() {
		return categoryName;
	}

	public void setCategoryName(String categoryName) {
		this.categoryName = categoryName;
	}

	public Category getParentCategory() {
		return parentCategory;
	}

	public void setParentCategory(Category parentCategory) {
		this.parentCategory = parentCategory;
	}

	public List<Category> getChildCategories() {
		return childCategories;
	}

	public void setChildCategories(List<Category> childCategories) {
		this.childCategories = childCategories;
	}

	public int getOwnerId() {
		return ownerId;
	}

	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}
	
	
	
	
}
