package com.kheti.Inventory.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kheti.Inventory.model.WearHouse;
import com.kheti.Inventory.repository.WearHouseRepository;

@Service
public class WearHouseService {
	
	@Autowired
	WearHouseRepository wearHouseRepository;
	
	public int saveWearHouse(WearHouse wearHouse) {	
		wearHouseRepository.save(wearHouse);
		System.out.println("WearHouse with ID saved: "+wearHouse.getId());
		return wearHouse.getId();
	}
	
	public WearHouse getWearHouse(int wearHouseId) {
		Optional<WearHouse> wearHouse= wearHouseRepository.findById(wearHouseId);
		
		return wearHouse.isPresent()? wearHouse.get() : null;
	}
	
	/*
	 * public List<WearHouse> getAllWearHouse() { Iterable<WearHouse> wearHouseIter
	 * = wearHouseRepository.findAll(); List<WearHouse> wearHouseList=
	 * StreamSupport.stream(wearHouseIter.spliterator(),
	 * false).collect(Collectors.toList()); return wearHouseList; }
	 */
	public List<WearHouse> getAllWearHouse(int ownerId) {
		List<WearHouse> wearHouseList = wearHouseRepository.findByOwnerId(ownerId);
		if(wearHouseList==null) {
			wearHouseList=new ArrayList<>();
		}
		return wearHouseList;
	}
}
