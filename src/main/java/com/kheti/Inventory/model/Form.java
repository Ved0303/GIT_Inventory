package com.kheti.Inventory.model;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.OneToMany;

@Entity
public class Form {

	 @Id
	 @GeneratedValue(strategy=GenerationType.AUTO)
    private int formId;
    private String formName;
    private float area;
    private String areaType;
    private float cultivationArea;
    private String address1;
    private String address2;
    private String city;
    private String state;
    private int valveCapacity;

    private int ownerId;
    private int modifiedBy;
    private Date modifiedOn;
    
    @OneToMany
    List<Crop> cropList;
    
    public Form() {   	
    }
    
	public Form(int formId, String formName, float area, String areaType, float cultivationArea, String address1,
			String address2, String city, String state, int valveCapacity, int ownerId, int modifiedBy,
			Date modifiedOn) {
		super();
		this.formId = formId;
		this.formName = formName;
		this.area = area;
		this.areaType = areaType;
		this.cultivationArea = cultivationArea;
		this.address1 = address1;
		this.address2 = address2;
		this.city = city;
		this.state = state;
		this.valveCapacity = valveCapacity;
		this.ownerId = ownerId;
		this.modifiedBy = modifiedBy;
		this.modifiedOn = modifiedOn;
	}
	
	public Form( String formName, float area, String areaType, float cultivationArea, String address1,
			String address2, String city, String state, int valveCapacity, int ownerId, int modifiedBy,
			Date modifiedOn) {
		super();
		this.formName = formName;
		this.area = area;
		this.areaType = areaType;
		this.cultivationArea = cultivationArea;
		this.address1 = address1;
		this.address2 = address2;
		this.city = city;
		this.state = state;
		this.valveCapacity = valveCapacity;
		this.ownerId = ownerId;
		this.modifiedBy = modifiedBy;
		this.modifiedOn = modifiedOn;
	}
	
	public int getFormId() {
		return formId;
	}
	public void setFormId(int formId) {
		this.formId = formId;
	}
	public String getFormName() {
		return formName;
	}
	public void setFormName(String formName) {
		this.formName = formName;
	}
	public float getArea() {
		return area;
	}
	public void setArea(float area) {
		this.area = area;
	}
	public String getAreaType() {
		return areaType;
	}
	public void setAreaType(String areaType) {
		this.areaType = areaType;
	}
	public float getCultivationArea() {
		return cultivationArea;
	}
	public void setCultivationArea(float cultivationArea) {
		this.cultivationArea = cultivationArea;
	}
	public String getAddress1() {
		return address1;
	}
	public void setAddress1(String address1) {
		this.address1 = address1;
	}
	public String getAddress2() {
		return address2;
	}
	public void setAddress2(String address2) {
		this.address2 = address2;
	}
	public String getCity() {
		return city;
	}
	public void setCity(String city) {
		this.city = city;
	}
	public String getState() {
		return state;
	}
	public void setState(String state) {
		this.state = state;
	}
	public int getValveCapacity() {
		return valveCapacity;
	}
	public void setValveCapacity(int valveCapacity) {
		this.valveCapacity = valveCapacity;
	}
	public int getOwnerId() {
		return ownerId;
	}
	public void setOwnerId(int ownerId) {
		this.ownerId = ownerId;
	}
	public int getModifiedBy() {
		return modifiedBy;
	}
	public void setModifiedBy(int modifiedBy) {
		this.modifiedBy = modifiedBy;
	}
	public Date getModifiedOn() {
		return modifiedOn;
	}
	public void setModifiedOn(Date modifiedOn) {
		this.modifiedOn = modifiedOn;
	}
	
	
	
	public List<Crop> getCropList() {
		return cropList;
	}

	public void setCropList(List<Crop> cropList) {
		this.cropList = cropList;
	}

	@Override
	public String toString() {
		return "Form [formId=" + formId + ", formName=" + formName + ", area=" + area + ", areaType=" + areaType
				+ ", cultivationArea=" + cultivationArea + ", address1=" + address1 + ", address2=" + address2 + ", city="
				+ city + ", state=" + state + ", valveCapacity=" + valveCapacity + ", ownerId=" + ownerId
				+ ", modifiedBy=" + modifiedBy + ", modifiedOn=" + modifiedOn + "]";
	}

    
    

}
