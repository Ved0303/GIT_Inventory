package com.kheti.Inventory.repository;

import org.springframework.data.repository.CrudRepository;

import com.kheti.Inventory.model.ProductItem;

public interface ProductItemRepository extends CrudRepository<ProductItem, Integer> {

}
