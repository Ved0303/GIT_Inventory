package com.kheti.Inventory.repository;

import java.util.List;

import org.springframework.data.repository.CrudRepository;

import com.kheti.Inventory.model.User;

public interface UserRepository extends CrudRepository<User, Integer> {
	
	List<User> findByNameAndPassword(String name, String password);
	

}
