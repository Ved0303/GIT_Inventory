package com.kheti.Inventory.model;

import java.util.Date;
import java.util.List;

import jakarta.persistence.Entity;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;

@Entity
public class Crop {

	@Id
	@GeneratedValue(strategy = GenerationType.AUTO)
	private int cropId;
	private int formId;
	private String cropName;
	private String cropVariety;
	private float cropArea;
	private boolean isActive;
	private Date startDate;
	private Date endDate;
	private int updatedBy;
	private Date updatedOn;
	private String valveList;

	public Crop() {
	}

	public Crop(int cropId, int formId, String cropName, String cropVariety, float cropArea, boolean isActive,
			Date startDate, Date endDate, int updatedBy, Date updatedOn, String valveList) {
		super();
		this.cropId = cropId;
		this.formId = formId;
		this.cropName = cropName;
		this.cropVariety = cropVariety;
		this.cropArea = cropArea;
		this.isActive = isActive;
		this.startDate = startDate;
		this.endDate = endDate;
		this.updatedBy = updatedBy;
		this.updatedOn = updatedOn;
		this.valveList = valveList;
	}

	public Crop(int formId, String cropName, String cropVariety, float cropArea, boolean isActive, Date startDate,
			Date endDate, int updatedBy, Date updatedOn, String valveList) {
		super();
		this.formId = formId;
		this.cropName = cropName;
		this.cropVariety = cropVariety;
		this.cropArea = cropArea;
		this.isActive = isActive;
		this.startDate = startDate;
		this.endDate = endDate;
		this.updatedBy = updatedBy;
		this.updatedOn = updatedOn;
		this.valveList = valveList;
	}

	public int getCropId() {
		return cropId;
	}

	public void setCropId(int cropId) {
		this.cropId = cropId;
	}

	public int getFormId() {
		return formId;
	}

	public void setFormId(int formId) {
		this.formId = formId;
	}

	public String getCropName() {
		return cropName;
	}

	public void setCropName(String cropName) {
		this.cropName = cropName;
	}

	public String getCropVariety() {
		return cropVariety;
	}

	public void setCropVariety(String cropVariety) {
		this.cropVariety = cropVariety;
	}

	public float getCropArea() {
		return cropArea;
	}

	public void setCropArea(float cropArea) {
		this.cropArea = cropArea;
	}

	public boolean isActive() {
		return isActive;
	}

	public void setActive(boolean isActive) {
		this.isActive = isActive;
	}

	public Date getStartDate() {
		return startDate;
	}

	public void setStartDate(Date startDate) {
		this.startDate = startDate;
	}

	public Date getEndDate() {
		return endDate;
	}

	public void setEndDate(Date endDate) {
		this.endDate = endDate;
	}

	public int getUpdatedBy() {
		return updatedBy;
	}

	public void setUpdatedBy(int updatedBy) {
		this.updatedBy = updatedBy;
	}

	public Date getUpdatedOn() {
		return updatedOn;
	}

	public void setUpdatedOn(Date updatedOn) {
		this.updatedOn = updatedOn;
	}

	public String getValveList() {
		return valveList;
	}

	public void setValveList(String valveList) {
		this.valveList = valveList;
	}

	@Override
	public String toString() {
		return "Crop [cropId=" + cropId + ", formId=" + formId + ", cropName=" + cropName + ", cropVariety="
				+ cropVariety + ", cropArea=" + cropArea + ", isActive=" + isActive + ", startDate=" + startDate
				+ ", endDate=" + endDate + ", updatedBy=" + updatedBy + ", updatedOn=" + updatedOn + ", valveList="
				+ valveList + "]";
	}

}
