package com.kheti.Inventory.repository;

import org.springframework.data.repository.CrudRepository;

import com.kheti.Inventory.model.Category;

public interface CategoryRepository extends CrudRepository<Category, Integer> {

}
