package com.kheti.Inventory.service;

import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kheti.Inventory.model.ProductItem;
import com.kheti.Inventory.repository.ProductItemRepository;

@Service
public class ProductService {
	
	@Autowired
	ProductItemRepository productItemRepository;
	
	public int saveProductItem(ProductItem productItem) {	
		productItemRepository.save(productItem);
		System.out.println("ProductItem with ID saved: "+productItem.getId());
		return productItem.getId();
	}
	
	public ProductItem getProductItem(int productItemId) {
		Optional<ProductItem> productItem= productItemRepository.findById(productItemId);
		
		return productItem.isPresent()? productItem.get() : null;
	}
	
	public List<ProductItem> getAllProductItem() {
		Iterable<ProductItem> productItemIter = productItemRepository.findAll();
		List<ProductItem> productItemList= StreamSupport.stream(productItemIter.spliterator(), false).collect(Collectors.toList());
		return productItemList;
	}
}
