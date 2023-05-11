package com.kheti.Inventory.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.kheti.Inventory.model.ManPower;

public interface ManPowerRepository extends CrudRepository<ManPower, Integer> {

	List<ManPower> findByOwnerId(int ownerId);

}
