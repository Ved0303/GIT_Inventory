package com.kheti.Inventory.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kheti.Inventory.model.Organization;
import com.kheti.Inventory.repository.OrganizationRepository;

@Service
public class OrganizationService {
	
	@Autowired
	OrganizationRepository organizationRepository;
	
	public int saveOrganization(Organization organization) {	
		organizationRepository.save(organization);
		System.out.println("Organization with ID saved: "+organization.getOrgID());
		return organization.getOrgID();
	}
	
	public Organization getOrganization(int organizationId) {
		Optional<Organization> organization= organizationRepository.findById(organizationId);
		
		return organization.isPresent()? organization.get() : null;
	}
	
	public List<Organization> getAllOrganization() {
		Iterable<Organization> organizationIter = organizationRepository.findAll();
		List<Organization> organizationList= StreamSupport.stream(organizationIter.spliterator(), false).collect(Collectors.toList());
		return organizationList;
	}
}
