package com.kheti.Inventory.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.kheti.Inventory.model.Organization;

public interface OrganizationRepository extends CrudRepository<Organization, Integer> {

	List<Organization> findByOwnerId(int ownerId);

}
