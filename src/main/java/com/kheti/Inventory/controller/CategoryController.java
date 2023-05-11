package com.kheti.Inventory.controller;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import com.kheti.Inventory.model.Category;
import com.kheti.Inventory.model.User;
import com.kheti.Inventory.service.CategoryService;

import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpSession;

@Controller
public class CategoryController {

	@Autowired
	CategoryService categoryService;

	@RequestMapping(value = "/createCategory", method = RequestMethod.GET)
	public String showCreateCategoryPage(ModelMap model, HttpServletRequest request) {
		System.out.println("Category Controller -> showCreateCategoryPage");
		String categoryId=request.getParameter("categoryId");
		Category category=null;
		if(categoryId!=null && !categoryId.isBlank()) {
			category=categoryService.getCategory(Integer.parseInt(categoryId));
			
		}
		model.put("category", category==null ?new Category() : category);
		List<Category> categoryList= categoryService.getAllCategory();
		System.out.println("categoryList size="+categoryList.size());
		request.setAttribute("categoryList", categoryList);
		
		return "createCategory";
	}

	@RequestMapping(value = "/createCategory", method = RequestMethod.POST)
	public String createCategory(@ModelAttribute Category category, ModelMap model, HttpServletRequest request, HttpSession session) {
	System.out.println("Category Controller -> createCategory CategoryName: " + request.getParameter("categoryName"));

		User user=(User)session.getAttribute("user");
		category.setOwnerId(user.getOwnerId());
		
		int parentCategoryId=Integer.parseInt(request.getParameter("parentCategoryId"));
		if(parentCategoryId == -1) {
			category.setParentCategory(null);
		}else {
			Category parentCategory=categoryService.getCategory(parentCategoryId);
			System.out.println("Found parentCategory: "+parentCategory.getCategoryName());
			category.setParentCategory(parentCategory);
		}
	
		int newCategoryId = categoryService.saveCategory(category);
		System.out.println("New Category Created with ID: " + newCategoryId);
		model.put("category", category);
		model.put("errorMessage", "Record Saved Successfully");
		List<Category> categoryList= categoryService.getAllCategory();	
		request.setAttribute("categoryList", categoryList);

		return "createCategory";
	}
	
	@RequestMapping(value = "/listCategory", method = RequestMethod.GET)
	public String listCategory(HttpServletRequest request) {
		System.out.println("Category Controller -> listCategory");
		
		List<Category> categoryList= categoryService.getAllCategory();	
		request.setAttribute("categoryList", categoryList);

		return "listCategory";
	}

}
