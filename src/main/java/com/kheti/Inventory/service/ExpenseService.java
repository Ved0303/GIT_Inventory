package com.kheti.Inventory.service;

import java.util.ArrayList;
import java.util.List;
import java.util.Optional;
import java.util.stream.Collectors;
import java.util.stream.StreamSupport;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kheti.Inventory.model.Expense;
import com.kheti.Inventory.repository.ExpenseRepository;

@Service
public class ExpenseService {
	
	@Autowired
	ExpenseRepository expenseRepository;
	
	public int saveExpense(Expense expense) {	
		expenseRepository.save(expense);
		System.out.println("Expense with ID saved: "+expense.getId());
		return expense.getId();
	}
	
	public Expense getExpense(int expenseId) {
		Optional<Expense> expense= expenseRepository.findById(expenseId);
		
		return expense.isPresent()? expense.get() : null;
	}
	
	/*
	 * public List<Expense> getAllExpense() { Iterable<Expense> expenseIter =
	 * expenseRepository.findAll(); List<Expense> expenseList=
	 * StreamSupport.stream(expenseIter.spliterator(),
	 * false).collect(Collectors.toList()); return expenseList; }
	 */	public List<Expense> getAllExpense(int ownerId) {
		List<Expense> expenseList = expenseRepository.findByOwnerId(ownerId);
		if(expenseList==null) {
			expenseList=new ArrayList<>();
		}
		return expenseList;
	}
}
