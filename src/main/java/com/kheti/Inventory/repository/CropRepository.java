package com.kheti.Inventory.repository;

import org.springframework.data.repository.CrudRepository;

import com.kheti.Inventory.model.Crop;

public interface CropRepository extends CrudRepository<Crop, Integer> {

}
