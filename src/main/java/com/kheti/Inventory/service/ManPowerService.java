package com.kheti.Inventory.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kheti.Inventory.model.ManPower;
import com.kheti.Inventory.repository.ManPowerRepository;

@Service
public class ManPowerService {
	
	@Autowired
	ManPowerRepository manPowerRepository;
	
	public int saveManPower(ManPower manPower) {	
		manPowerRepository.save(manPower);
		System.out.println("ManPower with ID saved: "+manPower.getId());
		return manPower.getId();
	}
	
	public ManPower getManPower(int manPowerId) {
		Optional<ManPower> manPower= manPowerRepository.findById(manPowerId);
		
		return manPower.isPresent()? manPower.get() : null;
	}
	
	public List<ManPower> getAllManPower() {
		Iterable<ManPower> manPowerIter = manPowerRepository.findAll();
		List<ManPower> manPowerList= StreamSupport.stream(manPowerIter.spliterator(), false).collect(Collectors.toList());
		return manPowerList;
	}
}
