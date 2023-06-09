package com.kheti.Inventory.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.kheti.Inventory.model.WearHouse;

public interface WearHouseRepository extends CrudRepository<WearHouse, Integer> {

	List<WearHouse> findByOwnerId(int ownerId);

}
