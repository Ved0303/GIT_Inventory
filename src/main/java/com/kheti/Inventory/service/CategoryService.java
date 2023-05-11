package com.kheti.Inventory.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kheti.Inventory.model.Category;
import com.kheti.Inventory.repository.CategoryRepository;

@Service
public class CategoryService {

	@Autowired
	CategoryRepository categoryRepository;

	public int saveCategory(Category category) {
		categoryRepository.save(category);
		System.out.println("Category with ID saved: " + category.getId());
		return category.getId();
	}

	public Category getCategory(int categoryId) {
		Optional<Category> category = categoryRepository.findById(categoryId);

		return category.isPresent() ? category.get() : null;
	}

	public List<Category> getAllCategory() {
		Iterable<Category> categoryIter = categoryRepository.findAll();
		List<Category> categoryList = StreamSupport.stream(categoryIter.spliterator(), false)
				.collect(Collectors.toList());
		if (categoryList == null) {
			categoryList = new ArrayList<Category>();
		}
		return categoryList;
	}

	public List<Category> getAllCategory(int ownerId) {
		List<Category> categoryList = categoryRepository.findByOwnerId(ownerId);
		if (categoryList == null) {
			categoryList = new ArrayList<Category>();
		}
		return categoryList;
	}
}
