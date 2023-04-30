package com.kheti.Inventory.repository;

import org.springframework.data.repository.CrudRepository;

import com.kheti.Inventory.model.Expense;

public interface ExpenseRepository extends CrudRepository<Expense, Integer> {

}
