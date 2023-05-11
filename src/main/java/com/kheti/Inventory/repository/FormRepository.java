package com.kheti.Inventory.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.kheti.Inventory.model.Form;

public interface FormRepository extends CrudRepository<Form, Integer> {

	List<Form> findByOwnerId(int ownerId);

}
