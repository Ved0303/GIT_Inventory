package com.kheti.Inventory.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.kheti.Inventory.model.User;
import com.kheti.Inventory.repository.UserRepository;

@Service
public class LoginService {

	@Autowired
	UserRepository userDao ;
	
	public User getUser(String userid, String password) {
	
		List<User> users= userDao.findByNameAndPassword(userid, password);
		if(users!=null && users.size()>0)
			return users.get(0);
		else
			return null;
	}

}
