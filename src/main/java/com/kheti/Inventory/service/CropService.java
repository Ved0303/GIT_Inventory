package com.kheti.Inventory.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kheti.Inventory.model.Crop;
import com.kheti.Inventory.repository.CropRepository;

@Service
public class CropService {
	
	@Autowired
	CropRepository cropRepository;

	
	public int saveCrop(Crop crop) {
	
		cropRepository.save(crop);
		System.out.println("crop with ID saved: "+crop.getCropId());
		return crop.getCropId();
	}
	
	public Crop getCrop(int cropId) {
		return cropRepository.findById(cropId).get();
	}


}
